+++
title = "Tesla FSD is Here"
date = 2023-08-23
draft = true
slug = "tesla-fsd-is-here"
description = "Hardly anyone realizes how far ahead Tesla is"
+++

- There has been lots of FSD skepticism over the past decade, for good reason
- The original promise of FSD was made a long time ago, and even HW2 car owners were assured by Musk that their cars could be turned into robotaxis overnight
- The reality has been a lot more shaky, but the path to real FSD has been steady and consistent
- The true efforts began under Andrej, he presented his work in 2020 and 2021 (and maybe 2022?) before he left Tesla
- The work continued under the current leadership which has been phenomenal
- Tesla has an unbeatable data pipeline
  - Data from all cars in the fleet with complete camera (and all other sensor) data for every disengagement
  - Ability to create tons of synthetic data in their simulation environment, being able to replicate any given scenario from customer data and replay it over and over again
  - There is literally no one else who can compete with Tesla on the data front. Even Waymo cannot compete since they can't measure interventions that human drivers would have undertaken.
- Tesla has built the only true "end-to-end" self-driving pipeline
  - The only 'general-purpose' self-driving system on the market. No mapping required. Pure vision.
- Stripping out ultrasonic sensors and radar was seen as foolish in 2020. Musk's tirade against Lidar was also seen as foolish as every other competitor (Waymo, and Chinese brands) used it extensively
  - Musk has been vindicated, he is right, pure vision is not only sufficient, but other sensor modalities actually make self-driving more difficult and error-prone
- Others like Mercedes claim they have "Level 3" performance, but quick scrutiny reveals that to be effectively a lie
  - The restrictions for their systems to operate are insanely restrictive
- The breakthrough moment came with HW4 and FSD 13.2
  - I feel most people have no idea what FSD is capable of today. Without exaggeration, FSD can do nearly ALL driving (99%) in California (and the US in general) with no interventions and safety far exceeding a human driver.
  - Tesla enthusiasts do this regularly now. But, if I were to take a poll in Berkeley asking people "Can a Tesla drive you to Santa Cruz with zero interventions right now?" I feel most people would say no. Probably 90%+ would say no.
  - But the answer is yes. It can drive you to Santa Cruz. Over and over again. Zero interventions. No worries for your safety. It will even parallel park itself on the street once it arrives at your destination. How does no one know about this?
- Tesla FSD in China
  - This was the golden moment I've been waiting for. Tesla deploying a FSD system with no local training data (only trained on US data) to a foreign market and seeing what happens.
  - Well, it wasn't perfect, but it was already far superior to the self-driving systems on domestic Chinese autos.
  - It is beyond impressive; the Chinese government has taken some actions against Tesla specifically to defend their domestic market, but it won't really work with the high scrutiny of the Chinese domestic consumer.
  - FSD has some very clear failure modes in China. Stop light detection is a problem. Per-lane turning rules are often misreported on maps. They know these problems; the only reason they may be hard to fix is that Tesla has to keep the Chinese model training all within China. Chinese data can't leave Chinese borders.
- My prediction: FSD 14 will be unsupervised.
  - Robotaxis will deploy in 2025 (probably in the Summer).
  - They will be ultra cheap. They will have an excellent safety record. They will rely solely on cameras.
  - Other automakers know what is coming; they are caught completely flatfooted.
  - TSLA is heavily undervalued right now. 2x price appreciation by 2026 is my prediction.
  - Really, all other sedan/SUV autos on the market are deprecated. Semi-trucks have some more life in them, but Cybertruck v2 will change things; Tesla screws up, no doubt about that, but they learn quick and fix things.
  - New Model Y is insanely beautiful and refined. The price point is perfect. The margins are insane. Tesla can drop prices by 2x and they will still be profitable.
  - Ford / GM are dead in the water and they don't even know it.
