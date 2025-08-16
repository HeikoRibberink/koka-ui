module space

pub import ui

pub fun space(w : int = 0, h : int = 0) : ui-parent<_> ()
  UiElem((w, h), nodraw).add-child
    
