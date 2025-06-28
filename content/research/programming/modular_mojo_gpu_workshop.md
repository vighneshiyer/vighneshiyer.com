- Meta's pytorch to standalone inference binary slides (attach photos here, take 4 photos from joonho, some others in yufeng thread)
  - Very useful functionality
  - How does this compare with IREE's standalone binary generation or even its baremetal binary mode?
  - It seems like this would only support forward passes

- TileIR from Nvidia seems very cool as a compiler target ir. He says there will be a mlir dialect for it as well as a python lightweight DSL for it directly. The maturity of this is quite insane, and they didn't talk about any llm codegen nonsense, just the ability to build clean abstractions and make them interop, allowing people to come into the stack at any abstraction

- Lambda labs GPUs
  - not having access to my env is so painful :(, I need to make this easier to set up
  - But the GPU spinup was quite fast, just a few minutes for an A10, easy to setup SSH keys

- https://github.com/modular/workshops/blob/main/mojo-gpu-programming/slides.md
  - The main entry point for the gpu programming tutorial
  - This is a really great reveal.js template too

- Things I noticed
  - Cursor remote SSH works just like vscode, simple extension to install and works out of the box
  - Mojo's VSCode extension is only published on the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=modular-mojotools.vscode-mojo)
  - It isn't published on [open-vsx](https://open-vsx.org/?search=mojo&sortBy=relevance&sortOrder=desc)
  - Which means it is annoying to install in Cursor. I had to download the VSIX file from vscode and load it into Cursor. Just fix this please.

-
