+++
title = "Exchanges, Market Making, HFT, and the PAX Trading Venue from First Principles"
date = 2026-01-15
draft = true
+++

## The Evolution of the Exchange

Imagine a time before telegrams and phones. Stock still existed. It was doled out by a corporation as pieces of paper (stock certificates).

Imagine you had a bundle of cash and wanted to invest in a corporation you've heard of and anticipate sharing in their profits. How would you go about this?

First step is a direct exchange (P2P). But what price should you transact at? You don't have any information! Information asymmetry -> market inefficiency.

Then let's say there is someone who owns a lot of the company's stock who is going to bars constantly and trading it with others after sharing a prospectus.
He is the source of 'market data'.
But physical distances keep sources of market data far away and the time to transmit changes in market prices causes stale trading (slow / improper price discovery).
"Hubs" of market activity tend to create centralization around them.

### The advent of the phone / telegram (remote market execution, centralization)

### Brokers and public exchanges

### Capital Markets Today

The hardest part to appreciate about today's extreme financialization is the value of ultra fast price discovery and synchronization (+ nearly infinite liquidity).
Those who make this happen appear to be parasites or even thieves who rob the market of value that belongs to the transactors.
The value of highly efficient capital markets is impossible to describe in the specific, but only in the aggregate.
Jane Street shilling time.

## The Exchange Today

### RFQ

### CLOB

The bid-ask spread
Order types: limit orders lol. All other orders are combinations of limit orders + price movement predicates (e.g. stop orders). Take a look at what Binance supports

### Exchange Topology

See the Eurex document

## You and the Exchange

- The role of brokerages. How they route orders. RFQ vs direct exchange taking (ala what IB claims they support for high end clients) vs ATS.
- Where is the capital stored? How is it locked by an exchange?
- How is margin handled? How does the exchange assume the risk of margin calls?
- Slippage and volatility

## Market Making and HFT

See the Eurex document again - speculative triggering

## The PAX Trading Venue

1. Cancel priority
2. Lambda orders (cross-symbol or external market triggers)
3. FPGA-accelerated liquidity tracking
4. Reformed maker/taker fee structure + lambda placement fee
