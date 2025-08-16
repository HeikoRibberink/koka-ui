module text

pub import rect
pub import tree
pub import ui
import canvas

pub fun text(text : string)
  fun draw(rect : rect)
    if text.count > rect.w then
      throw("text(" ++ text ++ ") too wide.")
    write(rect.xy, text)
  UiElem((text.count, 1), draw).add-child
