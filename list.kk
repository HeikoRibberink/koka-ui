module list

pub import rect
pub import tree
pub import ui

pub fun vertical(action : ui-tree<_, _>)
  val children : list<ui-elem<_>> = children(action)
  val sizes : list<(int, int)> = children.map(size)
  val width : int = sizes.map(fst).foldl(0, int/max)
  val height : int = sizes.map(snd).sum
  fun draw(rect : rect)
    val cy = ref(0)
    children.foreach fn(UiElem(subsize, subdraw))
      val (_, h) = subsize
      val ny = !cy + h
      val sub = rect.slice(0, !cy, width, h)
      cy.set(ny)
      subdraw(sub)
  UiElem((width, height), draw).add-child

pub fun horizontal(action : ui-tree<_, _>)
  val children : list<ui-elem<_>> = children(action)
  val sizes : list<(int, int)> = children.map(size)
  val width : int = sizes.map(fst).sum
  val height : int = sizes.map(snd).foldl(0, int/max)
  fun draw(rect : rect)
    val cx = ref(0)
    children.foreach fn(UiElem(subsize, subdraw))
      val (w, _) = subsize
      val nx = !cx + w
      val sub = rect.slice(!cx, 0, w, height)
      cx.set(nx)
      subdraw(sub)
  UiElem((width, height), draw).add-child
