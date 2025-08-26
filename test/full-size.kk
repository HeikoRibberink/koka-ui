import components/border
import components/flex
import components/grid
import components/padding
import components/list
import components/space
import components/text
import ui
import util

import std/os/readline

fun main()
  val elem = ui
    vflex
      no-grow
        border
          hflex
            with grow(33.percent)
            text("Test layout")
            text("Here")
            text("In this place")
      grow(100.percent)
        hflex
          grow(20.percent)
            border
              with vertical
              text("A")
              text("side")
              text("bar?")
          grow(80.percent)
            vflex
              with grow((100/3).percent)
              text("More text!")
              border
                vflex
                  grow(50.percent) {space()}
                  no-grow
                    text("And more!")
  while {True}
    val (rows, cols) = get-terminal-size()
    val size = (cols, rows)
    with canvas(size)
    elem.draw.(Rect(0, 0, cols, rows))
    clear-screen()
    render().print
    readline().ignore
