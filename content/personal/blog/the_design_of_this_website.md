+++
title = "The Design of This Website"
date = 2025-07-01
draft = false
description = "My design process, inspirational websites, fonts, colorschemes, layouts, and more"

[extra]
new = true
+++

My old website contained all the same articles as this current one, but I didn't like how it looked.
Back then (in 2022), I still used [zola](https://www.getzola.org/) as the static site generator, [pico.css](https://picocss.com/) v1.5 for the base template, and I stitched together my own top-level SCSS and HTML template based on the [lightspeed](https://www.getzola.org/themes/lightspeed/) template.
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
- [](https://worksinprogress.co/issue/the-rise-and-fall-of-the-hanseatic-league/) (typography, images and captions, article heading, main column width)

Here is the design process I went through.

1. Pick the font family
    - I wanted a serif font for the body, a sans-serif for the headings and other thematic elements, and a monospaced font for code segments
    - I also wanted a high quality font available on Google Fonts and a consistent style among all 3 fonts
    - I decided on [Source Serif 4](https://fonts.google.com/specimen/Source+Serif+4), [Source Sans 3](https://fonts.google.com/specimen/Source+Sans+3), and [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro), all part of the same font family
1. Pick the colorscheme
    - Since I love [Tokyo Night](https://github.com/folke/tokyonight.nvim), I picked its 'Night' and 'Day' variants
    - Add the dark and light colorschemes to the stylesheet as sass variables and use `@media (prefers-color-scheme: dark)` to set CSS variables ([my stylesheet](https://github.com/vighneshiyer/vighneshiyer.com/blob/master/sass/index.scss#L100))
    - Draft a basic HTML page with one column filled with text. The text should contain 3 levels of headings (h1 - title, h2 - section, h3 - subsection).
1. Use Utopia. Pick the key parameters for the body text and grid column
    - Set up the [type scale](https://utopia.fyi/type/calculator?c=320,18,1.2,1240,20,1.25,5,2,&s=0.75%7C0.5%7C0.25,1.5%7C2%7C3%7C4%7C6,s-l&g=s,l,xl,12), [space scale](https://utopia.fyi/space/calculator?c=320,18,1.2,1240,20,1.25,5,2,&s=0.75%7C0.5%7C0.25,1.5%7C2%7C3%7C4%7C6,s-l&g=s,l,xl,12), and [grid dimensions](https://utopia.fyi/grid/calculator?c=320,18,1.2,1240,20,1.25,5,2,&s=0.75%7C0.5%7C0.25,1.5%7C2%7C3%7C4%7C6,s-l&g=s,l,xl,12)
    - There is a nice [SCSS library](https://utopia.fyi/blog/utopia-core-scss/) which generates the CSS from the base font size, max/min viewport widths, and type scales
    - At this point, I picked the [grid columns](https://practicaltypography.com/line-length.html) I wanted the content to land in, and played with the font sizes and viewport min/max until the result was something I liked
    - The ideal font size is a bit larger than what you expect. I thought 16px was fine early on, but I realized during this process that 19px for the max viewport was ideal.
    - Here is the [Utopia setup](https://github.com/vighneshiyer/vighneshiyer.com/blob/master/sass/index.scss#L8) from my stylesheet
1. Tune the body text parameters
    - I tuned the [line spacing](https://practicaltypography.com/line-spacing.html), [paragraph spacing](https://practicaltypography.com/space-between-paragraphs.html), and [letter spacing](https://practicaltypography.com/letterspacing.html). Use the space variables provided by Utopia.
    - Toggle the colorscheme and make sure things look good in either one. You may want to adjust the default font weight slightly down for dark themes.
1. Setup spacing
    - Set the document's vertical rhythm by setting font sizes and margin top / bottom for headings ([my stylesheet](https://github.com/vighneshiyer/vighneshiyer.com/blob/master/sass/index.scss#L362))
1. Style other common elements
    - Apply styles to hyperlinks, lists (ul / ol), blockquotes, callouts, code segments / monospaced fonts, math, images with captions, galleries and so forth
1. Design the homepage
    - Once a styled article looked decent, I went to design the homepage, which usually needs custom styling for the page header, footer, and article listing
1. Set up media queries
    - I used devtools to change the viewport dimensions to resemble tablets and phones and adjusted the grid columns for different viewport sizes
    - There is lots of talk about using _container_ queries, but I just stuck with what I knew

<!--
Get some text on a page and play with this using Utopia flexible spacing and font sizing. Decide on the right fonts (sans, serif, headings, small caps), visual tweaks, and colors.
-->

Now here are some notes on the design of the homepage and article pages.

### Home Page

I just sketched out how I wanted the header and footer to look, as well as any other sections.

{% code(language="plaintext") %}
Header
Vighnesh Iyer                  email, Github, LinkedIn, HN
---
Research articles organized by section (comparch, blog, ...)
Article name (date, month abbreviated / year) (optional NEW! badge)
  Short description / summary in 1 line
---
About Me | Pic
Short bio
---
Projects / Papers / Posters
Talks / Slides
---
Personal articles by section
---
Footer
{% end %}

### Article Pages

I spent quite some time sketching out the stylistic features I wanted for article pages based on inspirational blogs I liked.

#### Layout

- Tufte-style is crucial, right-hand sidenotes keep the main article from being too cluttered with nit points in parentheses
- Left-handed TOC is quite nice too since articles often get too long
- 3 logical breakpoints
  - Full width: `TOC | Main content | Sidenotes`
  - Next point: `TOC (hidden under menu) | Main content | Sidenotes`
  - Mobile: `TOC (hidden under menu) | Main content (sidenotes clickable to be revealed underneath the paragraph)`
  - Use a custom grid with viewport-oriented max width, popout figures that are a bit wider than the content
- Contrast color article heading with summary and published time ([see](https://yuxi-liu-wired.github.io/essays/posts/cyc/))
- Looking at all the tufte-style websites, I realized that the TOC and sidenotes are placed using `display: absolute | relative` and NOT using CSS grid, I'll do that too
  - I will keep the main text centered, and offset the sidenotes and TOC (unlike the default tufte.css)

#### Elements

- *Headings*: Hashes on headings to indicate nesting levels
- *Typography*: Fluid font sizing using Utopia
- *Figures*: Pop out 1 column past the article's main body, use captions
- *Callouts*: [An example](https://www.unison-lang.org/docs/the-big-idea/), for highlighting article updates / retrospectives and relevant outbound links
- *Blockquotes*: Use default `<blockquote>` element and style it
- *Details/summary*: Change the default `<details>` marker
- *Code blocks*: Implement a custom Zola shortcode vs using triple backticks in Markdown
  - File name + language optionally on a bar above the code block
  - Code highlighted via `highlight.js` on client-side
  - Don't use the default Zola highlighter that works server-side (it's low quality)
  - Use Fira Code or Source Code Pro as the monospaced font
  - Good [inspiration](https://tavianator.com/2025/configure.html) for code block bar
- *Left sidebar TOC*
  - Could use the `<nav>` component from pico.css in an `<aside>`
  - Generate the TOC programatically from a Zola template
  - Inject javascript to highlight and open/close the navigation elements, could use [tocbot](https://github.com/tscanlin/tocbot)
- *Taxonomy badges*: Used for articles about taxonomies
  - Each taxonomy has a set of terms (e.g. language is a *taxonomy* and Python, Scala, C++, Rust are *terms*)
  - The badge should look like `|Language|Scala|`
  - Each taxonomy should have an assigned color
  - Each term should be uncolored or have its own color scheme (this can get too messy though)

## Inspiration Archive

There are many sources of inspiration including books, documentation sites, blogs, CSS frameworks, fonts, and color schemes.
I've enumerated all the sources I've looked at in the course of designing this website.

### High-Level Ideas

<!--- Pay attention to this: [Design a 2000 style website](https://twitter.com/plasmarob/status/1099442262767882242)-->
- [Is Timeless UI Design a thing?](https://www.imaginarycloud.com/blog/timeless-classic-ui-design/amp/) ([HN link](https://news.ycombinator.com/item?id=17470543))
- [Laws of UX](https://lawsofux.com/)
- [Reimagining Fluid Typography](https://www.oddbird.net/2025/02/12/fluid-type/) ([HN link](https://news.ycombinator.com/item?id=43205968))
  - [Utopia: Fluid type scale calculator](https://utopia.fyi/type/calculator?c=320,18,1.2,1240,20,1.25,5,2,&s=0.75|0.5|0.25,1.5|2|3|4|6,s-l&g=s,l,xl,12)
  - This is suitable for fluid font size rhythm based on viewport width interpolation using CSS `clamp`
- Typography
  - [Butterick's Practical Typography](https://practicaltypography.com/)
  - [The Elements of Typographic Style](https://en.wikipedia.org/wiki/The_Elements_of_Typographic_Style)
  - Thinking with Type
- Grids
  - [Making and Breaking the Grid](https://designopendata.wordpress.com/wp-content/uploads/2014/06/making_and_breaking_the_grid__timothy_samara.pdf)
  - [Grid Systems in Graphic Design](https://monoskop.org/images/a/a4/Mueller-Brockmann_Josef_Grid_Systems_in_Graphic_Design_Raster_Systeme_fuer_die_Visuele_Gestaltung_English_German_no_OCR.pdf)

### CSS Frameworks

CSS frameworks are kind of 'deprecated' now to be honest.
You don't need any 'prebuilt' components, such as grids, typography, modals, or menus.
It's much easier to build everything yourself in a minimal way, use CSS variables, use LLMs, and adapt bits of UI elements from other websites you think are nice.

However, CSS and component frameworks still provide plenty of inspiration, so you should check them out.

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
- [Jake Lazaroff: My Modern CSS Reset](https://jakelazaroff.com/words/my-modern-css-reset/)
- [Better typography with text-wrap pretty](https://webkit.org/blog/16547/better-typography-with-text-wrap-pretty/) ([HN link](https://news.ycombinator.com/item?id=43622703))
  - Use `text-wrap: pretty` for long form writing
- [WebTUI is a modular CSS library that brings the beauty of Terminal UIs to the browser](https://webtui.ironclad.sh/) ([HN link](https://news.ycombinator.com/item?id=43668250)) (beautiful but impractical)

### Blogs

Here are a bunch of blogs I think are inspirational.
First, here are the Tufte-style ones.

- [jakelazaroff.com](https://jakelazaroff.com/words/an-interactive-intro-to-crdts/#last-write-wins-map) (beautiful!, the TOC *overlays* the right sidebar)
- [sqlsync.dev](https://sqlsync.dev/posts/stop-syncing-everything/) (beautiful, right sidenotes + TOC at very top, I like this, nice heading anchors)
- [shadaj.me](https://www.shadaj.me/writing/distributed-programming-stalled) (Tufte-style, right sidenotes, left TOC, centered body)
- [scottsmitelli.com](https://www.scottsmitelli.com/articles/unwilling-participant-in-smart-fantasy/) (Tufte style sidenotes, beautiful typography, perhaps combine sidenotes with full width images and fixed TOC on sidebar, sidenotes become inline toggles on mobile!), [his own site's biography](https://www.scottsmitelli.com/projects/scottsmitelli.com/), similar to this article
- [yuxi-liu-wired.github.io](https://yuxi-liu-wired.github.io/essays/posts/cyc/) (left TOC, nice typography, nice article headings)
- [saurabhalone.com](https://saurabhalone.com/blogs/llama3/web) (another Tufte-style website, beige colorscheme, sidenotes, rightside hidden TOC, beautiful)
- [asteriskmag.com](https://asteriskmag.com/issues/08/the-death-and-life-of-prediction-markets-at-google) (very beautiful orange accents, sidenotes, left-hand TOC/progress bar, nice fonts)
- [craftinginterpreters.com](https://craftinginterpreters.com/the-lox-language.html) (another amazing Tufte style website, left sidebar for TOC, right for sidenotes, very responsive for mobile), [composingprograms.com](https://www.composingprograms.com/pages/24-mutable-data.html) (similar)
- [rachit.pl](https://rachit.pl/post/personal-infrastructure/)
- [martinfowler.com](https://martinfowler.com/articles/lmax.html)

And now here are blogs that have just a center column.
Here are the ones I consider somewhat _unique_ and _special_.

- [herecomesthemoon.net](https://herecomesthemoon.net/2025/01/type-inference-in-rust-and-cpp) (nearly perfect), [lowtechmagazine.com](https://solar.lowtechmagazine.com/2024/12/how-to-build-an-electrically-heated-table/) (original)
- [alinpanaitiu.com](https://alinpanaitiu.com/blog/making-my-own-sharpening-blocks/)
- [nical.github.io](https://nical.github.io/posts/rust-custom-allocators.html) (great typography and code blocks)
- [julian.com](https://www.julian.com/guide/write/ideas) (beautiful 'guides')
- [martijnhols.nl](https://martijnhols.nl/blog/everything-about-google-translate-crashing-react) (yellow highlight heavy, nice code blocks)
- [ciechanow.ski](https://ciechanow.ski/moon/) (amazing blog with "how it works" articles, e.g. GPS, gears, light and shadows)
- [jonashietala.se](https://www.jonashietala.se/blog/2024/03/19/lets_create_a_tree-sitter_grammar/) (beautiful code breakouts)
- [curiouscoding.nl](https://curiouscoding.nl/posts/static-search-tree/) (beautiful headings, code)
- [corrode.dev](https://corrode.dev/blog/flattening-rusts-learning-curve/) (beautiful code blocks, nice links, monospaced text)
- [mrale.ph](https://mrale.ph/blog/2024/11/27/microbenchmarks-are-experiments.html) (beautiful code and callouts / asides)
- [nudge.com](https://nudge.com/blog/about/) (very nice figure captions)
- [thedataquarry.com](https://thedataquarry.com/blog/static-site-zola/) (very unique rightside TOC)
- [worksinprogress.co](https://worksinprogress.co/issue/steam-networks/) (great typography, nice sidenotes, beautiful images + captions)
- [purplesyringa.moe](https://purplesyringa.moe/blog/webp-the-webpage-compression-format/) (unique purple colorscheme, code breakouts)
- [htmlforpeople.com](https://htmlforpeople.com/adding-an-about-page/) (great typography)
- [joshwcomeau.com](https://www.joshwcomeau.com/css/interactive-guide-to-grid/) (rightside TOC, just beautiful)
- [dmodel.ai](https://dmodel.ai/nullability-gentle/) (nice code blocks)

Here are some more nice center column blogs, but they are more _vanilla_ than the previous selection.

- [burntsushi.net](https://burntsushi.net/bstr/)
- [fly.io](https://fly.io/blog/youre-all-nuts/) (nice callouts, good typography)
- [fromjason.xys](https://www.fromjason.xyz/p/notebook/where-have-all-the-websites-gone/) (very nice single column, nice headings and typography)
- [dansinker.com](https://dansinker.com/posts/2025-05-23-who-cares/) (nice typography, fonts, subscription callout)
- [genna.win](https://genna.win/blog/convolution-simd/) (also nice single column, quite elegant)
- [richardcsuwandi.github.io](https://richardcsuwandi.github.io/blog/2025/dgm/) (nice left-side TOC, right-side figure captions)
- [noelwelsh.com](https://noelwelsh.com/posts/codata-interpreter-terminal/) (simple typography, minimal but nice)
- [jackhopkins.github.io](https://jackhopkins.github.io/factorio-learning-environment/) (wide figures, clean)
- [fleetwood.dev](https://fleetwood.dev/posts/you-could-have-designed-SOTA-positional-encoding)
- [hntrbrk.com](https://hntrbrk.com/schrodinger/) (nice font, wide hero header)
- [coreyjmahler.com](https://coreyjmahler.com/the-28-theses-of-the-german-christians/) (good typography)
- [michael.stapelberg.ch](https://michael.stapelberg.ch/posts/2017-12-11-dell-up3218k/)
- [chiraaggohel.com](https://chiraaggohel.com/posts/llms-eda/) (clean code blocks, nice Q&A blockquotes with colored bars)
- [answer.ai](https://www.answer.ai/posts/2025-01-08-devin.html#what-is-devin) (vanilla and clean, nice right-aligned TOC)
- [zerocontradictions.net](https://zerocontradictions.net/epistemology/representationalism) (argument and rebuttal / pro-con blockquotes)
- [fetchfox.ai](https://fetchfox.ai/a/founding-engineer-compensation) (clean single column, nice fonts)
- [blog.joway.io](https://blog.joway.io/posts/golang-rethink-program-in-realworld/) (I like the header)
- [peteris.rocks](https://peteris.rocks/blog/htop/) (unique, full width code, simple, code oriented)

Now, here are more center column blogs, but they have wide (often full-width) images / galleries.

- [physicalintelligence.company](https://www.physicalintelligence.company/research/fast) (exotic styling, full width photo slider is very cool, full width images)
- [matthewstrom.com](https://matthewstrom.com/writing/ui-density/), [another page](https://matthewstrom.com/writing/generating-color-palettes/)
- [daniel.lawrence.lu](https://daniel.lawrence.lu/blog/y2023m12d15/)

### Academic Webpages

- [tomasp.net](https://tomasp.net/coeffects/) (extremely beautiful and impressive)
- [mwillsey.com](https://www.mwillsey.com/blog/rust-intro) (Tufte-style)
- [johnmacfarlane.net](https://johnmacfarlane.net/index.html)
- [jamesbornholt.com](https://jamesbornholt.com/blog/z3-iphone/) (the original inspiration behind my last website style)
- [pit-claudel.fr](https://pit-claudel.fr/clement/) (nice faculty website)

### Documentation

- [unison-lang.org](https://www.unison-lang.org/docs/the-big-idea/)
  - Beautiful: sidebar for footnotes on right (I would elide this), menubar on left, centered text, perfect code blocks, beautiful callouts, shallow per-article heading hierarchy (2 levels only), responsiveness is ideal (5 breakpoints)
  - [Similar website](https://snarky.ca/how-virtual-environments-work/)
- [docs.modular.com](https://docs.modular.com/mojo/manual/get-started/)

### Exotic

- [rsms.me](https://rsms.me/inter/) (website showcasing a font with very nice typography)
- [gwern.net](https://gwern.net/) (a bit much)
- [simonsarris.com](https://simonsarris.com/)
- [makerain.com](https://www.makerain.com/)
- [social-impact-capital.com](https://social-impact-capital.com/) (very nice without the scroll hijack)

### Fonts

- *Sans-serif*: [B612](https://fonts.google.com/specimen/B612), [Atkinson Hyperlegible Next](https://fonts.google.com/specimen/Atkinson+Hyperlegible+Next), [Libre Franklin](https://fonts.google.com/specimen/Libre+Franklin/), [PT Sans](https://fonts.google.com/specimen/PT+Sans), [Inter](https://fonts.google.com/specimen/Inter)
- _Serif_: [Lora](https://fonts.google.com/specimen/Lora/), [Markazi Text](https://fonts.google.com/specimen/Markazi+Text), [Crimson Pro](https://fonts.google.com/specimen/Crimson+Pro), [PT Serif](https://fonts.google.com/specimen/PT+Serif), [Alegreya](https://fonts.google.com/specimen/Alegreya/), [Quattrocento](https://fonts.google.com/specimen/Quattrocento), [Merriweather](https://fonts.google.com/specimen/Merriweather), [Spectral](https://fonts.google.com/specimen/Spectral)
- _Monospaced_: [Fira Code](https://fonts.google.com/specimen/Fira+Code), [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro), [PT Mono](https://fonts.google.com/specimen/PT+Mono)
- _Small caps_: [Alegreya SC](https://fonts.google.com/specimen/Alegreya+SC/)
- _Mixed Kits_ (Serif + Sans + Mono): [IBM Plex](https://github.com/IBM/plex), [Source Serif 4](https://fonts.google.com/specimen/Source+Serif+4) + [Source Sans 3](https://fonts.google.com/specimen/Source+Sans+3) + [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro)

### Color Schemes

- [uchū](https://uchu.style/) ([HN link](https://news.ycombinator.com/item?id=43072338))
- [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme)
- [Nord](https://www.nordtheme.com/docs/colors-and-palettes)
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)

### Comment Systems

- [Disqus](https://disqus.com/) (slow, ugly, 3rd party)
- [Isso](https://isso-comments.de/) (easy SQLite backend)
- [Commento](https://commento.io/)
- [utterances](https://utteranc.es/) (Github issue based comment system - very cool, no special hosting required!) although you give up control of the comment data
- [remark42](https://github.com/umputun/remark42) (remark42 seems very nice and easy, anon commenting is first class supported as well as other external logins)
