module ui

import std/num/ddouble

pub import hlib/math

pub import rect
pub import tree
pub import canvas

pub type ui-elem<e>
  UiElem
    size : ivec2
    draw : (rect) -> <canvas|e> ()

pub alias ui-parent<e> = <parent<ui-elem<e>>>

pub alias ui-tree<e,f> = () -> <ui-parent<e>|f> ()

pub fun ui(action : ui-tree<e,<exn|f>>) : <exn|f> ui-elem<e>
  with handler
    ctl add-child(child)
      child
    return(_)
      throw("Expected to get exactly one ui root element.")
  action()

pub fun ui-elem/show(elem : ui-elem<_>) : _ string
  val (w, h) = elem.size
  with canvas(elem.size)
  elem.draw.(Rect(0, 0, w, h))
  render()

pub fun get-extra-size(rect : rect, size : (int, int), ?kk-file-line : string) : exn (int, int)
  val extra-size = rect.wh - size
  if extra-size.fst < 0 || extra-size.snd < 0 then
    assert(show(rect) ++ " must be equal or larger than the required minimum size " ++ show(size) ++ ". This may be solved by either increasing the size of an ancestor or shrinking the size of children or neighbours, if it has any.", False)
  extra-size
