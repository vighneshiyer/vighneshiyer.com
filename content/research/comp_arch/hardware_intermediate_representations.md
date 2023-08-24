+++
title = "Hardware Intermediate Representations (Hardware IRs)"
date = 2023-08-23
draft = true
+++

Ideas about HW IRs

Views that allow flat (no module hierarchy), low-level (no behavioral constructs), and semantically meaningful (no aggregates) passes to be written that end up operating on a high-level netlist that has all these features to preserve semantics. Critically, there needs to be a netlist mutation schema that can be translated from low-level to high-level unlike most passes that work the other way.
