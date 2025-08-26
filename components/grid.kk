module grid

import hlib/ds/matrix
import hlib/ext/vector
import hlib/patterns/common

pub import rect
pub import tree
pub import ui
pub import util

fun sizes-along-axis(matrix : matrix<maybe<ui-elem<_>>>, main-axis : ((int, int)) -> int) : _ vector<int>
  var sizes := vector(matrix.size.main-axis, 0)
  matrix.foreach-indexed fn(idx, x)
    val cross-size = x.map(main-axis.o(ui-elem/size)).default(0)
    sizes[idx.main-axis] := sizes[idx.main-axis].max(cross-size)
  sizes
      
fun grid-matrix(children : list<ui-elem<_>>, rows : int, cols : int)
  var vec := vector(rows * cols, Nothing)
  children.foreach-indexed fn(idx, child)
    vec[idx] := Just(child)
  Matrix(rows, cols, vec)
  
fun positions(sizes : vector<int>)
  var sum := 0
  sizes.map fn(x)
    val ret = sum
    sum := sum + x 
    ret

pub fun grid(rows-cols : (int, int), col-grow : vector<(int) -> int>, row-grow : vector<(int) -> int>, action : ui-tree<_, _>, ?kk-file-line : string)
  val (rows, cols) = rows-cols
  val children : list<ui-elem<_>> = children(action)
  val children-grid : matrix<maybe<ui-elem<_>>> = children.grid-matrix(rows, cols)
  val col-sizes : vector<int> = children-grid.sizes-along-axis(fst)
  val row-sizes : vector<int> = children-grid.sizes-along-axis(snd)
  val tot-size = (col-sizes.sum, row-sizes.sum)
  fun draw(rect : rect)
    val (extra-w, extra-h) = get-extra-size(rect, tot-size)
    val grown-col-sizes : vector<int> = col-sizes.map-indexed fn(i, x) x + col-grow[i](extra-w)
    val grown-row-sizes : vector<int> = row-sizes.map-indexed fn(i, x) x + row-grow[i](extra-h)
    val x-pos : vector<int> = grown-col-sizes.positions
    val y-pos : vector<int> = grown-row-sizes.positions
    children-grid.foreach-indexed fn((r, c), child)
      match child
        Just(UiElem(_, subdraw)) ->
          val w = grown-col-sizes[c]
          val h = grown-row-sizes[r]
          val x = x-pos[c]
          val y = y-pos[r]
          val sub = rect.slice(x, y, w, h)
          subdraw(sub)
        Nothing -> ()
  UiElem(tot-size, draw).add-child
