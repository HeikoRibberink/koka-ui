module list

pub import rect
pub import tree
pub import ui

fun anylist(to-main : ((int, int)) -> int, to-cross : ((int, int)) -> int, to-coord : (main : int, cross : int) -> (int, int), action : ui-tree<_, _>)
  val children : list<ui-elem<_>> = children(action)
  val sizes : list<(int, int)> = children.map(size)
  val main-size : int = sizes.map(to-main).sum
  val cross-size : int = sizes.map(to-cross).foldl(0, int/max)
  fun draw(rect : rect)
    var m := 0 // Position along main axis
    children.foreach fn(UiElem(subsize, subdraw))
      val ml = subsize.to-main // Main axis length
      val (subw, subh) = to-coord(ml, cross-size)
      val (subx, suby) = to-coord(m, 0)
      val sub = rect.slice(subx, suby, subw, subh)
      m := m + ml
      mask<local> {subdraw(sub)}
  UiElem(to-coord(main-size, cross-size), draw).add-child

pub inline fun horizontal(action : ui-tree<_, _>)
  anylist(tuple2/fst, tuple2/snd, fn(main, cross) (main, cross), action)

pub inline fun vertical(action : ui-tree<_, _>)
  anylist(tuple2/snd, tuple2/fst, fn(main, cross) (cross, main), action)

