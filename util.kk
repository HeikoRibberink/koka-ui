module util

import hlib/patterns/common
import std/os/process

pub fun percent(p : int) : (int -> e int)
  fn(x)
    x * p / 100

// Returns the terminal size using `stty` (UNIX systems only afaik) in (rows, columns)
pub fun get-terminal-size() : io (int, int)
  val [a, b] = 
    run-system-read("stty size")
    .exn
    .trim
    .split(" ")
    .map(maybe/unjust.o(parse-int))
  (a, b)

// Helper function to clear the screen on UNIX.
pub fun clear-screen()
  print("\x1b[2J\x1b[H")
