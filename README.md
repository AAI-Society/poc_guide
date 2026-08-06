# Proof-of-Control — Practitioner Guide

A 32-page guide to the [Proof-of-Control standard](https://github.com/Task-force-for-AI-agents-in-Healthcare/ov-poc-standard)
for CISOs and security practitioners. Landscape format, designed to be read on a screen or
printed as a spread.

**[dist/proof-of-control-guide.pdf](dist/proof-of-control-guide.pdf)**

---

## What it covers

| | |
| --- | --- |
| **Opening** | The Verifiability Gap, and the four principles behind the standard |
| **Part I** | What your evidence is worth today — why logs are not evidence, where evidence has to come from, what belongs in a record |
| **Part II** | The four tiers, the binary threshold, **what Tier 3 does not mean**, and a self-placement checklist |
| **Part III** | The six domains, what to ask for in each, and how much existing frameworks already cover |
| **Part IV** | Reference architecture, where to intercept, what it costs on real hardware, how it fails, and a phased rollout |
| **Part V** | Twelve questions for vendors, how to read a conformance claim, eight audit tests, regulatory position, and a ninety-day plan |
| **Closing** | From principles to practice, and an explicit page on what this does **not** do |

## What makes it useful rather than promotional

The guide is built around things a practitioner can act on the same week:

* **Twelve vendor questions**, ordered so the early ones disqualify quickly.
* **Eight audit tests** that find real failures — documentation review does not.
* **Measured costs**, including from a real Intel TDX deployment: the full evidence pipeline is
  201 µs per action (1.3% of a 15 ms budget), running inside a trust domain adds 6.2%, and a
  hardware quote costs 39.5 ms — which is why per-action attestation is impossible and why
  every deployment needs a declared attestation refresh interval.
* **Six red flags** in conformance claims, including the one that matters most: cryptographic
  evidence prevents log forgery and does nothing about scope gaming.
* **A page on what the standard does not do**, including a place where its own tier definitions
  overclaim and have not yet been corrected.

That last one is deliberate. A guide that only lists strengths is a marketing document, and a
CISO evaluating vendors needs to know which claims are worth challenging — including ours.

## Building

The layout depends on CSS multi-column and `@page` sizing, which Chrome implements correctly and
most PDF libraries do not.

```bash
./build.sh                      # -> dist/proof-of-control-guide.pdf
CHROME=/path/to/chrome ./build.sh   # if Chrome is not in the default location
```

## Layout

```
src/guide.html     the whole guide, one <section class="page"> per page
src/style.css      Advanced AI Society brand system
src/figures/       branded SVGs, generated from the standard repository
build.sh           Chrome headless -> PDF
dist/              output
```

**Brand.** Near-black `#0a0a0a`, electric lime `#cfff04`, off-white `#f0edea`, alert reds
`#ff6568` / `#bf000f`. Montserrat for display, Source Sans 3 for body. Figures are the same
generated SVGs used in the standard and the paper, so a diagram cannot drift between them.

## Editing

Each page is one `<section class="page">` with a `.folio` page number. Page numbers are manual —
if you add or remove a page, renumber the folios and the contents page. The build does not
enforce that, which is the one place to be careful.

Reusable components: `.box` (with `--red` and `--ink` variants), `.quote`, `.checklist`,
`.asklist` (auto-numbered), `.stat-row`, `.tier-strip`, `.two-up`, and `.page--divider` with
tones `a`–`e`.

## Provenance of the numbers

Every measurement in the guide comes from the reference implementation in the
[standard repository](https://github.com/Task-force-for-AI-agents-in-Healthcare/ov-poc-standard/tree/master/impl)
and is reproducible from it. The TDX figures come from `impl/tdx/run_on_gcp.sh`, which deploys a
confidential VM with a non-confidential control, measures both, and deletes them.

If you update a number here, update it there first.

---

*Proof-of-Control is stewarded by the [Advanced AI Society](https://advancedaisociety.org/) —
**[join a working group at advancedaisociety.org](https://advancedaisociety.org/)**.*
