+++
title = "uArch Security Research"
date = 2023-08-23
draft = true
slug = "uarch-security-research"
description = "This research is both fake and harmful (parody)"
+++

- Nearly all hardware "security" papers are really about functional bugs that are somehow cast as "security" problems with corresponding CVEs and CWEs
  - The exploitation methodology is often completely unfeasible (all the cache side channel things that assume remote code execution to begin with), or otherwise radically trivial (the "Ghostwrite" bug in the T-head core where a RVV decoding bug allows arbitrary writes to physical memory)
  - When attacks using human manipulation and/or zero-day software vulnerabilities and/or easily exposed remote endpoints are so common and low cost (and easy), why would anyone bother with this state-actor-level esoteric uArch side channel stuff? Indeed no one does.
- The security propaganda machine is immense
  - The way these people parade around conferences with their custom websites, logos, and flashy delivery
  - The way "journalists" love to report on these things as critical vulnerabilities that people should freak out about, when they are not
  - The way this freak out leads to moron CTOs harassing hardware and cloud vendors to "do something" when nothing needs to be done
- The carbon cost of 'revealing' and "exploiting" microarchitectural side channels
  - Consider all the random mitigations necessary that are turned on by default even though they have such a tiny attack surface
  - Consider the massive performance loss (especially on older silicon) and the impact of that with respect to how much more compute has to be acquired and manufactured (embodied carbon + extra emissions)
  - The uarch side channel security researchers have produced **harmful research** and are **personally responsible** for countless extra tons of carbon emissions
  - We argue that these people and their insane and unreasonable hypothetical attack vectors should be ignored for the sake of the planet and human survival
- Security is not sustainable - "secure speculation" is about spending even more embodied carbon for less performance (more runtime carbon)
