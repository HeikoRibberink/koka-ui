module canvas

pub import math
pub import ds/indexed
pub import rect

pub effect canvas
  fun size() : ivec2
  fun set(idx : ivec2, assigned : char) : ()
  fun render() : string

pub fun canvas(wh : ivec2, action)
  val (width, height) = wh
  // Fill array with spaces
  var v := vector((width + 1) * height - 1, ' ')
  // Fill last array with newlines
  for(1, height - 1) fn(i)
    v[i * (width + 1) - 1] := '\n'
  with handler
    fun size()
      wh
    fun set(idx, assigned)
      val (x, y) = idx
      v[x + y * (width + 1)] := assigned
    fun render()
      v.string
  action()

pub fun write(idx : ivec2, text : string)
  with index-in(text)
  text.foreach fn(c)
    with i <- take-increment
    set(idx + (1, 0) * i, c)

// Draw nothing
pub val nodraw : (rect : rect) -> canvas () = ignore
