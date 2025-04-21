+++
title = "An FPGA Internship at Jane Street"
description = ""
slug = ""
date = 2023-08-23
draft = true
+++

## The Internship

### The Company and Business

### My Background

### The Office

### The People

high competence everywhere - unprecendented in my experience

### The Culture

Game and betting heavy
Compensation

### OCaml and the Tech Stack

Curse and blessing of owning your own tech stack, including language and compiler
- see mozilla (rust), google (go) for examples of good and upstreamable stewardship
- whereas ocaml has basically forked in two and integrating features from upstream is a massive pain

### HardCaml

- cite the hardcaml paper and go through examples and show comparisons with SystemVerilog and Chisel (Scala)
- so many things in Hardcaml are made worse with Ocaml being host language - it is a poor language to host a DSL

### The FPGA Team

## My Trip

### NYC

### London

### Bath

### Seaford

NYC office + NYC itself
London office + London itself
A catalog of my photos from various places in NYC and London and my travels too
Refer to the Jane Street tech blog for things like expect tests, build system (Dune), and other stuff. Consider Nikhil's point about how many of these things are trivially solved by just using an existing tool/language instead of retrofitting ocaml and their own stuff.

insane spending: laptop, ipad + pencil, bose headphones, desktop machine, dev machine, iphone
10:00
dessert delivery from nyc

Trading interns Oreo bet
Lots of swearing
Very limited work blocks

The culture here is very interesting, everyone swears a lot and it's completely encouraged
9:55
Also the full timers make bets with interns all the time, some of the higher ups started placing a max $200 bet limit lol
9:56
Also you cannot work past 7pm, they actually enforce it to make sure interns go home

I'm going to sleep now, but downstairs all the trading interns are still playing poker - they've been playing for nearly 8 hours today!
11:03
Good thing I'm in engineering or else I would also have to play poker like this

One of the interns is a poker pro with 15 years of experience, I just had a poker lesson lol :laughing:. Some of the people here are insane

They set up a carnival with a bunch of food trucks and games, the money is really infinite lol

photo from the office deck

figgie and other board games - culture - full time vs intern separation, desk setup and collaboration culture, pair programming is absent

brookfield place and the yachts in the harbor

the met and met cloisters

Oh and I didn't show you the smoothie bar at Jane street yet, it's very cool they have a bunch of fresh and frozen fruit and mixins and blenders for us to use
figgie championships

Lmao I don't think jokes are top secret
10:46
Interns can't see any of the secrets anyways
10:46
All the trading algorithms are strictly controlled

Surprisingly Jane street claims to have way less flaky fpga infra compared to our competitors, I can only imagine how broken their stuff is

Lol the engineering culture here is starting to get a bit annoying, I'm debugging a steady state error in a control loop and everyone's advice is to just add a register which can subtract the error out! No one even cares about why the error exists to begin with, it's all about getting it to "work", maybe I should stay in academia lol

Well it's not as social as the NYC office, so that's not good. Before coming to Jane street I thought I was socially inept but now I realize there are many levels to social ineptitude lmao :joy:
4:35
But the office food here is insanely good, I guess I haven't sent you enough food pics, they mostly went to Seah lol. Desserts every day, high quality eggs
4:35
It's odd since the NYC office has even more food budget but their cooks aren't that good

1:54
Revamp my website
1:55
Tech stack, monorepo, review system, ocaml itself, ide tool support, in house nature
1:55
Eng culture, office itself, people and quakity, classes, education, code quality
1:56
Secrecy and intern culture, traders, games
1:56
Hiring push, growth and acculturation
1:56
Moving into markets
1:56
Hardcaml itself
1:57
Scope of intern projects vs full time work

Testing methods and ohilosophy
3:01
Build tools
3:01
Mismatch of compilers oss vs Jane internal
3:02
Foreign office visit
3:03
Myopic nature of tech development, no one knows what goes out outside the firm

- https://www.teamblind.com/company/Jane-Street/
Pros
Compensation, benefits, work, smart people, used to be very collaborative, now occasionally collaborative. Making Markets is fun and interesting to study and learn about. In earlier days prioritizing work life balance was done well as it was needed for ambitious workers.

Cons
Silos, secrecy, lack of transparency, no distribution of common tools leading to tools redundancy, project ideation easily and often are shot down, egos, work life balance has gotten worse over the years.

Reasons for Resignation
No cloud tooling or computing, almost-crazy gatekeeping the advanced and new tech available in open source, an innovation shell of its former self.

Not being able to do work from home intermittently is a big handicap, disconnection is not good for someone used to the opposite
9:27
The tooling is bad, soacemaxs is better than vscodez don't force interns to suffer even moee
9:28
More open feedback would be good, better code review, state your intent very early, I already knew the deal early on, just be upfront and honest
9:28
Less random events would be good
9:29
Feeling of no collaboration, no one who really wants to understand and look at code together, lack of pair work is very odd and a big anomaly
9:30
I liked the 1:1 time discussions they always had some useful insights from andy
9:31
You want someone who will work in the mud, I'm not that guy, I hate mud and dirt. I don't like just making it work if it's isn't beautiful and well understood

Hardcaml tooling in particular is bad, it is hard to believe that anyone is ok with this, only myopia can explain it

Parent -> child 1 -> child 2. Child 2 runs forever but child 1 terminates at some point. When child 1 terminates, child 2 is not reparented but is instead killed. Similar issue may exist in SIM command, create test case
Catching cdc is very poor in hardcaml, can we improve this? At the type level or even just post elaboration checking with waivers and sdc xdc generation with false paths and clock domains
Functorize a function or a module or the 'a bring bits or signal for runtime simulation or deferred graph construction

Places i wanted to visit a bit away from the city

- Tuxedo trailhead, bear mountain from mta
- Adirondack lake canoe
- Catskill falls
- Kaataskills falls
- Brickneck ridge
- Cold springs town
- Beacon town, fire tower
- Donut place in beacon
- Blue note nyc
- Philly
- Montauk long island
- Jones beach, long island
- Rockaway beach, pier 11

- https://x.com/typedfemale/status/1911213477118845086

> guy who first proposed a “flat” organization: hmm, what if instead of an explicit hierarchy, we had an implicit one you had to reconstruct in your head with high school social dynamics?

Quite pertinent here.

- Market making, dark pools, options arbitrage, ETF pricing, payment for order flow, retail trading is often like sports gambling so can be exploited, but this isn't in any way the primary business of js
- Educational programs were very good, although only old trading algorithms were shared with us they gave some insight
- Js never stops, once a market has been arbitrated to zero, they will find 10 other markets they can enter and exploit, they are expanding beyond just ETFs and do crypto of course and also commodities options, even down to taking delivery and reselling of oil, very crazy stuff from very ambitious people who never feel the job is done
- The fpga team is small and well organized and growing, they are part of the ull team, hft isn't the main business of js but they want to grow into everything as I mentioned above, can't say much expect for hardcaml
- Their open source culture is very admirable, there are no no competes, very honest company among all the quant firms, trust in employees
- Interns are probationary employees, still auditioning, not part of the team, I felt this was honest and good and provided the right kind of separation
