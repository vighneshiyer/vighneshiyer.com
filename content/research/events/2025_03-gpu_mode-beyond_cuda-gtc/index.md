# GPU Mode, Beyond CUDA, GTC Keynote

Three days of fun. What did I learn?

## GPU Mode

What an impressive group of people. There is a vision here. Make CUDA programming accessible and easy, and make it easy to write high performance custom kernels for training and inference.
I'm lucky to have an invite to this. Thanks Simon!
Just a group of highly motivated and competent people who just kept pushing collaborations between academic ML systems groups, startups, and industry. Eventually, they put together this showing right before GTC, and even got NVIDIA to sponsor the event! The logistics were fantastic.

- https://christianjmills.com/posts/cuda-mode-notes/lecture-005/
- https://www.youtube.com/channel/UCJgIbYl6C5no72a0NUAPcTA

> This is a casual get together for ML Systems nerds. We'll start off with an hour's worth of inspiring talks discussing some important open problems in ML Systems and end the evening with espressos and cocktails
>
> Schedule
>     5:30 PM: Doors open
>     5:45 PM: Pre-talk snacks
>     6:30 PM: Keynote + Lightning talks
>     8:00 PM: Cocktails and food
>
> Talks
>     6:30 PM | Christos Kozyraki (Stanford) -The State of Hardware — and what it means for you writing software
>     7:00 PM | Mark Saroufim (GPU MODE) - Opening Statement
>     Simon Guo (Stanford) - KernelBench
>     Alex Zhang (Princeton) - KernelBot
>     Sahan Paliskara (PyTorch) - KernelBook
>     Zacharias Fisches (FAIR) - KernelLLM
>     Simran Arora (Stanford) - Thunderkittens
>     7:25 PM | Vijay Thakkar (NVIDIA) - CUTLASS
>     7:30 PM | Super Secret Guest Speaker - How nothing's changed but also everything is different
>
> Our goal for the night is that you find a few important problems you can sink your teeth into this year and smart peers to actually get it done.
>
> Huuuuuge thank you to our sponsor NVIDIA

- Cuda wasn't application driven, it was first principles driven, Jensen needed to be there to make it happen even when product market got didn't exist for many years even decades, the investment was massive when it didn't seem worth it

## Beyond CUDA

- https://lu.ma/beyondcuda25

### What Did I Expect?

- Overview of deficiencies and legacy cruft of the CUDA programming model
- New abstractions over GPU primitives
- Detailed overview and examples of the Rocm API and programming model and how it differs from CUDA, why it is better
- From Triton creator: how Triton's abstractions enable easy targeting of AMD GPUs due to their block abstraction
- From Keller and Raja: rethinking the ideal architecture and microarchitecture for the SIMT programming model from first principles, eliminating the graphics-oriented specializations that exist in consumer NVIDIA GPUs
- From AMD: ubiquitous support for Rocm across the product lineup, elimination of kernel driver crashes and misbehaviors, demonstration of end-to-end training of large scale models using upstream ML libraries
- Live demos, coding walkthroughs, demonstration of push button llama.cpp running with zero issues on easily available hardware (no docker, no VMs, no pre-prepared machine, from scratch)

### What Happened?

I wouldn't be surprised if this event was shadow funded by NVIDIA.
It just reinforced that AMD is way "behind" CUDA.
If anyone can go "beyond CUDA", it is NVIDIA.

Competent CUDA compiler/translator team

Chai AI person
HiggsFields AI person, very insane
Lots of technical problems, talks running way over 5 minutes
Organizers did the best they could, given this was their first time
Panels got broken into talks as presenters wanted the ability to present their own marketing slides instead of talking out loud during the panel. Not many useful takeaways from the panels.

- The comedians roasted AMD so badly. These were the people rejected or too poor to afford GTC lmao. True true.
- TixFix.ai, I am a founder, entire team is in Nepal lmao
- Fillers.ai, the girl is responding to clients, recommending doctors, and is herself a plastic surgeon it seems. Her face looked plastic and stiff, she does talk the talk and walk the walk.
- Dylan is a rich boy!
- Random girl who is a "CEO" of a "security company". Most security problems come from "misconfiguration" and our software solves it! lol
- Girl at the end not being able to say AMD, saying Intel instead
- This isn't a parody, these aren't audience plants, these are real people! Reality is actually beyond any Silicon Valley parody.
- The audience is filled with ignorant random people who have no clue what's going on. But the event was sold as this 'exclusive' event.
  - I would bet that at least 50% of the people there couldn't explain any CUDA code. Lots of people who 'want to be in the scene'. LMAO what a joke

