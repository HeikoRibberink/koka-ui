module text

pub import rect
pub import tree

fun text(text : string)
  fun draw(rect : rect)
    write(rect, text)
  ((text.count, 1), draw).add-child
