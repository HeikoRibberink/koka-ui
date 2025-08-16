import components/border
import components/padding
import components/list
import components/space
import components/text
import ui

fun main()
  val UiElem(size as (width, height), draw) = ui 
    vertical
      horizontal
        text("Hi")
        vertical
          space(h=1)
          border
            text("Big")
        text("Man")
      text("World")
  with canvas(size)
  draw(Rect(0, 0, width, height))
  finish()