- The Mark Rober hoax
  - The Lidar hoax continues to irritate me. It is obvious to me that vision is sufficient. Lidar has so many failure modes that vision doesn't: rain, fog, smoke, snow, occulusion, sensor fusion errors, sensor fusion inconsistency resolutions
  - There have been many experiments by non-conflicted people (unlike Rober who's friend is the CEO of a lidar company) and indeed, FSD 13.2 on HW4 doesn't have any failure mode like what Rober demonstrated. Perhaps older neural networks on FSD 12.x are worse especially on HW3, but 13.2 on HW4 is a huge leap in performance.
- On Waymo
  - Right now, it feels that Waymo has a lock on the self-driving scene. They have real deployments, millions of miles driven, revenue, satisfied customers. They are expanding.
  - But they don't own the automotive stack. They retrofit cars. This doesn't scale easily. Tesla has factories churning out 10000+ cars per month. Waymo can't do that.
  - Waymo has to sink a huge cost into every car. Expensive sensors and Lidar. Breakeven is hard to achieve.
  - They rely on HD maps, pre-mapped routes, and sensor fusion. They exhibit failure modes that Teslas don't. They are geofenced - they can't drive on highways.
  - https://waymo.com/blog/2025/12/demonstrably-safe-ai-for-autonomous-driving (recent update where they claim a end-to-end self-driving stack, doesn't reflect my experience)
- https://www.youtube.com/watch?v=mz8dOCboDz8 ( Comparison of Tesla FSD with 7 Chinese ADAS Systems. | Tesla FSD in China )
  - There is no doubt that even in a geofenced market like China where Tesla can't export any Chinese training data to America for model refinement, Tesla is still far ahead
- https://www.youtube.com/watch?v=s5IVI3OpVVs ( I Forgot How Good Tesla FSD Actually Is... )
  - How does no one see this? Shilling Mercedes "Level 3" system and trying to compare it with this is absolutely insane. FSD is too good.
  - Not just wrt safety, but also all the human aspects of driving - anticipating other vehicle movements, speculation, smoothness of driving and acceleration
- https://www.youtube.com/watch?v=dKroGHcWeiQ&t=17s ( Tesla FSD sees further than I do. I thought it had made a mistake again. | Tesla FSD in China )
  - More amazing feats: https://www.youtube.com/watch?v=s2GwXdhstJo ( Nighttime Tire Recognition Ability: Huawei Aito ADS vs. Tesla FSD. | Tesla FSD in China )
- https://www.youtube.com/watch?v=kFO1rGYOhcA ( Tesla FSD Clips of the Week - April 2025)
  - Just watch and observe
- https://www.youtube.com/watch?v=CE_faqY_P4Q (Some outstanding issues with Tesla FSD in China that need to be addressed. | Tesla FSD in China)
  - Good review of 3 clips where FSD stalled when it could have kept going
- https://www.youtube.com/watch?v=XpS3Zj5E1gE ( Tesla FSD can drive in the jungle as long as there's a road. | Tesla FSD in China )
  - Pure vision end to end algorithm continues to generalize even in foreign terrain
  - Chinese video data isn't available for training in America. Makes some difference for city driving quirks, but overall not a problem, and already outperforms domestic systems.
  - Waymo with its largely rule based + sensor fusion algorithm cannot cope with such scenarios. When they realize that to generalize further, they must go end to end, they will have to accept a massive performance drop before they claw their way back after many months of training.
  - Musk is quite pragmatic too. Tesla launched Dojo, but it is still hardly used in any training workloads with the ramp just beginning. In the meantime, due to pragmatism, he has the largest NVIDIA clusters on the planet. Google isn't so pragmatic - how much 'dogfooding' will Waymo have to endure with TPUs? Google has large NVIDIA clusters too, but internally they try hard to use their huge TPU devops and compiler teams so ML engineers can use their own hardware.
  - Dojo v2/v3 seem iffy at this point too. Hard to believe they can match NVIDIA's great scaling trends while staying cost competitive and building the suitable compiler infrastructure too.
- https://www.youtube.com/watch?v=c4_RbWWICnc ( Shocking FSD Error – Almost Caused a Major Accident )
  - A true failure case of 13.2.8. Unable to disambiguate between traffic lights for the crossing road vs the road the car is on. Obvious to a human, but FSD doesn't have enough contextual awareness.

- https://www.reddit.com/r/teslamotors/comments/1kg7k94/elon_responds_with_youre_right_to_someone_saying/
  - Things still iffy: speed on highways, lane changes being recessive especially when it tries to hop a line, disengagements due to nagging when the user tries to interact with the screen causes bad disengagement data

- Robotaxi has happened, Sunday 6/22/2025
- The naysayers continue to nitpick, but who cares at this point, we are at the starting line and have just taken the first step
- Waymo is constantly brought up - but they already have millions of miles and many 100ks of trips made! FSD is the very first *vision-only* *end-to-end ML* robotaxi service in operation. The consequence of this is not appreciated.
- This is the SpaceX Falcon 9 moment. It's only 10 cars! They all have safety drivers! Only 20 people have gotten an invite! It is geofenced to 50% of the waymo Austin service area! And on and on...
  - https://en.wikipedia.org/wiki/List_of_Falcon_9_and_Falcon_Heavy_launches
  - Calm before the storm. It appears that others are ahead and operational and SpaceX is the late underdog with very fishy experimental technology. Then suddenly, in a matter of years, there is no competition left and SpaceX is the only game in town. Everyone else gets crushed not only by pricing, but SpaceX enjoys a fat margin too, and they increasingly dominate in volume.
- Waymo is a shaky system (literally, the steering isn't smooth like FSD). It is rule-based. It only survives due to thousands of special cases programmed for explicitly after every failure in reality and also in simulation.
- Robotaxi is also a shaky system to be fair. There have been some clear mistakes that are caught on video that resemble mistakes made by v13.2.9 on individually owned Teslas.
  - Shaky semantic understanding of reversing behavior of other cars, especially when they try to parallel park and the Tesla wants to go into the same spot
  - Sun glare causing phantom breaking
  - Inability to follow lead car when making unprotected left turns in some edge cases, especially when navigation permits either going straight or left
