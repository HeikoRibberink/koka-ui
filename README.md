# Koka-UI

Koka-UI is a UI library that uses effects to provide a concise tree builder and efficiently compute layouts

# Example

```koka
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
```
Prints
```
Hi     Man
  ┌───┐   
  │Big│   
  └───┘   
World     
```

# Building

The library currently cannot be built because it depends on an external helper library, but that will be resolved ASAP.
