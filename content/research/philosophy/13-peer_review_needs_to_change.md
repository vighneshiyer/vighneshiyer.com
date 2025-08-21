+++
title = "Peer Review is a Joke"
date = 2024-05-06
draft = true
+++

# Review and Conferences

- OpenReview is a huge positive move that has recently been adopted widely
- Reputation matters, real name in front of review, or pseudonym even, similar to politics in nature
- No one criticizes the premise of any given paper, lots of quibbling about methodology and experiments and benchmarks but nothing about the motivation and philosophy underpinning the paper itself
- Anonymity is not valuable here. Come on, unless someone is writing a pure critique that may be viewed personally, there is no value hiding your true self. And even if you're writing a critique, put your name behind it!
- I predict with a fully transparent system, all the bad actors (paper pushers, dishonest reviewers, incompetent reviewers) will be purged in a matter of a year.

- No one should have to review any paper. If no one wants to review a paper of their own volition, for free, for fun, then it shouldn't be reviewed. Paper pushing is also about ego of the authors, the ability to bully others into reviewing their paper pushing is a motivating factor for them.
- Especially in an engineering discipline, if no one wants to review your paper, it means it has no impact or value. Unlike science, where papers can change paradigms and challenge earlier results, and where researchers might fear reviewing something that affects the future of their own field. In engineering (especially in our tiny niche of computer architecture), this never happens.
- I frequently review papers that I'm genuinely interested in. I will write notes and ideas and praise and criticisms. I write about these papers publicly as well as in my personal note archive (ideally I should make everything public, just a logistical matter and a matter of time). If that was the standard, 99% of garbage published at ISCA / ASPLOS / MICRO / HPCA would be eliminated quickly.

- Blog posts for conferences, websites first with archival media, and finally why is HTML eschewed in favor of PDFs (and no one pushes hard to change this)?
  - Conferences shouldn't have a 'proceedings' that is published at the conference. Rather, you should be able to submit your posts to various "sessions" and then others review your post (and criticize it and improve it)! At the conference, there is simply reading time and then discussion, and ideally collaboration.

- https://x.com/simonsarris/status/1910900703981109719

> Is there any good reason for publishing papers as PDF instead of HTML? Imagine how much more accessible academic knowledge would be if it were a Wikipedia style web of papers

> What's weird is that this is exactly why HTML and the idea of "links" was invented
>
> This tells us something about academia and it's products
> ...
> suspect enough of academic science is outright fraud that the median paper is not just worthless but the author of the paper probably *hopes* that nobody reads it. They want the publishing, the citations, but they do not want the science, because there often is none.
>
> the more open and searchable, the easier it is for people to attempt replication, the harder it is to hide basic fraud. Not "we stole zillions" fraud but "I'm too lazy or these results don't work but I still want to be seen publishing to get my grant money or phd" fraud.

+++
title = "The Free Market vs Cartels wrt Research"
date = 2023-08-23
draft = true
slug = "free-market-vs-cartels"
+++

- Generally speaking, why do 'free market' squares like HN, reddit, twitter, ... and so forth surface much better research than conferences/journals?
- Consider the free market system where people pick things that are truly interesting and useful, use aggregate consensus and organic reputation-limited voting, and engage in 'peer review' via comments (this resembles the Roman Republic, not perfect and more reputation orientation would be even better).
- Compare with the 'conference' system where professor are worked like slaves, 'bidding' for papers, reading a bunch of garbage they don't care about, no involvement of industry experts interested in real problems, and the completely opaque process of 'peer review'.
- Why do we have to put up with these cartels? These academic conferences are worthless (in nearly all cases). Can an academic research group establish itself solely on self-published works, open source projects, and blog posts? Seems unlikely, but still worth trying, due to the cartel effects of the current academic 'review' system.

- https://blog.neurips.cc/2025/05/02/responsible-reviewing-initiative-for-neurips-2025/
  - This is completely the wrong approach. NIPS is trying to reprimand people into reviewing random papers they don't really care about with all kinds of penalties. Trying to force 'reciprocal' reviewing is not a good idea.
  - This doesn't actually solve any problems. The root issue is that people are writing nonsense that no one cares about. And they want to force 'reciprocal' acknowledgement of nonsense to perpetuate this system of paper pushing.
  - Note how when people actually care about some paper, they print it out, read it, write notes, comment on it, talk about it with others, and so forth. It just so happens that only a handful of papers deserve this treatment and people give it this treatment **organically**, no forcing required. The solution is to leave papers to live or die on their own. Put things out there and have the good stuff organically rise to the top, while the vast majority of paper pushers are buried under their own garbage.

- Imagine Aristotle harassing others to review his philosophy, that is a joke
  - Good things bubble up naturally
- Imagine a book author harassing others to 'review' their book and saying that in return they will review someone else's 'book'. This is the insanity that passes for 'peer-review'.
  - If no one cares to review and comment on your work organically, then it is worthless!!!
  - Imagine if companies demanded other companies 'reviewed' their products.
