# Rust for Cyber-Physical Systems / Robotics

It seems that rather than go down the rabbit hole of running some OS on your embedded device (whether that is a real time OS with a Linux ABI like Zephyr, or Linux itself with some hacks, or a super-lightweight RTOS such as FreeRTOS, or ROS specifically for robotics), one can just use a single baremetal Rust process!
Rust has good baremetal support, but more importantly, it has good support for cooperative multithreading, message passing, and so forth.
An "OS" isn't needed!
And usually when robotics devs start with ROS for some quick prototyping, when it comes time to productization and optimization, ROS is often a hinderance rather than providing high-performance multiprocessing primitives.

There seem to be many competing alternatives within the pure embedded Rust community.
This still seems to be a hot area and there is no convergence yet.

- [The Embedded Rustacean](https://www.theembeddedrustacean.com/)
  - Embedded Rust has its own publications! With lots of tutorials.
- [Reddit: Rust is now RTOS](https://www.reddit.com/r/rust/comments/1i691id/rust_is_now_rtos/?chainedPosts=t3_1h9hvq4) (Jan 20, 2025)
  - https://arewertosyet.com/
  - It seems Embassy is quite popular and stable now

## Embassy

- https://github.com/embassy-rs/embassy

> The Rust programming language is blazingly fast and memory-efficient, with no runtime, garbage collector or OS. It catches a wide variety of bugs at compile time, thanks to its full memory- and thread-safety, and expressive type system.
>
> Rust's async/await allows for unprecedentedly easy and efficient multitasking in embedded systems. Tasks get transformed at compile time into state machines that get run cooperatively. It requires no dynamic memory allocation, and runs on a single stack, so no per-task stack size tuning is required. It obsoletes the need for a traditional RTOS with kernel context switching, and is faster and smaller than one!

- [Reddit: Intro to Embassy : embedded development with async Rust](https://www.reddit.com/r/rust/comments/1hyi52x/intro_to_embassy_embedded_development_with_async/)
  - https://github.com/arlyon/watchy-rs (Rust no_std embedded firmware for the watchy open hardware project) (using Embassy)
- [Reddit: Rust, Embassy, and embedded-hal-async Are Such a Breath of Fresh Air](https://www.reddit.com/r/embedded/comments/1h9hvq4/rust_embassy_and_embeddedhalasync_are_such_a/)
- [Reddit: Embassy: Replacing RTOS with a Rust async scheduler](https://www.reddit.com/r/rust/comments/1hhsk3q/embassy_replacing_rtos_with_a_rust_async_scheduler/)

## Others

- [Ncomm – A node-based robotics framework written in Rust (github.com/n8bwert)](https://news.ycombinator.com/item?id=41530961)

> OK, so now we have: Basis Robotics (C++), Copper Robotics (Rust), and NComm (Rust) all trying to replace ROS. Shouldn't you guys be working together instead? Also, can't we just all instead improve ROS instead? I think Zenoh is leading the way there, introducing a new ROS 2 middleware, rather than trying to replace it wholesale.

- [DORA](https://github.com/dora-rs/dora)

> DORA (Dataflow-Oriented Robotic Architecture) is middleware designed to streamline and simplify the creation of AI-based robotic applications. It offers low latency, composable, and distributed dataflow capabilities. Applications are modeled as directed graphs, also referred to as pipelines.
