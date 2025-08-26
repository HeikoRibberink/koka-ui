import components/border
import components/grid
import components/padding
import components/list
import components/space
import components/text
import ui

fun main()
  val elem = ui
    border
      grid((2, 2), [20.percent, 80.percent].vector, [40.percent, 60.percent].vector)
        text("TL")
        text("TR")
        text("BL")
        text("BR")
  for(4) fn(w)
    val s = 6 + w * 8
    with canvas((s, s))
    elem.draw()(Rect(0, 0, s, s))
    render().println
