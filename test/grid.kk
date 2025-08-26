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
        border {text("TL")}
        border {text("TR")}
        border {text("BL")}
        border {text("BR")}
  val size = elem.size
  for(4) fn(i)
    val gsize as (w, h) = size + (5 * i, 5 * i)
    with canvas(gsize)
    elem.draw()(Rect(0, 0, w, h))
    render().println
