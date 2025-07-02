+++
title = "The Design of This Website"
date = 2025-07-01
draft = false
description = "My design process, inspirational websites, fonts, colorschemes, layouts, and more"
+++

My old website contained all the same articles as this current one, but I didn't like how it looked.
Back then (in 2022), I still used [zola](https://www.getzola.org/) as the static site generator, [pico.css](https://picocss.com/) v1.5 for the base template, and I stitched together my own top-level SCSS and HTML template.
For this new website design, I decided to continue using zola, but re-do the CSS from scratch.

## My Design Process

To begin with, one must first be inspired by those superior to him.
Here are my main inspirations.

Firstly, [Butterick's Practical Typography](https://practicaltypography.com/) is excellent, in particular his [key rules](https://practicaltypography.com/summary-of-key-rules.html).
His website's vertical rhythm is ideal, his [free font suggestions](https://practicaltypography.com/font-basics.html) are good, and his [ordered and unordered list styling](https://practicaltypography.com/introduction.html) is clean.
My other top inspirations include:

- [Fatih Arslan's blog](https://arslan.io/2025/05/12/barbican-estate/) (images, galleries, popouts using [photoswipe](https://photoswipe.com/))
- [magick.css](https://css.winterveil.net/) (typography, blockquotes, small-caps headings, fonts, sidenotes)
- [Unison's documentation](https://www.unison-lang.org/docs/the-big-idea/) (callouts, sidenotes, left-hand TOC)
- [Tufte CSS](https://edwardtufte.github.io/tufte-css/) (sidenotes, fonts, vertical rhythm)
- [scripter.co](https://scripter.co/sidenotes-using-only-css/) (sidenotes, headings)
- [sqlsync.dev](https://sqlsync.dev/posts/stop-syncing-everything/) (vertical rhythm, sidenotes, callouts, colorscheme switcher)
- [Jake Lazaroff's blog](https://jakelazaroff.com/words/isomorphic-web-components/) (sidenotes, code blocks / inline code)
- [Shadaj Laddad's blog](https://www.shadaj.me/writing/distributed-programming-stalled) (sidenotes)
- [CACM blog](https://cacm.acm.org/research/defying-moore-envisioning-the-economics-of-a-semiconductor-revolution-through-12nm-specialization/) (left-hand TOC)

Here is the design process I went through.

1. Pick the font family
    - I wanted a serif font for the body, a sans-serif for the headings and other thematic elements, and a monospaced font for code segments
    - I also wanted a high quality font available on Google Fonts and a consistent style among all 3 fonts
    - I decided on [Source Serif 4](https://fonts.google.com/specimen/Source+Serif+4), [Source Sans 3](https://fonts.google.com/specimen/Source+Sans+3), and [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro), all part of the same font family
2. Pick the colors
    -
2. Setup the parameters for the body text
  - I created a basic HTML page with one column and used text from my one of my existing articles. The text should contain 3 levels of headings (h1 - title, h2 - section, h3 - subsection).
  - I wanted to nail down the appropriate
  - the font size, line spacing, paragraph spacing, headings, line width, letter spacing, colorscheme (both light and dark). Get some text on a page and play with this using Utopia flexible spacing and font sizing. Decide on the right fonts (sans, serif, headings, small caps), visual tweaks, and colors.
3. Use Utopia
2. Design the other common thematic elements
  - It should also contain other thematic elements you want like subheadings / short summaries which sit under h1
  - Lists (ul / ol), blockquotes, callouts, code segments / monospaced fonts, math, images with captions, galleries

### Front Page

{% code(language="plaintext") %}
Header
Vighnesh Iyer       email, Github, LinkedIn, HN
---
Research articles organized by section (blog, philosophy, ...) (moasic 2 column layout)
Article name (date, month abbreviated / year) (NEW! badge made visible via javascript)
  Short description / summary in 1 line
---
About Me | Pic
Short CV history, CV link, links (slice, bwrc, github, comic)
---
Projects (+ links to research articles with in progress work and finished work)
Talks / Slides (links to HTML slides)
Publications (+ Posters, Preprints)
---
Personal articles by section
---
Footer
{% end %}

### Article Pages

#### Layout

- Tufte-style is crucial, sidenotes keep the main article from being too cluttered with points in parentheses
  - magick.css sidenotes will drive everything (I like having right-hand sidenotes fold into the main article)
- 3 breakpoints
  - Full width: TOC | Main content | Sidenotes (Tufte-style)
  - Next point: TOC -> Main content | Sidenotes
  - Mobile: TOC -> Main content (sidenotes superscript clickable to reveal underneath the paragraph)
  - Custom grid with viewport-oriented max width, popout images
- Contrast color article heading with summary (like https://yuxi-liu-wired.github.io/essays/posts/cyc/)
  - With author, modified, and published timestamps
- Looking at all the tufte-style websites, I realized that the TOC and sidenotes are placed using `display: absolute | relative` and NOT using CSS grid, I'll do that too and keep the image popouts cleared by hand
  - Also, I will keep the article centered, and offset the sidenotes and TOC

#### Components

- Headings
  - Hashes on headings to indicate nesting levels
- Typography
  - Fluid font sizing at full-width breakpoint. Fixed sizing at other 2 breakpoints.
- Figures
  - Fixed width into the article main body, captions
- Callouts (like https://www.unison-lang.org/docs/the-big-idea/)
  - For article updates / retrospectives and outbound relevant links
- Blockquotes
  - Need to make a custom short-tag with a author/attribution signoff + optional caption
- Accordion blocks
  - TBD
- Code blocks (use a custom Tera template)
  - File name + language at the top bar
  - Internal text highlighted via highlight.js on the client side
  - Don't use the default Zola highlighter that works server-side (it is just too underpowered)
  - Use Fira Code or Source Code Pro
  - Inspiration: https://tavianator.com/2025/configure.html
- Left sidebar TOC
  - Use the nav component from picocss in an aside (see the picocss docs themselves)
  - Generate the nav with zola templates
  - Inject javascript to highlight and open/close the navigation elements (custom)
  - ~~Then generate that with tocbot (https://github.com/tscanlin/tocbot)~~
- Taxonomy badges: each taxonomy has a set of terms
  - e.g. language is a *taxonomy* and Python, Scala, C++, Rust are *terms*
  - The badge should look like `|Language|Scala|`.
  - Each taxonomy should have an assigned color
  - The term should be uncolored or have its own color scheme (this can become too messy to parse)

## Inspiration

Some ideas and websites I find inspirational.
I will try to keep this enumeration short since there are too many websites to list otherwise.

### High-Level Ideas

- [Is Timeless UI Design a thing?](https://www.imaginarycloud.com/blog/timeless-classic-ui-design/amp/) ([HN link](https://news.ycombinator.com/item?id=17470543))
- Pay attention to this: [Design a 2000 style website](https://twitter.com/plasmarob/status/1099442262767882242)
- [Laws of UX](https://lawsofux.com/)
- [Reimagining Fluid Typography] ([HN link](https://news.ycombinator.com/item?id=43205968))
  - [Utopia: Fluid type scale calculator](https://utopia.fyi/type/calculator?c=320,18,1.2,1240,20,1.25,5,2,&s=0.75|0.5|0.25,1.5|2|3|4|6,s-l&g=s,l,xl,12)
  - This is suitable for fluid font size rhythm based on viewport width interpolation using CSS `clamp`
- Typography
  - https://practicaltypography.com/line-spacing.html (an excellent website)
  - The Elements of Typographic Style
  - Thinking with Type
- Grids
  - Making and Breaking the Grid
  - Grid Systems in Graphic Design

### CSS Frameworks

CSS frameworks are kind of deprecated now to be honest.
It seems you don't need any 'prebuilt' components anymore, such as grids, typography, modals, or menus.
It's much easier to build everything yourself in a minimal way, use CSS variables, and LLMs to duplicate bits of UI elements you think are nice.

- [Layout Breakouts with CSS Grid](https://ryanmulligan.dev/blog/layout-breakouts/)
  - How to put a *breakout* image / header in the main column
  - [Fluid Breakout Layout with CSS Grid](https://www.viget.com/articles/fluid-breakout-layout-css-grid/)
  - [Layout Breakouts Builder](https://layout-breakouts-builder.vercel.app/)
- [Pico CSS](https://picocss.com/docs/typography)
  - This is a good baseline for setting 6 breakpoints, font size scaling, headings, and components (tooltips, menubars, accordions)
- [Tailwind](https://tailwindcss.com/) + [Flowbite](https://flowbite.com/) + [DaisyUI](https://daisyui.com/)
  - Flowbite is a nice component library (badges, accordions, **gallery**)
  - [DaisyUI Carousel](https://daisyui.com/components/carousel/)
- [new.css](https://newcss.net/) (plain and simple, nice blockquotes)
- [magick.css](https://news.ycombinator.com/item?id=39793513) (magical, unusual but perfect fonts, pre-heading motifs are beautiful, sidenote and quote styling is too good)
- [Tufte CSS](https://edwardtufte.github.io/tufte-css/) (academic Tufte-inspired CSS)
- [PubCSS](https://thomaspark.co/2015/01/pubcss-formatting-academic-publications-in-html-css/) (ACM-like CSS, cute but not a good idea)
- [My Modern CSS Reset](https://jakelazaroff.com/words/my-modern-css-reset/)
- [Better typography with text-wrap pretty](https://webkit.org/blog/16547/better-typography-with-text-wrap-pretty/) ([HN link](https://news.ycombinator.com/item?id=43622703))
  - Use `text-wrap: pretty` for long form writing
- [WebTUI is a modular CSS library that brings the beauty of Terminal UIs to the browser](https://webtui.ironclad.sh/) ([HN link](https://news.ycombinator.com/item?id=43668250)) (beautiful but impractical)

### Blogs

#### Tufte Style

- https://jakelazaroff.com/words/an-interactive-intro-to-crdts/#last-write-wins-map (beautiful!, the TOC *overlays* the right sidebar)
- https://sqlsync.dev/posts/stop-syncing-everything/ (beautiful, right sidenotes + TOC at very top, I like this, nice heading anchors)
- https://www.shadaj.me/writing/distributed-programming-stalled (Tufte-style, right sidenotes, left TOC, centered body)
- https://www.scottsmitelli.com/articles/unwilling-participant-in-smart-fantasy/ (Tufte style sidenotes, beautiful typography, perhaps combine sidenotes with full width images and fixed TOC on sidebar, sidenotes become inline toggles on mobile!)
  - https://www.scottsmitelli.com/projects/scottsmitelli.com/ (his own site's biography)
- https://yuxi-liu-wired.github.io/essays/posts/cyc/ (left TOC, nice typography, nice article headings)
- https://saurabhalone.com/blogs/llama3/web (another Tufte-style website, beige colorscheme, sidenotes, rightside hidden TOC, beautiful)
- https://asteriskmag.com/issues/08/the-death-and-life-of-prediction-markets-at-google#2 (very beautiful orange accents)
- https://craftinginterpreters.com/the-lox-language.html#functions (another amazing Tufte style website, left sidebar for TOC, right for sidenotes, very responsive for mobile)
  - Similar website: https://www.composingprograms.com/pages/24-mutable-data.html (but no sidenotes)
- https://rachit.pl/post/personal-infrastructure/
- https://martinfowler.com/articles/lmax.html

#### Center Column Style

- Unique and special
  - https://herecomesthemoon.net/2025/01/type-inference-in-rust-and-cpp (nearly perfect)
    - https://solar.lowtechmagazine.com/2024/12/how-to-build-an-electrically-heated-table/ (original)
  - https://alinpanaitiu.com/blog/making-my-own-sharpening-blocks/
  - https://nical.github.io/posts/rust-custom-allocators.html (great typography and code blocks)
  - https://www.julian.com/guide/write/ideas (beautiful 'guides')
  - https://martijnhols.nl/blog/everything-about-google-translate-crashing-react (yellow highlight heavy, nice code blocks)
  - https://ciechanow.ski/moon/ (amazing blog with "how it works" articles, e.g. GPS, gears, light and shadows)
  - https://www.jonashietala.se/blog/2024/03/19/lets_create_a_tree-sitter_grammar/ (beautiful code breakouts)
  - https://curiouscoding.nl/posts/static-search-tree/ (beautiful headings, code)
  - https://corrode.dev/blog/flattening-rusts-learning-curve/ (beautiful code blocks, nice links, monospaced text)
  - https://mrale.ph/blog/2024/11/27/microbenchmarks-are-experiments.html (beautiful code and callouts / asides)
  - https://nudge.com/blog/about/ (very nice figure captions)
  - https://thedataquarry.com/blog/static-site-zola/ (very unique rightside TOC)
  - https://worksinprogress.co/issue/steam-networks/ (great typography, nice sidenotes, beautiful images + captions)
  - https://purplesyringa.moe/blog/webp-the-webpage-compression-format/ (unique purple colorscheme, code breakouts)
  - https://htmlforpeople.com/adding-an-about-page/ (great typography)
  - https://www.joshwcomeau.com/css/interactive-guide-to-grid/ (rightside TOC, just beautiful)
  - https://dmodel.ai/nullability-gentle/ (nice code blocks)
- Pretty vanilla
  - https://burntsushi.net/bstr/
  - https://fly.io/blog/youre-all-nuts/ (nice callouts, good typography)
  - https://www.fromjason.xyz/p/notebook/where-have-all-the-websites-gone/ (very nice single column, nice headings and typography)
  - https://dansinker.com/posts/2025-05-23-who-cares/ (nice typography, fonts, subscription callout)
  - https://genna.win/blog/convolution-simd/ (also nice single column, quite elegant)
  - https://richardcsuwandi.github.io/blog/2025/dgm/ (nice left-side TOC, right-side figure captions)
  - https://noelwelsh.com/posts/codata-interpreter-terminal/ (simple typography, minimal but nice)
  - https://jackhopkins.github.io/factorio-learning-environment/ (wide figures, clean)
  - https://fleetwood.dev/posts/you-could-have-designed-SOTA-positional-encoding
  - https://hntrbrk.com/schrodinger/ (nice font, wide hero header)
  - https://coreyjmahler.com/the-28-theses-of-the-german-christians/#fnr1-18150 (good typography)
  - https://michael.stapelberg.ch/posts/2017-12-11-dell-up3218k/
  - https://chiraaggohel.com/posts/llms-eda/ (clean code blocks, nice Q&A blockquotes with colored bars)
  - https://www.answer.ai/posts/2025-01-08-devin.html#what-is-devin (vanilla and clean, nice right-aligned TOC)
  - https://fetchfox.ai/a/founding-engineer-compensation (clean single column, nice fonts)
  - https://blog.joway.io/posts/golang-rethink-program-in-realworld/ (I like the header)
  - https://peteris.rocks/blog/htop/ (unique, full width code, simple, code oriented)

#### Center Column with Wide Images / Galleries

- https://www.physicalintelligence.company/research/fast (exotic styling, full width photo slider is very cool, full width images)
- https://matthewstrom.com/writing/ui-density/
  - Another page: https://matthewstrom.com/writing/generating-color-palettes/
- https://daniel.lawrence.lu/blog/y2023m12d15/

### Academic Webpages

- https://tomasp.net/coeffects/ (extremely beautiful and impressive)
- https://www.mwillsey.com/blog/rust-intro (Tufte-style)
- https://johnmacfarlane.net/index.html
- https://jamesbornholt.com/blog/z3-iphone/ (my very original inspiration)
- https://pit-claudel.fr/clement/ (nice faculty website)

### Documentation

- https://www.unison-lang.org/docs/the-big-idea/
  - Beautiful: sidebar for footnotes on right (I would elide this), menubar on left, centered text, perfect code blocks, beautiful callouts, shallow per-article heading hierarchy (2 levels only), responsiveness is ideal (5 breakpoints)
  - Similar website: https://snarky.ca/how-virtual-environments-work/
- https://docs.modular.com/mojo/manual/get-started/

### Exotic

- https://rsms.me/inter/ (website showcasing a font with very nice typography)
- https://gwern.net/ (a bit much)
- https://simonsarris.com/
- https://www.makerain.com/
- https://social-impact-capital.com/ (very nice without the scroll hijack)

### Fonts

- Sans-serif
  - https://fonts.google.com/specimen/B612
  - https://fonts.google.com/specimen/Atkinson+Hyperlegible+Next (variable-weight version of the original Atkinson Hyperlegible)
  - https://fonts.google.com/specimen/Libre+Franklin/ (Richard uses this for slides)
  - https://fonts.google.com/specimen/PT+Sans
  - https://fonts.google.com/specimen/Inter (used by [Mojo's docs](https://docs.modular.com/mojo/manual/get-started/))
- Serif
  - https://fonts.google.com/specimen/Lora/
  - https://fonts.google.com/specimen/Markazi+Text
  - https://fonts.google.com/specimen/Crimson+Pro
  - https://fonts.google.com/specimen/PT+Serif
  - https://fonts.google.com/specimen/Alegreya/
  - https://fonts.google.com/specimen/Quattrocento
  - https://fonts.google.com/specimen/Merriweather
  - https://fonts.google.com/specimen/Spectral
- Mono
  - https://fonts.google.com/specimen/Fira+Code
  - https://fonts.google.com/specimen/Source+Code+Pro
  - https://fonts.google.com/specimen/PT+Mono
- Small caps
  - https://fonts.google.com/specimen/Alegreya+SC/tester
- Mixed Kits (Serif + Sans + Mono)
  - IBM Plex
  - Source Serif Pro + Source Sans + Source Code

### Color Schemes

- [uchū](https://uchu.style/) ([HN link](https://news.ycombinator.com/item?id=43072338))
- [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme)
- [Nord](https://www.nordtheme.com/docs/colors-and-palettes)
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)

### Comments

- Disqus (slow, ugly, 3rd party)
- https://posativ.org/isso/ (easy SQLite backend)
- Commento
- https://utteranc.es/ (Github issue based comment system - very cool, no special hosting required!) although you give up control of the comment data
- https://github.com/umputun/remark42 (remark42 seems very nice and easy, anon commenting is first class supported as well as other SSO offerings)