- You are not Galileo, fighting against scholars who oppose your views and therefore you deserve a fair and objective hearing of your claims. You are a nitwit paper pusher in a fat bureaucratic bloated academia.

There is no reason why all papers published at a conference can't make their artifact at least available as a condition of publication. There is no justification for this at all. This would quickly root out people. Furthermore, if they used any 'base' code on which their paper built on top of, they must make it explicit what the diff is - or have a systematic way to find the diff (e.g. history in a git repo). Literally publishing anything is better than nothing - it doesn't even have to compile or work or produce results or even produce the same results as in the paper. This is truly a truly bottom of the barrel standard.

- https://asterainstitute.substack.com/p/scientific-publishing-enough-is-enough

### Anger from Others

- https://www.linkedin.com/posts/matthewguthaus_iccad-activity-7345590525405614080-Jjb0

> Matthew Guthaus from UCSC
>
> Disappointed with the quality of some ICCAD reviews this year. It's concerning when reviews reflect a lack of fundamental understanding of EDA concepts. Rigorous peer review is critical to maintaining the quality and integrity of our field.

> > I suggest every academic conference do this: (1) prepare a good review guidelines for its community, (2) require all authors and reviewers to complete the training to make sure that they understand and follow the review guidelines, (3) block reviwers that frequently vioate the guidlines from future paper submissions.

> > Reviews at DAC and ICCAD have been an incredibly sad race to the bottom of meaningless gotchas, unfortunately. Also, I suspect we're headed towards a giant reproducibility crisis because there's no incentive or requirement to make your work available publicly. We hide behind the fact that tools are closed source, but for one, use OpenROAD and second, many papers dont rely on closed-source EDA tools anyway.
> >
> > Yup agreed, we should explore actual open review. And something else to consider: one industry review per paper. I found at ICLAD (where we had a lot of industry reps on our committee) that reviews are more positive in general and not hyper-focused on novelty for novelty's sake, thus providing a counterbalance of sorts. And, I'd be super in favor of a "systems" track where we reward papers for building and releasing tools (or datasets and benchmarks), which is what DAC was known for at its zenith...(right?)

- https://www.linkedin.com/posts/hoquek_hardware-eda-conference-activity-7325183708037074944-xxMW/

> I have been a TPC member in EDA/hardware conferences for the last 7 years. TPC members in many of these conferences (e.g., DAC, DATE, etc.) suffer from a very high paper review load. This indeed impacts the 'quality of the review' by the reviewers. For instance, in the last couple of years, I have heard many frustrations from authors in these venues about the reviews they received regarding 'shallow reviews,' 'irrelevant reviews,' 'incorrect comments', and so on. These concerns are not unique to the EDA/Hardware community but are also common in many other domains. I guess this is the right time to impose the rule that every submission to these conferences needs to be followed up by a mandatory peer review. If someone submits X number of papers, then the senior author of that paper must review X number of papers. This will reduce the review load on the TPC members/reviewers and help them to enhance their review quality. I feel there is an urgent need to rethink the whole review mechanism in these conferences and add the concept of reviewing the reviews by the TPCs to avoid bad quality reviews. Of course, this idea is not 100% foolproof and may need enhancements. However, we need to start from somewhere before it is too late. Feel free to add your views and suggestions.

> > I think this is because “EDA” conferences have become “applied machine learning” and “ML accelerator” conferences. As a result, the submission is exploding (just like all ML conferences), and reviewers are overloaded and review comments become quite shallow & random. If we look at the hardcore EDA submissions, they are still quite limited.

Ultimately, these people only partially get it.
Poor review quality isn't a 'problem' that needs to be 'solved' by new "review standards", or forcing submitting authors to review an equal number of papers, or even fully open reviews.

The root cause is: no one cares about nitwit work.
So the solution is to simply cast it aside.

- https://www.acm.org/publications/policies/new-acm-policy-on-authorship
  - READ READ READ. Claiming to be an author without meeting these criteria is FRAUD. How many professors are guilty of authorship fraud? Easily tens to hundreds of the 'most published' 'highly cited' professors in computer architecture.
- https://www.usenix.org/sites/default/files/sec25_message.pdf
  - The security people have had to deal with this nonsense too.

> An analysis of the submissions revealed that 14 authors were listed on at least 15 papers. While this represents a tiny fraction of the 6,590 registered authors, the extremes are concerning: six individuals appear as co-authors on 20 or more submissions, with two authors appearing on 36 and 39 submissions respectively. At such volume, it becomes difficult not to question the nature and depth of the contributions attributed to these individuals.

So this is basically an admission that there is fraud going on. Why so secretive about who's involved though? Why so cowardly? At least accuse them and let them produce their own response. The public will decide.

- Point how out everyone is a coward and no one is willing to call out authorship fraud even though it is so obvious, especially in the extreme cases
- Peer review through forcing reviews is such a dumb idea
