+++
title = "My 'Discriminatory' Approach to Interviewing"
date = 2024-05-06
draft = true
+++

My approach to interviewing undergrads (and others). Proven over many years of working with exceptional undergrads.

## Important Things

- Natural curiosity. Inquisitive, but only after exhausting their own options to find answers.
- Hacker mentality
- Desire to write, explain, and teach for fun
- Broad scope of interests, generalist
- Strong programmer
- **Intrinsic** (in the blood) interest in computer science topics
- https://news.ycombinator.com/item?id=43109255 (What Makes a Great Software Engineer (Dissertation) (2016) [pdf] (washington.edu))

> My view of GSEs:
> - Wiliness to test hypotheses, listen to others, seeks input and feedback, and maintain metrics to decide if various methods are or aren't working.
> - Minimal ego.
> - Curiosity about things at lower levels.
> - Mastery of first principles and able to create data structures and algorithms optimized for specific, difficult problems.
> - Ability to debug up and down the stack quickly.
> - Concern for stability and usability by consumers of products and services maintained and delivered.
> - Ability to teach and mentor.
> - Ethical integrity refusing to compromise or exploit users for short-term business gain.

## Irrelevant Things

- Classes you've taken, coursework, homework, and projects completed as a part of a course
- GPA
- Your existing background on any particular research topic or area of computer science
- "Prior work" (especially papers or other publications)

## My Approach

1. Show me your editor
  - Open a random project (anything is fine, class project, personal thing, random open source codebase) and go through it
  - What do you like about your editor? Show off your favorite things it can do.
  - What are things you've done to customize your editor? Why do you think the defaults are bad or insufficient?
1. Show me your desktop environment (or terminal multiplexer or anything in a similar vein)
  - How do you organize your workspace?
  - Do you like having many tasks going on at the same time and switching between them or focusing on a singular task at a time? (there is no right answer, I just want to hear a strongly held opinion)
1. Have you written any tiny scripts to make common tasks easier?
  - This can literally be anything. I even consider bash aliases to be 'tiny scripts'. I'm looking for any instinct towards automation and workflow optimization (and curiosity).
1. Show me something you've played around with recently for fun.
  - This can be anything. A new programming language, an IDE, a library, a random program, a game, or some art. It doesn't have to be related to CS in any way: a new language, some physical skill, exercise, cooking, whatever!
1. What are a few interesting things you read recently? (These need not be books. They can be tweets, blog posts, or articles, among many other possibilities.)
  - Do they motivate any work?
1. What problems in any field of your choice do you think are worth solving and you could attack? How would you start?

Anyone in the know can attest that asking these things and getting meaningful responses gives you high confidence in the person's ability to do research *in any area*.
Asking random leetcode nonsense, 'behavioral' questions, info about coursework projects, and random chit-chat doesn't correlate with anything.
Finally, this is a two-way street: the candidate must also be interested in working with you and on your set of projects, so you must prove you can help them achieve their goals when seeking out research.

## Two Types of Engineers

If I may be a little extreme, I find there are broadly two types of engineers.
I will describe the most extreme forms of each one, but of course, most people fall somewhere in the middle.

### The Type 1 Engineer

The first type of engineer is obsessed with first principles thinking.
He will always prefer to build things from scratch even if existing 'solutions' already exist.

In fact, he craves to tear old things down and build new things up, just for its own sake.
Usually it will be justified by saying that a fresh codebase will allow a set of better abstractions to emerge, but oftentimes, that might be too optimistic.
This type of engineer hates working on an existing codebase, and will often balk when he sees missed opportunities for abstraction, deprecated design patterns or API usage, or merely ugly-looking APIs.

He will be prone to rewriting existing code in a language he prefers, with a programming paradigm he sees as well suited for the problem, and with a new set of abstractions that he creates from scratch.
In the extreme case, he will simply refuse to work on an existing codebase that doesn't meet his exacting standards; this can prevent any progress altogether as he continues to deliberate about reengineering code rather than making any progress.

