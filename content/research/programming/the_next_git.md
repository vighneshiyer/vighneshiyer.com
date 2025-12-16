+++
title = "The Next Git"
date = 2025-04-05
draft = true
description = ""
+++

- When Markdown I sent someone was copied into Google docs to comment on it, that's wrong.
- What SW do we need to break that?
- Crdt and git is one.
  - The next git: there is some element of fossil that I like - keep PRs and other repo working state with the repo itself rather than an external service like Github
  - The major one is the ability to not think about version control explicitly. Allow continuous remote collaboration using language-aware CRDTs.
  - Be able to do the Google Docs workflow completely locally, with comment sync, threads, and resolution being part of the repo state for every given file (file-type specific)
- But also some new GUI for comments and back and forth via a text file, I don't want this file to leave version control, but I want to collaborate and comment on threads and use plain text
- Submodules...
- Large files...
- There is some overlap with the `code_driven_x.md` post
  - That post veered too much into the version control and hosting aspect, when it should be focused on the 2-way sync aspect between code and visuals

- Git worktrees
  - multiple things going off at once for throughput-oriented methodology
- No more submodules, something much better is required for ad-hoc dependencies
- Remote build server and execution + remote build cache to make git worktrees locally actually viable
- A repo is its own universe. Proper dependency and universe construction is required. Solutions like docker or Nix are only part of the way there
- A lot of ideas that Google has in their codebase are quite good in principle: Cider, CitC, Bazel (remote build execution + global build artifact caching)

- https://news.ycombinator.com/item?id=45916196 (Zed is our office (zed.dev))
  - This collaboration is part of the editor, but something else is needed too...

- https://news.ycombinator.com/item?id=46225803 (https://newsletter.squishy.computer/p/natures-many-attempts-to-evolve-a)
  - Federation, P2P, Relays
  - I do think the next git needs to serve as a continuous file sync tool in addition to regular source control duties
  - Mixing ideas from fossil and jj is needed
  - Subsuming webapps like Notion, Overleaf, and Typst Web must be possible
