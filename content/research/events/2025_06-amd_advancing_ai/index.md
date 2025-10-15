+++
title = "AMD Advancing AI 2025"
date = 2025-06-12
draft = true
+++

Keynote
There is a lot of focus on the inference side of things, it seems like they've given up trying to beat Nvidia at the entire stack and other applications
Rocm enterprise lol, idk what that even means
Lisa isn't presenting everything, lots of random VPs and lots of enterprise talk
Lots of talk about developer help
AMD developer cloud, everyone in the room has 25 hours of gpu time lol
Oh this seems so desperate, poor anush, developers...
https://m.youtube.com/watch?v=5dmFa9iXPWI&pp=0gcJCd4JAYcqIYzv
Thet are trying to match Nvidia full stack dominance with networking, CPU epic, and GPU systems. Seems quite hard, ultra Ethernet can't hold against nvlink
Ultra accelerator link, seems interesting, built on top of Ethernet, seems like cxl and other protocols are being subsumed
Claim that it is open vs nvlink, claim larger scalability, but the Nvidia things already exist lol, can't beat something real with a spec only
Astera labs, UAlink, the customers are coming but we just need to build it lmao, hyperscalers lol, but they sold out gb200 at the same time lol
https://www.phoronix.com/news/AMD-Instinct-MI350X-MI355X
https://www.phoronix.com/news/AMD-ROCm-7.0-Preview-MI355X
https://www.phoronix.com/news/AMD-Developer-Cloud
https://videocardz.com/newz/amd-launches-instinct-mi350-series-confirms-mi400-in-2026-with-432gb-hbm4-memory
AMD is pushing hbm capacity way beyond Nvidia stinginess lol
Ultra Ethernet is being pushed hard, beyond infiniband
https://semianalysis.com/2025/06/11/the-new-ai-networks-ultra-ethernet-uec-ualink-vs-broadcom-scale-up-ethernet-sue/
Helios rack scale integration, nic, cpu and GPU, trying hard to compete with nvl72
https://www.reddit.com/r/AMD_Stock/comments/1l9nhlt/amd_advancing_ai_keynote_livestream/
Venice 256 cores, tsmc 2, 1.6 TBs bandwidth, claim to already have a sample in the lab
MI400 coming in 2026 with Venice, 432gb hbm4=, 19.6TBs bandwidth
Vulcano nic, supports UAL and pcie for host interface, UAL is tunneled over Ethernet
https://www.reddit.com/r/AMD_Stock/comments/1knn4af/good_news_for_mi450/
https://www.reddit.com/r/hardware/comments/1l9t1cp/amd_advancing_ai_2025_megathread/
https://www.phoronix.com/news/AMD-Instinct-MI400-Preview
Altman is excited for amd inference memory capacity and bandwidth
Openai engineers asked for maximum flexibility from the hardware, hmm they say network arch and opt changes a lot in a short time
They keep saying that AI will not be developed by a single company lol

Chai does sampling per query, 8x more tokens than they use
Chai ai 60T per month, mk one is providing inference services for chai lmao
Neuralink bwrc ip
Taalas discussion

Anishs talk on rocm
Lots of ai companies 7 of the top 10 use amd
Hot aisle, tensorwave, cirrascale, lots of amd deployments supposedly
MI350 announced, fully oss SW, keep pushing that, they are trying to use this wedge against Nvidia, eg tensor llm doesn't support fp8 attention on Blackwell
Rocm 7, MI350 is already deployed, claims already achieved SW maturity, different from past efforts
They claim fp8 support on deep seek r1 and it's better than B200
Cohere guy came out and said AMD was good lol, nothing much

Chris lattner
Ok keeps getting better, very interesting
They seem to have lots of externalization of hardware primitives into the frontend language
They lean hard into metaprogramming, same code used at compile and runtime, lispy in principle and similar to zig comptime
But can mojo do nested metaprogramming / staged lowering like scala 3?
They have explicit compile time type parameters but they are more generic than that, they can be manipulated using vanilla mojo code at compile time
They are very quickly deviating from vanilla python as expected
Ability to use milr primitives directly in the frontend language
Mojo is like Julia + Zig + rust + python
Heterogeneous backend by default
Adding mi355 support soon
He claims that mojo can solve fpga programming and hls, at least the same frontend... Perhaps he's talking about metaprogramming on top of mlir primitives
Fpgas are very parallel, mojo can power domain specializatists, TBD, perhaps I should inquire at their event
https://lu.ma/modular-gpu-workshop
Lmao someone talking about xilinx and vivado, seems like a nut, can't get to the question and lattner told him off
Mojo was designed for Asics, Chris has worked for Google and tpus lol, probably wants more dialects, the triton magic abstraction isn't good enough for all Asics, sometimes you need arbitrary pointer manipulation, be skeptical claims of fpga and ASIC compilers, mojo is GPU only for now and eventually we will have some ASIC work too

Simon from Skylab talking about vllm
Very interesting how they combined many optimizations for inference in one framework so they can stack them all on top, it seems quite complex but he presents it simply
All these inference tricks require lots of runtime logic, it seems like having enough flexibility is critical, the tpu probably can't do any of these fancy things

Lisa su, Andrew ng panel
Lisa bullying anush, the AMD developer cloud better work lmao
Oh they are very pushy about the openness of rocm and AMD, always casting doubt against Nvidia monopoly lol
Lisa says that open source is scary for vamsi and anush, things don't always look good for them but good in the long run
Andrew says that nowadays he doesn't give tasks to others but coding agents help him build prototypes himself, can quickly iterate in proof of concepts, driven down the cost of doing prototypes
Oh lol the moderator derails things into jobs lol and the impact of AI on sw engineers
Andrew says that not trying to learn programming is stupid, if something is easier more people should do it, we will just get more great software over time
Fresh college grad with AI will outperform a senior 10 year engineer on his own. But still the best engineers are very senior and also know AI. Andrew claims that the univ curriculum needs to adapt to train ai assisted engineers lmao, upskilling challenge to teach devs and even non devs
Lisa, AMD is still hiring lol, using AI in the entire workflow, not true that AI will replace all these jobs, but AMD wants to get more products to market faster, that needs people, the more AI you use the more productive you are, contiuing education, learn every day, thank you Andrew lol, continual learning will keep the pce of learning up, AI helps you learn faster
Sharon, what should audience take away?
Andrew, just do stuff, that's his advice, leverage AI assisted coding tools, empower the individual developer, keeps mentioning not harming anyone lol, Coursera started as a side project, Andrew didn't believe in it initially, built it at home while being a prof, don't ask for permission and build something and learn
Lisa, take what Andrew said and build on AMD lmao, give us a shot lol, quite desperate, devs are the center of rocm, early innings of AI still supposedly

https://semianalysis.com/2025/06/13/amd-advancing-ai-mi350x-and-mi400-ualoe72-mi500-ual256/
Posted the day after the conference
It seems the workshops were registration-only and had some fees associated with them - I didn't attend any of them

https://irrationalanalysis.substack.com/p/nvlink-fusion-jensen-murders-ualink
Yeah this UAlink thing is truly dead in the water and will be way worse than the nvidia integrated networking solutions
https://irrationalanalysis.substack.com/p/marvell-managment-is-bluffing-bank
negative note about this amd event at the end of the article

https://www.youtube.com/watch?v=liR2Pn5Zp9g
Lattner's MOJO talk at Advancing AI
