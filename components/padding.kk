module padding

pub import ui

pub fun padding(left : int = 0, top : int = 0, right : int = 0, bottom : int = 0, action : ui-tree<_, _>, ?kk-file-line : string) : <ui-parent<_>,exn> ()
  val UiElem(subsize, subdraw) = single-child(action).expect(?kk-file-line ++ ": padding expects a single child.")
  val size = subsize + (left + right, top + bottom)
  fun draw(rect : rect)
    rect.slice(x = left, y = top, w = ~right, h = ~bottom).subdraw
  UiElem(size, draw).add-child
