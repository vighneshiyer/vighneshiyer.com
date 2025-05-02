Include Igor Markov's Synopsys ML for synthesis slides

Talk about learning novel embeddings vs learning surrogate functions
https://vighneshiyer.com/misc/ml-for-placement/ - lots of relevant examples here
What distinguishes ML from search (genetic algorithms)? Learning from experience or collected data. Sutton's lesson doesn't apply to those using "ML" or "Bayesian techniques" for design space sweeping. It also doesn't apply to those using ML to learn surrogate functions of engineered systems.

- Not for modeling / embedding an "engineered" system (e.g. digital RTL)
  - Consider GNN based PPA prediction
- Good for learning novel representations of "reality" (e.g. physics itself)
  - Consider ML for OPC
  - Consider language models
  - Would you train MNIST digit prediction from the output of the SOTA classical human-heuristic-based algorithm or from human labeled data (learning 'end-to-end')?
  - AlphaFold

- Talk about RL for placement and why it didn't work in their formulation
  - In principle, RL works for this, you can certainly learn a placement algorithm
  - They really should compare what they learned (ideally some algorithm via iteration) to force directed methods to see if they make the same decisions from the same starting point. that is the really interesting part, if they can learn hyperparameter tuning automatically from example
  - No simultaneous placement
  - Gridding reduces maximum potential QoR
  - Reliance on rough proxy metric + also only given at the end of a trajectory, rather than an iteration based optimization algorithm (simulated annealing, genetic evolution, force-directed placement)

- Out of context generalization, graceful or catastrophic failure
- Learning from an engineered algorithm vs from scratch as human annotated, consider mnist and hand written digit id heuristics vs from scratch
- Same principle applies all over the place

- What can ML be used for? Regression, classification, generation, agentic interaction, play-by-play interaction (a restricted form of generic agentic behavior)
  - Can these be generalized into one problem formulation?
- We often talk about black box and white box approaches to fuzzing and machine learning, these are also understood as natural and engineered systems

- When is ml powerful examples
- Image classification, bounding box objects, semantic segmentation
- Alphazero alphago, self play not trying to mimic an existing chess engine

- Why did rl for placement not work? In principle ml one ahotting a placement could work better than existing algorithms, but... Wrong problem formulation as a turn by turn game when it is optimization, gridding makes more optimal solutions unlikely, no simultaneous placement due to difficulty in learning long trajectories
  - Alpha chip e2e which we may call a "generative" model is actually program synthesis

- ML inside the loop (heuristics) vs ml outside the loop (hyper parameter tuning) vs ml monolithic (either as regression for ppa estimation from hls or rtl or for generation where it tries to subsume the cad algorithm)
- In the loop e.g. simulated annealing move decision
  - Another ml in the loop is clause selection in cdcl
- Out of the loop e.g. DSo.ai, simulated annealing parameter guessing, Sat solver selection
  - Rl for tuning within the algorithm, placement example iteratively or sizing like keertana, also iterative. What alpha chip did wrong, formulate optimization as a game, it is easy to do and feels human like but it isn't as good as optimization methods
- The evolution of fsd from a rule based extraction engine with lots of explicit code to the end to end ml approach

## From Alberto's Haas Fireside Chat on 4/1/2025

1. When is ML powerful? Domain knowledge + AI (Alberto claimed this was the case with AlphaFold, using AI on top of domain knowledge and systematic simulation techniques / modeling of molecules). However LLMs disprove this. LLMs don't need any input from human linguists to understand language, they don't need input from logicians to discover logic. What are the differences? Fuzzy output + lots of unsupervised data to train from. Can this be the case for VLSI CAD too? Consider one shotting a netlist to geometry. It is in principle possible, we can indeed duplicate functionality of any CAD algorithm with a model, but knowledge of what it does is actually important here.

2. Abstractions aren't applied properly. Consider biology, chemistry, and many others. CAD principles aren't used! Even in mechanical engineering. Lack of simulation. Biology feels like trying a bunch of random things (shooting chemicals at each other and trying to see what happens). No fundamental understanding. There have been many attempts in the past, but I argue that the issue is getting the right people involved. Analytical minded + systematic people who have background in CAD algorithms, software engineering, programming, and ML are needed - these skills need to be acquired by domain experts and then leveraged. In the abscence of this, Cadence will acquire companies in each domain and try to push the CAD methodology there.

### Raw Notes

- Everything is about abstraction, need to look at alphafold more closely, how do we make other domains understand and apply simulation modeling and abstraction? Process engineering, biological engineering, materials, chemical
- Domain knowledge with AI is powerful as asv says, however language models are an example of rejecting that premise, perhaps this only applies for precise engineering and not fuzzy engineering

- Tesla: they redesigned automotive electronics from first principles and cut out all the middle-tier suppliers. They have a single computer board and that's it. High voltage ethernet to all sensors and components. Tesla has the only tier-1 automotive SoC in production with full integration.
  - The competition is at least 5 years behind (probably more, and they have no hope of catching up with tier-2 and tier-3 engineering talent). Each subsystem is outsourced with its own control processor and programming interface, a complete mess that they have to coordinate. Software/hardware integration becomes complex and buggy.
- Business people are useless in technical disciplines - they don't understand technical investment and are unable to take long-term views of profitability
  - Intel failed due to bad decisions made by non-technical MBA / marketing morons. These people must be excluded completely from leadership in any technical company for it to succeed long-term. This is Alberto's strategy - MBAs have been excluded in both Synopsys and Cadence leadership by-and-large. Same is true for Tesla and NVIDIA. These people can't be allowed to influence technical decision making or finances.
- Synopsys and Cadence founding
  - Alberto told the story of how Cadence was founded first as a PnR backend company. Synopsys was founded after Cadence wasn't interested in making multi-level logic synthesis (frontend CAD) a part of their business. Soon after, they acquired startups to fill in each of their gaps and began to compete directly.
  - Don't trust underwriters with valuations. They have every incentive to inflate the value of your company as they make money on the public share offering price (based on their promoted valuation) vs what they buy the shares for from the company (the immediate cash injection the company receives).
- Nvidia was lucky with CUDA (when it didn't have many applications) and their hardware architecture (optimized for parallel "sum of product" arithmetic used by graphics)
  - I don't think luck has much to do with this. It is just maximally exploitable DLP with a good general-purpose programming model (CUDA) - the exact arithmetic primitives don't matter much, those are universal, there is no other special ALU unit you could have - you can cast any other arithmetic in terms of the primitives of math that the hardware natively supports.
