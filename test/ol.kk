import components/border
import components/padding
import components/list
import components/space
import components/text
import ui

// Ordered list
fun ol(action : ui-tree<_, _>, sep : string = ".") : _ ()
  vertical
    var i := 1
    with handler
      fun add-child(child)
        horizontal
          text(int/show(i) ++ sep)
          i := i + 1
          space(w=1)
          child.add-child
    action()

fun main()
  ui
    border
      ol
        for(26) fn(i)
          text(show('a' + char(i)))
  .println
