module canvas

pub import math
pub import ds/indexed
pub import rect

pub effect canvas
  fun size() : ivec2
  fun set(idx : ivec2, assigned : char) : ()
  fun finish() : ()

pub fun canvas(wh : ivec2, action)
  val (width, height) = wh
  var v := vector(width * height, ' ')
  with handler
    fun size()
      wh
    fun set(idx, assigned)
      val (x, y) = idx
      v[x + y * width] := assigned
    fun finish()
      v.foreach-indexed fn(i, c : char)
        if i % width == width - 1 && i != 0 then
          println(string(c))
        else
          print(string(c))
  action()

pub fun write(idx : ivec2, text : string)
  with index-in(text)
  text.foreach fn(c)
    with i <- take-increment
    set(idx + (1, 0) * i, c)

// Draw nothing
pub val nodraw : (rect : rect) -> canvas () = ignore