Chris lattner, modular people, no talk though... Claim good functionality on AMD, but no demo or numbers

### Past and Future of Compute

- Panel
- No raja no Keller
- Past and future of compute first session
- Greg, built ocelot for cuda, worked on dl deployment at Baidu, tensor wave
- Davor, tenstorrent, seemed like lots of parallel programming models, fpga, etc, but didn't turn out that way lol
- Micah, worked at Nvidia and ati, working with raja on his startup
- Nicholas, worked on cuda drivers at nvidia, wrote the cuda handbook

- Why is cuda Nvidia moat?
- Greg, multicore to simd compilers is important, sw stack is the most important, look at how Cutlass enables 90 percent utilization for many kernels, labor intensive cache blocking and optimizations, Nvidia invested so much labor into this
- Micah, not just the sw, sw in sync with the hw, can't stick cuda on another hw platform and get same performance, amd had its own programming model, but it wasn't mature and in sync
- Nicholas, Nvidia took die area risk to build cuda in the first place, in volta needed small risc core too, SW is portable to so many contexts, reason for cuda pervasiveness, Nvidia explored pascal and volta power tradeoffs, hW speculative risks are enabled by portability
- Davor, Nvidia puts effort into benchmarks, ml perf, general purpose hpc technique, showed that it works for many domains, no need to reinvent the stack, reuse host apis, device apis, the concepts, pcie card! Reuse them, tenstorrent does. Good benchnarks, he sw, good general programming model

