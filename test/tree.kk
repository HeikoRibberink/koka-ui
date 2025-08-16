import components/list
import components/text
import components/space
import ui

fun main()
  val UiElem(size as (width, height), draw) = ui 
    vertical
      horizontal
        text("Hi")
        space(h=1)
        text("Big")
        text("Man")
      text("There")
      text("World")
  with canvas(size)
  draw(Rect(0, 0, width, height))
  finish()
