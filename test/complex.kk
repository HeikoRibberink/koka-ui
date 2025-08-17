import components/border
import components/padding
import components/list
import components/space
import components/text
import ui

fun main()
  ui 
    vertical
      horizontal
        text("Hi")
        vertical
          space(h=1)
          border
            text("Big")
        text("Man")
      text("World")
  .println
