module tree

pub effect parent<a>
  fun add-child(child : a) : ()

pub fun children(action : () -> <parent<a>|e> r) : e (list<a>, r)
  var children := ctx hole
  with handler
    fun add-child(child)
      children := children ++ ctx Cons(child, hole)
  val r = mask<local> {action()}
  (children ++. Nil, r)
