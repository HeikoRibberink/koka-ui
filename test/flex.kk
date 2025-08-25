import components/border
import components/flex
import components/padding
import components/list
import components/space
import components/text
import ui

fun main()
  val elem = ui
    border
      hflex
        no-grow
          text("Hello")
        grow(_ * 1)
          space()
        no-grow 
          text("world!")
  for(4) fn(w)
    with canvas((30, 3))
    elem.draw()(Rect(0, 0, 14 + 5 * w, 3))
    render().println
