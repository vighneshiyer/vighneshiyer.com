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
