module ui

import std/num/ddouble

pub import rect
pub import tree
pub import canvas
pub import math

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