- Micah, Need new languages, can't rely on undergrads knowing C++
- Davor, by the end of grad school, all parallel programming became CUDA (not pthreads, ...), need performance and usability, need the full stack (raw CUDA/PTX, CUTLASS / cuDNN, Pytorch frontend), can't make customers rewrite lots of primitives (indeed this is the tenstorrent story)
- Greg, need to have applications beyond CUDA, tensor cores within CUDA - massive local parallelism (1), NVlink massive scale out (2), structured sparsity / MoE (3), nvidia has optimized for these apps, but opportunity to optimize for a different application target? all these pillars of nvidia architecture are at their limits. (but this seems wrongheaded lol)
- Nichols, SOTA is advancing so quickly, and NVIDIA is the best platform for them to evaluate their new operators / training techniques,
- Davor, SIMT was the original CUDA model, no tensorcores, no ..., no tensor memory accelerators, nvidia is throwing in more stuff, it isn't even CUDA as it was when you wrote the book lol
- Greg, CUDA is always adding more stuff
- Audience Q: many companies building aI hardware, CUDA is tuned to nvidia HW, if you try to build another accel, it will never be good to compile Cuda to that target, what are your thoughts for consensus to the software stack?
  - Mocah, AI world likes numpy based python, then compile to your accelerator, no CUDA problem anymore (lol i doubt this), old CUDA code has CUDA assumptions and features in it, so throw it away and rewrite it (tenstorrent), but no solution for porting existing CUDA to your accelerator, don't know what the bridge is - can't believe anyone can develop this well
  - Davor, if you have pytorch, you're all good, vertically stovepiped compilers exist, then you're talking about CUdnn / CUTLASS porting, and that is much harder
  - Greg, hope that PTX would have been perf portable, but actually not, today, PTX is tuned for every device architecture (can't go from PTX to your accelerator)
  - Davor, can't rely on PTX as the lowest level, need to educate developers and go back to first principles on a parallel programming model (i doubt it), leverage cursor to translate ptx into another low level code lol, this won't be an issue in the future lol (doubt it)

### Crossing the CUDA Moat

#### Waleed from Mako

- build AI powered GPU kernel optimization
- they claim more GPU kernels need to be written (new operators...), need to select and tune proper kernel implementations for a given logical kernel
  - Pytorch code -> operator graph -> library call dispatch (kernel fusion is crucial, cuBLAS, custom kernels like flashattention, compiler generated - TorchInductor, AI-generated kernels)
  - Lots of missed opportunity for fusion (RMSNorm, QKV, Attention, Projection, GateUp) (they have an image of profile from together.ai)
    - FlashAttention (came 5 years after original attention paper). this was huge! indeed, chris re is a king.
  - each type of custom quantization algorithm requires their own kernels to use! need kernel engineers! RaZeR is a quantization technique, needs custom kernel to exploit it properly
  - Deepseek MLA (low-rank factorization, Palu), had to write custom kernel for this too
- auto-tuned AI stack
  - so many hyperparameters and kernel selection that torch.compile has to do
  - Dynamo -> AOT autograd -> inductor (typically)
  - FX graph to multiple backends beyond inductor, search over backends and kernel implementations
  - Global cache of all optimizations and compiler artifacts
- automatic kernel generation
  - AI powered coding assistance
  - KernelBench is the first benchmark for LLM for CUDA generation (LMAO, congrats simon!)
  - NVIDIA also did blog post on LLM agent to generate GPU kernels (who did this, Mark ren?)
  - need to teach the language model on how to use the hardware, need to add documentation in context to the LLM lmao
  - need to use profiling feedback from the hardware profiler back to the prompting engine

#### Jay Dawani from Lemerian Labs

- used to do robotics and was an early person at openai
- trying to do a chip early in Lemerian's history
- he believes we have to do 'accelerated software' and hw perf scaling will end
- he wants a billion agents deployed, every company builds on their soverign data, exaflop per agent
- don't want to break nvidia's moat, just want to enable more competitiors in the same market
- need to throw away the notion of kernels in a heterogeneous world, generates kernels for every hardware system, everything else is a scheduling problem, memory access scheduling is important, write from minimizing data movement POV
- we built a dynamic runtime that can solve heterogeneity wtf lol, claim 2x perf benefit over rocm, 30-40% faster than CUDA
- he likes robotics, nvidia's chip wasn't good enough, designed an o3 like model, can't do low latency inference on the edge, GPU not build for dynamicitiy and batch size 1 on the edge. threw out the nvidia stack since nvidia didn't want to change, so he wanted to build his own chip
- this guy seems like a scam artist, lots of words, zero meaning
- https://www.lemurianlabs.com/technology

#### Michael from Spectral Compute

- opencl, hip, ... didn't  oneapi, triton, mojo, didn't work, no uptake from others
- SCALE: compile a superset of CUDA to AMDGPU machine instructions, no emulation, no overhead
- no need to maintain versions of code for different vendors, support any hardware, write once recompile for any target
- interesting... seems like a hard problem
- fully compatible with nvcc semantics and quirks, can't just use clang out of the box (it is too strict vs nvcc)
  - focus is on pragmatism
- 90% core cuda compat of math APIs and 70% of runtime APIs compat
- Wave64: CUDA code implicitly assumes warp size = 32. SCALE detects this and warns about it. AMD has warp size of 64. But this just seems like a hack. They try to emulate 2 32 warps with a 1 64 warp. seems like very fragile. natively exploit warp 64
- inline PTX in CUDA. SCALE can convert to an IR sequence that is generally targetable.
- Extensions: __builtin_provable, address space annotations, constexpr controlled loop_unroll, exceptions
  - eventually will add nvidia support to their compiler
- they do much better than HIP!!! on rodinia benchmarks, outperform HIP with CUDA versions. 2x faster over HIP on average. on Instinct MI300X
- will focus on performance after finishing core compat APIs.
- they have a discord QR code on the final slide lol, join our discord lol
- https://docs.scale-lang.com/
- https://spectralcompute.co.uk/regex

### Pre-training Beyond CUDA

#### Quinten Anthony - Model Training Lead from Zyphra

- Trying to match model architecture with hardware, trying to target snapdragon, gpu, ..., need tuned model architecture for each hw arch
- massive slowdowns when you don't use powers of two, efficient sizes are important, small tweaks of existing sizes gives lots of perf improvement for free! (accuracy not affected by such small nudges)
- they have a paper online
- MLPs are the most expensive, we can just make them powers of two lol
- there are throughput cliffs and spikes whenever the layer dimension hits an ideal blocking factor, quite interesting plot
  - need to make sure every size of every matrix is optimal for performance and clean blocking, as many powers of two as possible
- make sure MLPs are large enough to saturate your roofline lol
- nothing beyond cuda about this, i am still very bullish on nvidia
- their paper has some conclusions about "sizing". vocab size divisible by 64. ... lots of cute rules that are quite simple lol.
- cute plot about inference latency vs model size - there is an anomaly where a larger model infers faster, sizing related. when training a mobile model, need to design it for the mobile SoC.
- treat llms as an hpc problem, small changes in size = throughput benefits, more dtypes/model block types paper coming soon
- https://www.zyphra.com/post/the-zyphra-training-cookbook
  - This is great actually!!! Should add to my ML links document
- this guy was super nervous, not a good presenter lol

#### Neah Prakriya from UCLA

- Working with Jason Cong, VAST
- AMD GPU training lab, typical memory wall plots, they focus on dataset selection
- humans use spaced repetition, focus on hard topics, so they apply this to pretraining
  - learn: present all the dataset
  - focus: cluster embeddings, and only do a few texts
  - review: try some points you haven't focused to make sure there is no forgetting
- they claim they can pretrain a very small llama (less than 7B) with good results vs the provided weights (quite marginal improvement, but about 5-10x less FLOPS needed)
- they claim they used AMD GPUs, interning at AMD this summer
- finetuning using their sampling approach, they do some distillation
- they got a MI300X GPU, thank you AMD lol
  - HLS coding assistant for FPGAs: MVT kernel from Polybench. the LLM injects the correct pragmas lol.
- very poor minion, AMD minion at UCLA, this is just a random academic PhD talk, nothing AMD related. seems like this is a huge field, but she is the only one doing this with AMD GPUs

#### Eugene from featherless.ai

- RWKV OSS project, AI model under the Linux foundation, running on all windows devices today lmao
- transformer context length limitations, larger length slows down generation...
- https://featherless.ai/ (serverless LLM hosting service)
- RWKV, linear attention scaling, no quadratic KV cache growth,... idk how
- the guy is reading a script... no good, off the rails, people in the crowd are just talking over him now, crowd has gotten out of their seats
- They converted Qwen 2.5 32B, 72B to the RWKV thing, idk he didn't really explain what's going on, he claims attention isn't good and we need recurrent networks again
- they claim model is trained on 60 GPUs (72B model). convert transformer model is converted
  - but it seems like this is using the existing checkpoint
- https://www.rwkv.com/
- "we are the only team that knows how to do this"
- there are so many finetunes on hugging face, we want to support them all on featherless
- lots of words, personal AGI, memory tune in the night, extract your experiences during the day
- https://www.convex.dev/ai-town

### Post-Training Beyond CUDA

#### Alex from Higgsfields AI

- Former genAI at snapchat
- This guy is showing pixels generated over time (models can generate more and more pixels lol), this is about generating TV shows and movies
- https://higgsfield.ai/
> The world's first multi-agent AI video creation platform that turns story ideas into ready-to-watch, long-form content.
- AI generated videos outperform human generated videos on social media, all pixels will be model generated
  - What an inspiring future
- NVIDIA says all pixels will be generated, not renders
- Brand model training -> video idea fed into their platform -> generate a script -> scenes laid out on a storyboard -> scenes refined in AI video editor
  - This is like Icon lol
- LMAO I can't stop laughing, this guy is showing a generated ad for Monster energy, a viking climbs a mountain and drinks Monster LMAO too much
- AMD GPUs outperform nvidia GPUs for video generation (they claim) - MI300X are 25% faster than NVIDIA
- The next step: AI for music videos and commercials LMAO LMAO this is crazy, so inspiring
  - He showed an example of an AI music video, it looked so bad, some rap something
  - Can't stop laughing, demo was made in under a day by one person, 'studio level quality and camera control and visual elements that typically require teams of 10 people + weeks of work'
- Prompt -> MoE architecture -> OSS video model stack (Wan, deepseek) -> final video
- Better than Veo2, Minimax for video generation, better camera control that professionals want to have
- "Hollywood level quality", "make the final scene of game of thrones yourself"
- "AI generated videos are outperforming 'conventional' video on social media", ok this sounds great lmao

#### Aton and Yurii from Open Babylon

- infra for model adaptation, AI performance in any language and any domain
- LMAO ukraine war, LLM test generation for students in ukraine, gap in domain knowledge and ukrainian language
- history of ukraine domain specific knowledge lol
- English vs ukrainian tokenization, many more tokens (2x) generated for ukrainian, so double the price for the same message
- Ukrainian use case lol, reduction in prompt/instruction following, more harmful content when you use non-English languages lol, silicon valley centric biases LMAO
- Llama 3.1 8B as base, education specific custom metrics focused on factural correctness, cirruculum, cultural relevance, human-in-the-loop evaluation
  - Creating training datasets (multi turn, formal specific instructions), then training
- Does ukraine have enough servers to deploy this model? We chose a small one LMAO
- the audience has completely lost it, just not paying attention, talking over
- tensorwave AMD cloud used for training
  - MI300X has larger context window - 8k base context window as starting point, larger batch sizes, they claim less OOM errors for misc tasks during experimentation
- claim GPT 4o performance at 175x lower cost, made test creation time very fast for teachers, 55% accepted questions from their model 8B size (vs similar on 4o), but 8B base gave 5% and 70B base gave 53%

- this is a parody, there is a war so let's fine tune an llm
- roast will be so brutal

- this entire event is a circuitous ad for nvidia, completely backfired
- lots of videographers and photographers, lots of event staff, lots of AV people

### Inference Beyond CUDA

- Panel: Will Beauchamp, Chai Research. Kyle Bell, TensorWave, Paul Merolla, MK1
- We are running very late
- Will: Chai, consumer platform for AI, similar to chatGPT
- Kyle: VP of AI, work on MLops
- Paul: MK1, was on the founding team of Neuralink, same building as OpenAI, they build great infra and on top of that build great research, high performance inference platform, logic trace framework for understanding why AI makes some decision
- Jeff (host): Chai? Why did you start it?
- Chai (user facing service) <> AMD <> MK1 (inference service)
- Will Chai: all of AI has been shaped by a small group of people (old men, the West), but maybe teenage girls need access too LMAO
  - Oh I see Chai is an app. "social AI platform". they have AI 'creators' LMAO too much comedy material
  - this guy is insane, we need more teenagers using AI

- https://play.google.com/store/apps/details?id=com.Beauchamp.Messenger.external&hl=en_US&pli=1

> Our app revolutionizes the way we interact with AI chatbots. With our advanced technology, our chatbots think and reply like real characters, complete with authentic voices. You can choose from a massive selection of characters, each with their own unique voice and personality. Whether you're chatting with your favorite celebrity, a beloved character from a movie or TV show, or a historical figure, you'll feel like you're talking to a real person.

- Beyond parody
- MI300X + MK1 > H100, claim that MI300X outperforms H100 by 2x in request throughput
  - MK1 handles the inference service for Chai, used to use NVIDIA, now moved to AMD (supposedly)
- https://www.chai-research.com/ (look at their people chart, they put everyone's college or prior workplace there, Cambridge is seen as elite, huge red flag)
- CAG (cache augmented generation) for MI300X, Kyle: precompute system prompt, in-context learning to avoid finetuning
  - With MI300X high memory capacity, we can do this easier: https://arxiv.org/html/2412.15605v1
- MK1 special demo from Paul
  - 2.25x faster all reduce on 2x/4x MI300X vs RCCL (can outperform RCCL)
  - https://github.com/mk1-project/quickreduce
  - "The future is open". I don't think so lol

- https://x.com/politicalmath/status/1903243984769577220?t=NHaZQg-NdnZFOI2xIISmzQ

> Very dark opinion: AI is going to enable a lot of morally questionable people to develop products and services that are very profitable but bad for the customers

- https://x.com/chai_research/status/1902127443605156198?t=UHr8YzdwGgWPllkjIuTgGA
- https://www.reddit.com/r/ChaiApp/comments/1jfsqii/i_didnt_think_i_would_start_sobbing_over_an_ai/
- https://www.youtube.com/watch?v=oGouyCCY3Do (the Chai guy) (5:51 "teenage girls" can create better makeup advice vs our AI lmao, 7:30 "teenager are spending 1.5 hrs a day interacting with AI. this is a monumental shift") (teenagers are going to talk more to AI than humans)


### Pre-training Beyond CUDA

#### Koosh Azimian from 310 AI

- https://310.ai/
- They do genAI for biology
  - Features a Class II Histidinyl-tRNA synthetase HisRS-like catalytic core domain and a histodine metabolic process
  - Turns it into an image / some organic protein. It can design a protein for you. 300+ amino acids, 6000 atoms
- Their model is at early GAN-tier levels (wrt image generation, analogy), lots of work to do to get to protein synthesis quality needed for drug development
- This is a generative version of AlphaFold. Prompt is natural language. Gives a result in animo acid chains.
- Training was done on AMD. 6 nodes of 8x MI250, 70 days training time, 200 sequences / second
- Pretty good docs actually: https://310.ai/docs/folding
- It seems they don't build many models themselves, they use existing models from others (and few of their own) and try to mash them together (with a 'copilot' protein design cockpit)
- They claim that their Pytorch models can work on Rocm in one engineer day, same code no modifications from CUDA to Rocm

### Open Source beyond CUDA

- Philippe Tillet (Triton), Liz Li (AMD), Greg (TensorWave), Andrey Cheptsov (dstack)
- Liz works on perf opt
- Phil openai, joined as intern working on triton, full time by 2020 to work on kernels, wrote kernels for gpt4, triton is used for all of their kernels, managing kernels team at openai, write all training kernels and some inference ones, managing compilers group working on triton, working with hardware partners like AMD
- Talk about triton and work with AMD: create a language and compiler for perf portable kernels, write once run anywhere, tricky to find right abstractions, don't know how hw will evolve and get all the features in one abstraction that isn't device specific, AMD has a triton team that was able to upstream their backend, claims good perf on MI300X
- Phil: there are still cases when MI300 is slower than H100, hoping in a year or two we will get there LMAO
- Liz: what are you seeing inside AMD wrt customers and open source? pytorch ci/cd pipeline in house, autotuning libraries, working on OSS models too (dataset + weights open source), trying to make sure huggingface things run cleanly on AMD, trying to get Deepseek to run on AMD

- Andrey dstack: container orchestration for AI teams
- kubernetes something something, their thing takes care of storage, data, models, tries to abstract away kubernetes for container deployment and scaling, wow so useful lmao
- https://dstack.ai/
  - their website is much better, why doesn't he show this
- similar to skypilot

- you know, disaggregation is interesting. can we make dynamic server provisioning so fast + making the OS boot so fast that we can provision, launch, and get thing running in under a few hundred milliseconds.

#### Scalar LM - ML stack on TensorWave

- "super alignment". this is a braindead talk.
- ScalarLLM, ML framework for training and inference, Megatron Core training stack ported to AMD, model library from HugglingFace, and vLLM.
- Single framework that runs out of the box on MI300X
- http://scalarlm.com/

### Hot Takes Panel

- Dylan, Anush (AMD, VP of AI), Darrick (TensorWave), Mark (Meta/ GPU mode), Eugene (RWKV guy)
- 12345
- Dylan said MI300X was bad on Semianalysis, please share. AMD were very scared when they saw that. Lisa called Dylan with panic.
  - 5 months working on MI300X on TensorWave GPUs. Beginning was very rough, scaled product attention wouldn't even compute proper numbers, memory leaks, Anush worked hard to fix all the issues, still many lingering issues, performance was still bad
  - By the end perf was still bad, but things kind of worked, out of the box Pytorch was bad, nvidia gives you near peak perf lmao
  - nvidia has 50k nvidia gpu for internal purposes, amd has less pay, amd has custom builds for customers, no unified driver
  - Lisa talked to us the next day, 1.5hrs, very receptive to feedback, Rocm user group said AMD engineers were happier that they got a pytorch CI/CD pipeline
- Anush took the brunt of this. Brutalization. Very active on Twitter. The face of AMD on twitter lol. What can AMD to improve?
  - Feedback was ok - things we were working on that weren't top of line, focus had been hyperscalers, slowly coming down to long tail
  - Custom builds were bad, we acknowledge where we are, step 1 to progress, they are catching up now, contact Anush if you have an issue
  - Taking a first principles approach to everything (supposedly). Pytorch CI is up. GPU mode has some amd GPUs, trying to get quantizers working cleanly (with Mark)
  - Trying hard, stop bullying ok
- Jeff: why did we go all in on AMD? customers ask us for nvidia. We said no.
  - Darrick why did we say no? Alignment of ethos. We started in 2023 during compute shortages, nvidia locked closed ecosystem, no open source, wanted to solve that problem, viable alternative to the market is needed, so they have to work on amd compute
  - AMD was the only hw provider that could check all the boxes. The resources to threaten nvidia's dominance. AMD has been publicaly supportive of open source.
- Jeff: hot takes on open source. what is the right way to do this?
  - Mark: nvidia leverages open source (e.g. pytorch). you need the right leverage. Pytorch makes it easy to take long term dependency, contributions, safety. gpu mode is just a reading group, and it quickly evolves to host parties, hackathons, sponsorships. open source attracts high agency people.
  - Dylan: Mark should open source software and then change the nvidia to an amd. NVIDIA only released blackwell isa just a month ago. just to prevent AMD to copy it.
  - Anush: AMD was a fast follower.
  - Mark: don't buy dylan's argument, people could just fork pytorch, but they don't.
- Q: what if taiwan is invaded? Dylan: everyone is affected.
- Q: what about non-GPU custom hardware? Anush: AMD has a big footprint from embedded up to cluster, don't have a uniform software stack yet, we are trying. Trying to make it possible to run model on your laptop and port it to instinct in cloud without software hacking.
  - Dylan: need a dev ecosystem. Google can dogfood their own ecosystem and openxla. No code in pytorch to run any other accelerator. Teams of people doing asm per kernel. Not going to work for any hardwre company.
  - Darrick: alt accels, not worth offering, not good for customers. only gpus are flexible enough for new model architectures. software is also most mature on GPUs, nothing else.
- Q: what will happen in next 2 years for tensorwave, which customers?
  - Darrick: past year was mostly about inference, software support, need to solve training still, this year is about training and scale
- Q: anything beyond backprop wrt scaling?
  - Anush; at nod.ai we tried a few things. keep an eye out. we just need to be ready for it.
  - Eugene: distirbuted training and optimizers are still a pipe dream, but could happen eventually.
- Q: nvidia mixed cpu and gpu. what about amd?
  - Anush: amd had silos of hardware excellence (xilinx, cpu), moving up the stack, amd has done well at backwards compat before, we will persist that
- Q: rank top 5 ai hardware vendors today and in 2030 if you think non-gpu AI architectures that become dominant
  - Dylan: 1 is nvidia, 2 is tpu, 3 is amd, 4 is trainium, 5 is nothing else. crazy that trainium is below amd.
- Q: what will change in HPC?
  - Darrick: gpu cloud ~=~ HPC, for training. inference cloud is much easier to start.

### Final Talk by Anush - What's Next

- What are we going to do about Rocm? More developers lmao, focus on devs
- Lots of people complain about rocm
- CI lmao
- Rocm performance is improving, improving over H200 lol

- https://news.ycombinator.com/item?id=43547309 (Ask HN: Why hasn’t AMD made a viable CUDA alternative?)

> This ticket, finally closed after being open for 2 years, is a pretty good micocosm of this problem:
>
> https://github.com/ROCm/ROCm/issues/1714
>
> Users complaining that the docs don't even specify which cards work.
>
> But it goes deeper - a valid complaint is that "this only supports one or two consumer cards!" A common rebuttal is that it works fine on lots of AMD cards if you set some environment flag to force the GPU architecture selection. The fact that this is so close to working on a wide variety of hardware, and yet doesn't, is exactly the vibe you get with the whole ecosystem.

- https://tensorwave.com/blog/the-future-of-rocm-amds-developer-first-bet-for-the-ai-era
- https://www.youtube.com/watch?v=3sG1_ARTa04

## GTC

- https://semianalysis.com/2025/03/19/nvidia-gtc-2025-built-for-reasoning-vera-rubin-kyber-cpo-dynamo-inference-jensen-math-feynman/#smart-router
- https://irrationalanalysis.substack.com/p/gtc-2025-co-packaged-optics-switching

- https://www.youtube.com/watch?v=d89mHSeN_QE ( Beyond CUDA: Accelerating GenAI with MAX and Mojo (Chris Lattner's lightning talk at GTC 2025) )
  - Modular was missing during Beyond CUDA, but they are the best positioned to make an impact

- How to Write a CUDA Program - The Parallel Programming Edition | NVIDIA GTC 2025 Session  (https://www.youtube.com/watch?v=GmNkYayuaA4)
  - Where is this kind of high level tutorial from AMD? NVIDIA's materials are top-tier and AMD is nowhere to be found, just a bunch of confusing stuff in the Rocm documentation.
- CUDA: New Features and Beyond | NVIDIA GTC 2025 (https://www.youtube.com/watch?v=6o_Wme-FdCU)
  - The real "Beyond CUDA"
