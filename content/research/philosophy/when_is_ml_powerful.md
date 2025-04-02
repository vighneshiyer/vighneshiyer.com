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

## From Alberto's talk

1. When is ML powerful? Domain knowledge + AI (Alberto claimed this was the case with AlphaFold, using AI on top of domain knowledge and systematic simulation techniques / modeling of molecules). However LLMs disprove this. LLMs don't need any input from human linguists to understand language, they don't need input from logicians to discover logic. What are the differences? Fuzzy output + lots of unsupervised data to train from. Can this be the case for VLSI CAD too? Consider one shotting a netlist to geometry. It is in principle possible, we can indeed duplicate functionality of any CAD algorithm with a model, but knowledge of what it does is actually important here.

2. Abstractions aren't applied properly. Consider biology, chemistry, and many others. CAD principles aren't used! Even in mechanical engineering. Lack of simulation. Biology feels like trying a bunch of random things (shooting chemicals at each other and trying to see what happens). No fundamental understanding. There have been many attempts in the past, but I argue that the issue is getting the right people involved. Analytical minded + systematic people who have background in CAD algorithms, software engineering, programming, and ML are needed - these skills need to be acquired by domain experts and then leveraged. In the abscence of this, Cadence will acquire companies in each domain and try to push the CAD methodology there.

Migrate this to my "when in ML powerful" article
