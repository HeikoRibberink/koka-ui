module border

pub import ui

val hori = '─'
val vert = '│'
val topleft = '┌'
val topright = '┐'
val botleft = '└'
val botright = '┘'

pub fun border(action : ui-tree<_, _>, ?kk-file-line : string)
  val UiElem(subsize, subdraw) = single-child(action).expect(?kk-file-line ++ ": padding expects a single child.")
  val size = subsize + (2, 2)
  fun draw(rect : rect) : <exn,canvas> ()
    set(rect.xy, topleft)
    set(rect.xy + (1,0) * (rect.w - 1), topright)
    set(rect.xy + (0,1) * (rect.h - 1), botleft)
    set(rect.xy + (rect.wh + (-1, -1)), botright)
    [0, rect.w - 1].map fn(dx)
      for(1, rect.h - 2) fn(dy)
        set(rect.xy + (dx, dy), vert)
    [0, rect.h - 1].map fn(dy)
      for(1, rect.w - 2) fn(dx)
        set(rect.xy + (dx, dy), hori)
    rect.slice(x=1, y=1, w= -1, h= -1).subdraw
  UiElem(size, draw).add-child