### The Type 2 Engineer

The second type of engineer is the polar opposite of the first.
He hates building things from scratch and thrives when working on incremental improvements on an existing, large, well oiled codebase.
He is noted for his perseverance and high tolerance.
in getting results and progress out of and high tolerance
This type of engineer often doesn't want to or, in many cases, is incapable of building things from scratch.

from scratch vs iterative
the button pusher

The type of engineer you want depends on the codebase you want him to work on (of course).
Try to coax out where someone lies on this spectrum.

## Other Opinions I Like

### Just Explain Some Concept to Me

- https://x.com/GrantSlatton/status/1803242201482404117

> Back when AWS did a phone screen before onsite interviews, the first technical question I would ask, regardless of level, was “tell me what you know about hash tables”
>
> You would be blown away by the number of allegedly-senior devs who don’t know a thing about them — around 50%
>
> I’d also tailor my vocab to their stated programming language preference, e.g I’d say “dictionary” for Python
>
> Regardless of their answer, the 1 hour phone screen had to go on, but the hash table question correlated to success or failure >90% of the time
>
> Candidates that could sperg out about hash tables for many minutes almost always got an offer
>
> Candidates that didn’t know about them almost always couldn’t code their way out of a cardboard box
>
> And then some in the middle went either way
>
> Extremely good interview question
>
> > What would you look for in a good answer? Time/space complexity of operations, typical use cases, collision resolution?
>
> > > Passable: just knows time complexity and use cases and is comfortable using
> > >
> > > Good: some implementation details like hashing to an index, 1 collision resolution mechanism
> > >
> > > Better: can discuss pros and cons of different hash algorithms and collision resolution mechanisms
> > >
> > > Best: can discuss all the above implementation details in terms of memory locality, cache implications, etc

### Do You Know Your Tools?

- https://x.com/t3dotgg/status/1801503098927779902 ([HN link (flagged)](https://news.ycombinator.com/item?id=40689779))

> The number of CS grads who don’t even know basic git commands is astounding

There were the usual people saying that a CS degree has nothing to do with in-the-field programming knowledge (i.e. tools).
And I agree with this.
This doesn't mean universities should be "teaching" git and other tooling related things, but rather that not knowing these things reflects *individual characteristics* we should select against.
What does it mean when you are studying a topic you are supposedly interested in and have no clue about how it is applied?

> Git is not just a fad; it's a literal underpinning of most serious software development these days, especially if you need to work with others.
>
> That a CS grad doesn't even know basic Git is telling not of their degree, but of the individual themselves - that they have no desire to learn beyond what's taught, and couldn't even be bothered to look into the requirements of the industry that they want to work in.
>
> I argue that it should be a barrier to hiring, on that ground.

### How to Handle LLMs for Interviews

- [Ask HN: What is interviewing like now with everyone using AI?](https://news.ycombinator.com/item?id=42909166)

> I've let people use GPT in coding interviews, provided that they show me how they use it. At the end I'm interested in knowing how a person solves a problem, and thinks about it. Do they just accept whatever crap the gpt gives them, can they take a critical approach to it, etc.

I don't think there is any other way besides letting people show off how they leverage LLMs to improve their own productivity.
People who are already good at programming and problem solving will leverage LLMs effectively, just as they leverage their editor, LSP, programming language, and the Internet in general.

- [AI Killed The Tech Interview. Now What?](https://kanenarraway.com/posts/ai-killed-the-tech-interview-now-what/) ([HN link](https://news.ycombinator.com/item?id=43108673))

> Company A wants to hire an engineer, an AI could solve all their tech interview questions, so why not hire that AI instead?
>
> There's very likely a real answer to that question, and that answer should shape the way that engineer should be assessed and hired.

Good point. Ultimately, what an AI may not have is the *desire* to do foundational things. A human with desire, paired with an AI, will outperform massive teams where each person just doesn't really care.

### LLMs in the University

#### The Need for Discrimination
