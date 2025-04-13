# Steps to A Proper EECS Education

- I have some more notes in 90/research/education.md and School_Curriculum.adoc

## What Are We Doing?

What is a higher education for? For even higher education. For lifelong education. For encyclopedic education. For honoring the Gods. NOT FOR A JOB. THIS ISNT JOB TRAINING.

## The Setup

The ideal type of environment, no classes (especially no lectures), just tutors you can consult, the Oxford model is truly the best

## The Tools

Leverage language models

Pick the right materials

## The Methodology

Master your tools. Master your OS. Master your CLI / shell. Master your editor. Master your VM. Make your life hard (suddenly switch to a tiling VM, CLI editor, ...), and it will pay off. Keep your computing environment simple (avoid usage of many random note-taking apps and so forth).

STOP taking notes. Just Do. Do again and again. Whatever you remember will be sufficient.

- Always be project driven to learn things (e.g. learn linear algebra basics because you want to understand PageRank, and learn no more than the minimum you need!) (e.g. learn about Nyquist sampling and immediately capture an audio waveform and play with subsampling or play with synthetic waveform data) (e.g. learn about modulation, then get a SDR, capture data, and demodulate a public signal). Always go from something you want to do or understand, and then learn about what you need. Avoid the structured class-oriented curriculum - nearly all the time, people come out of that thinking they 1) don't remember much and 2) have a weak understanding of the fundamentals that the class builds upon, and thus are still shaky about their understanding. Instead, just sidestep this concern altogether, and focus on learning practical things, and don't fret about solving exam problems or knowing the deep theory.
  - Always write what you learn, publish project reports (even if they are just a few paragraphs long with one plot and some code snippets! it's worth a lot more than you think)

Watch seminars / random talks on Youtube. You will be surprised by how much you learn compared to your peers who look at lecture slides alone.

Classics First

Read papers early and often

Encyclopedic knowledge in EECS is the bare minimum for an undergraduate education. (https://decal.best/)

Sahai (https://web.archive.org/web/20230213214722/https://people.eecs.berkeley.edu/~sahai/advice.html):

> Set yourself a goal of understanding some system from top to bottom before you graduate. For example, you might want to know how the entire process of downloading and listening to an MP3 or OGG file works. This can be a good tool for integrating knowledge across different courses

- [The Lost Art of Research as Leisure](https://kasurian.com/p/research-as-leisure) ([HN link](https://news.ycombinator.com/item?id=43410061))

### LLMs in the University

#### The Need for Discrimination

## Random Notes

- Impact of LLMs
- Tutors (LLMs + human experts) / mentors
- Importance of peers and mentors, the environment is key, motivation and being among many different peers in different domains
- Encyclopedic curriculum (tech + adjacent fields + humanities / classical education)
- Free-form education, change topics at will, no dictation of a strict curriculum
- Simultaneous movement across the stack, increasing depth across the entire breadth as you keep building things / projects
- At what point to switch from foundational structured curriculum, to free-form exploration (imo around the 9-10th grade)
- After learning for a short bit, immediately implement and evaluate. Being a programmer, you should strive to implement things as you learn about them in theory and observe how they behave. Guide your learning this way when studying from a curriculum.
  - e.g. FFT theory -> implement it. copy-and-patch compiler -> implement basic example in Bril or your own custom DSL
  - Get a feel for the thing you're learning about right away, don't wait until 'homework' or 'labs'
- https://hilariusbookbinder.substack.com/p/the-average-college-student-today/comments
  - The average college student today (hilariusbookbinder.substack.com)
  - https://news.ycombinator.com/item?id=43522966
  - This guy is right and wrong. Right about student deficiencies, wrong about how to address them. At the end of the day, it is about students looking to superior beings.

- Curriculum alone isn't a good way to learn anything, especially the way its done at school with a specific class (and textbook maybe) for a given subject. You go through the 'material' take some tests and do some homework and you've "learned" it!? Nonsense
  - You need to immerse yourself in a given subject / problem domain. The best way to do this is to do things and read all over the place (not in a structured way). e.g. for learning ML things, you shouldn't go from front to back of a textbook about the "statistical theory" of ML, rather you should take in bits and pieces from all kinds of sources all at once (Youtube, textbooks, blog posts, papers, LLM interaction). This is why my ML "curriculum" is all over the place - just start ingesting things and trying them, it is not the job of the curriculum to be structured and organized, but that is the natural process that your brain will perform - put in materials, try to understand and connect them, and form good foundations. The 'step-by-step', 'learn all the prereqs before starting the next step' approach never works in practice.

- If we accept that curriculum based schooling becomes less effective over time, knowing that for small children it is good but for middle school onwards education should be guided naturally by the intrinsic interests of the students, then it leads to the idea that higher education should be almost completely freeform
  - Currently, when some gap in knowledge is identified, the proposal is to add to the curriculum in a systematic way or to add a new class or make some things mandatory. It is ridiculous. Identify the students with natural interest, give them things to look at, and let them dive in randomly freeform, focusing on tutoring and the production of encyclopedic knowledge based on topics they need to master, in any order and independent of any class or book or project. I was thinking about the need to discuss the history of computing as part of a cs education as I'm reading hamming's book, but trying to shoehorn it into a college curriculum as a class just sounds absurd. Just like the classic papers in engineering and cs class, this needs to be motivated by intrinsic interest, and dumb rigid class and curriculum actually impede the time needed to master all this background

- https://x.com/Hesamation/status/1899191612854702578?t=43d4gXbGeOK4-SlY_Esm2w

> Andrej Karpathy’s bombshells on how to learn:
> > learning is not supposed to be fun
> > don’t hallucinate of learning
> > learn on-demand, depth-wise
> > teach what you learn to others
> > compare yourself to you, not others

- https://x.com/karpathy/status/1756380066580455557?lang=en

> # on shortification of "learning"
>
> There are a lot of videos on YouTube/TikTok etc. that give the appearance of education, but if you look closely they are really just entertainment. This is very convenient for everyone involved : the people watching enjoy thinking they are learning (but actually they are just having fun). The people creating this content also enjoy it because fun has a much larger audience, fame and revenue. But as far as learning goes, this is a trap. This content is an epsilon away from watching the Bachelorette. It's like snacking on those "Garden Veggie Straws", which feel like you're eating healthy vegetables until you look at the ingredients.
>
> Learning is not supposed to be fun. It doesn't have to be actively not fun either, but the primary feeling should be that of effort. It should look a lot less like that "10 minute full body" workout from your local digital media creator and a lot more like a serious session at the gym. You want the mental equivalent of sweating. It's not that the quickie doesn't do anything, it's just that it is wildly suboptimal if you actually care to learn.
>
> I find it helpful to explicitly declare your intent up front as a sharp, binary variable in your mind. If you are consuming content: are you trying to be entertained or are you trying to learn? And if you are creating content: are you trying to entertain or are you trying to teach? You'll go down a different path in each case. Attempts to seek the stuff in between actually clamp to zero.
>
> So for those who actually want to learn. Unless you are trying to learn something narrow and specific, close those tabs with quick blog posts. Close those tabs of "Learn XYZ in 10 minutes". Consider the opportunity cost of snacking and seek the meal - the textbooks, docs, papers, manuals, longform. Allocate a 4 hour window. Don't just read, take notes, re-read, re-phrase, process, manipulate, learn.
>
> And for those actually trying to educate, please consider writing/recording longform, designed for someone to get "sweaty", especially in today's era of quantity over quality. Give someone a real workout. This is what I aspire to in my own educational work too. My audience will decrease. The ones that remain might not even like it. But at least we'll learn something.

- https://x.com/lmrwanda/status/1900925304971161829?t=litLjJbFM7xAjYM9wByG6Q

Responding to a teacher seething about students unable to sit and pay attention

> This is a misunderstanding of the human mind: kids today specifically don’t care about school because it’s boring and largely meaningless to them, even if they’re intelligent.
>
> Communicating in short self-contained messages would actually be a better use of their time and the teacher’s.
>
> They don’t care about punishments because they know that all a teacher can really do is get huffy with them for a bit or kick them out of class. Which they don’t want to be in anyway.
>
> People (of any age) aren’t actually obligated to show interest in stuff they aren’t interested in, especially if they aren’t choosing to be exposed to it. Being “vacant” is perfectly rational in these situations.
>
> For the vast majority of kids who should be learning to read and write and do basic +-x/ maths and entering the workforce at 12 school is simply a waste of time, for kids who are actually smart it’s a form of horrible torture.
>
> The issue isn’t that “le internet has made it impossible to focus”, it’s that everyone can now carry around a tiny computer that gives them immediate access to any and all information in a way that’s vastly more reliable than “education”.
>
> Education is the thing that actually has to change in this context and in the way it should’ve done decades ago; we need much less of it for most people.

- https://x.com/ChrisExpTheNews/status/1900961057948000639?t=4dTnGItO8R7ZGUVrdRUUsw

> I need you guys to understand that you're all a bunch of outlier autists who have extremely abnormal metacognitive abilities and tendencies to use tech as a tool for learning. The average person does not give a shit about learning. They use tech to do nothing educational.
>
> The issue is not the AP kids learning to music while they actually do their work and look shit up on Wikipedia. The issue is kids with a third grade reading level watching retarded shit on tiktok for 14 hours a day who can't be pissed to do anything ever.
>
> No shit kids respond to incentives. This isn't the schools choosing the incentives, you fucking idiots. You think the schools call the shots? You think parents and the government and the corporate economy aren't the fucking principals here?

Reasonable counterpoint lol.
