module flex

pub import rect
pub import tree
pub import ui

abstract type flex-child<e>
  FlexChild
    grow : (int) -> int
    elem : ui-elem<e>

pub alias flex-tree<e,f> = () -> <parent<flex-child<e>>|f> ()

pub fun grow(grow : (int) -> int, action) : _ ()
  with handler
    fun add-child(c)
      add-child(FlexChild(grow, c))
  action()

pub fun no-grow(action)
  grow(fn(_) 0, action)

fun anyflex(to-main : ((int, int)) -> int, to-cross : ((int, int)) -> int, to-coord : (main : int, cross : int) -> (int, int), action : flex-tree<_, _>, ?kk-file-line : string)
  val children : list<flex-child<_>> = children(action)
  val sizes : list<(int, int)> = children.map(size.o(elem))
  val main-size : int = sizes.map(to-main).sum
  val cross-size : int = sizes.map(to-cross).foldl(0, int/max)
  fun draw(rect : rect)
    val extra-size = rect.wh.to-main - main-size
    assert(show(rect) ++ " is too small. Flexbox requires at least " ++ show(main-size) ++ " along the main axis.", extra-size >= 0)
    var m := 0 // Position along main axis
    children.foreach fn(FlexChild(grow, UiElem(subsize, subdraw)))
      val ml = subsize.to-main + grow(extra-size) // Main axis length
      val (subw, subh) = to-coord(ml, cross-size)
      val (subx, suby) = to-coord(m, 0)
      val sub = rect.slice(subx, suby, subw, subh)
      m := m + ml
      mask<local> {subdraw(sub)}
  UiElem(to-coord(main-size, cross-size), draw).add-child

pub inline fun hflex(action : flex-tree<_, _>, ?kk-file-line : string)
  anyflex(tuple2/fst, tuple2/snd, fn(main, cross) (main, cross), action)

pub inline fun vflex(action : flex-tree<_, _>, ?kk-file-line : string)
  anyflex(tuple2/snd, tuple2/fst, fn(main, cross) (cross, main), action)
