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
