+++
title = "Code-Driven Diagramming"
description = ""
slug = ""
date = 2025-04-05
draft = true
+++

The most impactful thing you could work on is code-driven diagramming.
Diagrams are a PITA and there is no doubt that we haven't produced the best diagramming methodology yet.
Everyone has their own strategy, but they all suck.
d2 is the best programmatic diagramming tool I have found thus far, but its best layout engine (TALA) is closed source (and even that isn't great).
Furthermore, the constraint language of d2 is too limiting - you can't use it to describe arbitrary diagrams... (enforced node-to-node spacing, no metaprogramming).
Ideally we can unify all the diagrammers under one framework (things like mermaid's random diagram types or graphviz generic-graph visualization).

Review the prior art here...

But but but this isn't computer architecture!
Think bigger picture! The techniques and abstractions you use and discover here are useful for all kinds of EDA CAD problems.
Everything from the diagram primitive abstractions, to the constraint language, to the layout algorithm you develop are all relevant.
Take a look at recent works using gradient descent + force-directed methods to perform detailed mixed-placement for VLSI CAD or PCB CAD.

- So good and general you can re-draw any diagram from any paper from scratch!
- Bootstrapping mode where an LLM can get you to the code + refactoring from an original image or even a sketch by hand.
- Eventually, merge with the 2-way sync project to do textual prompting with respect to the final diagram and get new constraints as code.

The layout algorithm itself: combine force-directed placement with gradient descent based optimization (which can support arbitrary constraints).
Bootstrap new diagram layouts from old ones - you can intelligently cache successfully optimized diagrams.

Papers:

- Net Separation-Oriented Printed Circuit Board Placement via Margin Maximization (https://cseweb.ucsd.edu/~chholtz/aspdac_22_netcrossing.pdf) (ASPDAC 22)
- Graph Drawing via Gradient Descent, (GD)2 (https://arxiv.org/abs/2008.05584) (2020, very cool web demo: http://hdc.cs.arizona.edu/~mwli/graph-drawing/)
- Cypress: VLSI-Inspired PCB Placement with GPU Acceleration (https://www.csl.cornell.edu/~zhiruz/pdfs/cypress-ispd2025.pdf) (ISPD 25)
- Optimizing User Interface Layouts via Gradient Descent (https://arxiv.org/abs/2002.10702)
- Quilter (https://blog.quilter.ai/gradient-dissent/) claims they use gradient descent in their PCB placement algorithms

My GPT queries:

- https://chatgpt.com/share/67edcff8-dc58-8004-83be-2c6b82ca2648
- https://chatgpt.com/share/67edd008-1894-8004-98e5-cd0aa5bc420e


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
- https://raw.githubusercontent.com/Jollywatt/typst-fletcher/refs/heads/master/docs/manual.pdf
  - Fletcher for typst (as an alternative to tikz) seems quite beautiful
  - The line drawing semantics seem really nice: specify arrow directions for every turn and the terminating arrowhead with a label
  - Coordinates are semantic (not explicit), and the coordinate grid can be stretched / compressed
