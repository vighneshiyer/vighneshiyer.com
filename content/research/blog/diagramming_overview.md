# Diagrams

## Visio / Omnigraffle

## draw.io / Excalidraw

## Figma


- https://www.figma.com/slides/VwKtWwQQiiOevrTa8OeIXR/Tracer-Series-Presentation-Template?node-id=48-847

## Google Slides / Drawings

## tikz

- [haskell related blog post that uses tikz and pgfplots and hackyll](https://tech.channable.com/posts/2019-03-13-how-we-made-haskell-search-strings-as-fast-as-rust.html)
- [Diagram as code - a library that converts flowchart diagrams as code into SVGs](https://news.ycombinator.com/item?id=23154846)

## Programmatic Diagrams of Fixed Shapes

- mermaid
- plantuml
- manim
- d2

## typst tikz alternative

## Illustrator / Inkscape

## Mathcha

- https://www.mathcha.io/
- https://x.com/vtabbott_/status/1874449446056177717
  - DeepSeek-V3, diagrammed.

## Something New?

## Old Notes

- Replicate this programmatically: http://alexlenail.me/NN-SVG/LeNet.html
- https://news.ycombinator.com/item?id=29190232
    - Manim for mathematical animations
    - Tikz as usual, but it is clearly painful
    - https://github.com/bluenote10/NimSvg
    - https://pixijs.io/examples/#/graphics/simple.js
    - https://github.com/pyglet/pyglet (openGL based, supports 3D)
    - https://processing.org/examples/ (but doesn't seem diagramming focused)
    - https://p5js.org/ (processing-like API in javascript)
    - Mermaid (seems architecture diagram focused)
    - https://text-to-diagram.com/ (a listing of bunch of tools)
    - https://excalidraw.com/ (drawing GUI - similar to draw.io)
    - https://blog.datawrapper.de/beautifulcolors/ (color pallete selection)
    - https://news.ycombinator.com/item?id=38885094 (Pikchr: A PIC-like markup language for diagrams in technical documentation (pikchr.org))

### Plots

- [HN - Effectively using matplotlib](https://news.ycombinator.com/item?id=21550516)
    - https://pbpython.com/effective-matplotlib.html

### Tikz / Diagrams

- [Mathcha - an online tool for editing Latex/Tikz diagrams and math visually and exporting Latex code](https://www.mathcha.io/)
- I should do a few tikz tutorials to understand the basics and then do some circuits in tikz too
- [HN - Which tool do you use to create beautiful diagrams?](https://news.ycombinator.com/item?id=18788244)
- [HN Inkscape 1.2](https://news.ycombinator.com/item?id=31403532)
    - Figma, Sketch, Adobe XD
    - OSS: https://penpot.app/
    - https://www.goinkscape.com/create-beautiful-diagrams-in-inkscape/
- Diagrams are still easiest in Google Diagrams
- But ideally I'd use Inkscape
    - Need to figure out how to create incremental svgs for a single diagram so that I can use stacked animations in reveal to step through the image
    - Looks like I can create each part of the image in a separate layer and then post-process the SVG to multiple SVGs per layer in the original
    - It is possible to show only certain layers of an SVG within HTML itself but it's a bit complex
    - For Inkscape, I can just write a script to iterate through layers and dump incremental svgs (seems easy enough)
- Programmatic diagrams
    - manim - https://docs.manim.community/en/stable/examples.html - probably overkill
    - d3 - https://observablehq.com/@d3/gallery - good for standard diagram types, not so much for boxes with arrows
    - d2 - https://d2lang.com/tour/connections (seems quite good for most diagrams, but somewhat restricted)
    - mermaid - https://mermaid.js.org/syntax/examples.html#sequence-diagram-blogging-app-service-communication - also good for standard types
    - Maybe design my own with ELK (Eclipse layout kernel)
- https://github.com/vizdom-dev/vizdom (https://news.ycombinator.com/item?id=41417024)
  - D2 seems so good actually: https://d2lang.com/tour/experience
  - https://www.reddit.com/r/programming/comments/12gi908/d2_texttodiagram_language_introducing_grid/
  - https://text-to-diagram.com/?b=mermaid&example=shapes
  - Mermaid isn't that great in comparison
