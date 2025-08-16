import ui
import text
import list

fun main()
  val UiElem(size as (width, height), draw) = ui 
    vertical
      horizontal
        text("Hi")
        text("Big")
        text("Man")
      text("There")
      text("World")
  with canvas(size)
  draw(Rect(0, 0, width, height))
  finish()
