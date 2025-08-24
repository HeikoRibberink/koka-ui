# Koka-UI

Koka-UI is a UI library that uses effects to provide a concise tree builder and efficiently compute layouts.

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

The library depends on (https://github.com/HeikoRibberink/koka-hlib), and needs to be included.
Until we get a proper package management system, this can be done in multiple ways:
1. (Recommended) go to the folder containing `koka-ui` and run `git clone https://github.com/HeikoRibberink/koka-hlib.git`.
2. Go to a location where you store your Koka packages, run `git clone https://github.com/HeikoRibberink/koka-hlib.git` there and create a (symbolic) link inside `koka-ui` to that installation of `hlib`.
3. Go to a location where you store your Koka packages, run `git clone https://github.com/HeikoRibberink/koka-hlib.git` there. From now on, you can execute the Koka compiler with the option `-i[path to hlib installation]`. Mind that there must be no space between the `-i` and the path.
