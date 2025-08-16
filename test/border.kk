import components/border
import components/text
import ui

pub fun main()
  val UiElem(size as (width, height), draw) = ui 
    border
      text("Hi")
  with canvas(size)
  draw(Rect(0, 0, width, height))
  finish()
