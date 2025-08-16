module tree

pub effect parent<a>
  ctl add-child(child : a) : ()

pub fun children(action : () -> <parent<a>|e> ()) : e list<a>
  var children := ctx hole
  with handler
    fun add-child(child)
      children := children ++ ctx Cons(child, hole)
  mask<local> {action()}
  children ++. Nil
