module center

import hlib/math
import hlib/patterns/common

pub import rect
pub import ui

// Centers its child using their minimal size.
pub fun center(action : ui-tree<_, _>, ?kk-file-line : string)
  val elem = single-child(action).expect(?kk-file-line ++ ": center expects a single child.")
  fun draw(rect : rect)
    val (x2, y2) = (rect.wh - elem.size)
    val (x, y) = (x2 / 2, y2 / 2)
    val (w, h) = elem.size
    elem.ui-elem/draw.(rect.slice(x, y, w, h))
  UiElem(elem.size, draw).add-child
  
