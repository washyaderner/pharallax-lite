# Pharallax Lite

[![Stars](https://img.shields.io/github/stars/washyaderner/pharallax-lite?style=social)](https://github.com/washyaderner/pharallax-lite)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude_Code-skill-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)

Point it at any business URL. Three parallel AI agents score positioning clarity, competitive vulnerability, and structural coherence. Get a letter-graded report on your Desktop in under 3 minutes.

No API keys. No database. No external dependencies. Just [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and a URL.

## Example Output

```
# Pharallax Lite - Structural Analysis
Target: https://example.com
Date: 2026-04-07
Grade: B (3.2/5.0)

## Executive Summary

The core product positioning is clear and the pricing model aligns with the
stated audience. However, the site relies entirely on three generic
testimonials for social proof while claiming "thousands of customers" - a
gap that erodes trust at exactly the moment a buyer is ready to commit.
Tightening the proof architecture to match the scale of the claims would
convert the existing traffic more effectively than any new feature.

## Scores

| Dimension                                    | Score    | Weight |
|----------------------------------------------|----------|--------|
| Structural Read (Clarity + Coherence)        | 3.5/5.0  | 30%    |
| Positioning (Differentiation + Consistency)  | 3.0/5.0  | 35%    |
| Competitive Surface (Defensibility - Risk)   | 3.0/5.0  | 35%    |
| **Composite**                                | **3.2/5.0** |     |

[... detailed findings, competitor analysis, attack vectors ...]
```

## Run It On Your Business

```bash
git clone https://github.com/washyaderner/pharallax-lite.git
cd pharallax-lite
bash install.sh
```

Then in any Claude Code session:

```
/pharallax-lite https://your-business.com
```

The report saves to `~/Desktop/pharallax-lite-{domain}.md`.

## What the Agents Do

Three specialized agents run in parallel against the target URL:

| Agent | What it evaluates | Scores |
|-------|------------------|--------|
| **Structural Read** | What the business says vs. what it actually does. Revenue model detection, team size signals, promise-proof gaps. | Clarity, Coherence |
| **Positioning Audit** | Value proposition strength, competitive differentiation, messaging contradictions. Runs live competitor research. | Differentiation, Consistency |
| **Competitive Surface** | Adversarial analysis. Where the moat is thinnest, what a well-funded competitor would exploit, single points of failure. | Defensibility, Risk Exposure |

Results are aggregated into a weighted composite score (A+ through F) with an executive summary and detailed findings.

## How the Scoring Works

Each agent produces two scores on a 1-5 scale, combined with weights:

| Agent | Weight | Rationale |
|-------|--------|-----------|
| Structural Read | 30% | Foundation - does the business make sense? |
| Positioning Audit | 35% | Market fit - does it stand out? |
| Competitive Surface | 35% | Durability - can it survive pressure? |

Risk Exposure is inverted before aggregation (high risk = low score). The composite maps to a letter grade from A+ (4.5+) to F (below 1.5).

## What This Is (and Isn't)

This is a surface-level structural read. It evaluates what a customer, investor, or competitor sees when they visit a business website for the first time. It catches positioning gaps, messaging contradictions, and competitive vulnerabilities visible from the outside.

It does not assess internal operations, actual financial performance, product quality beyond marketing claims, or team capability. Treat it as a first-pass diagnostic.

## What This Analysis Could Not See

Pharallax Lite runs three agents on public-facing data. That catches a lot - but the structural patterns underneath require more:

- **Internal operations data** would shift scoring on Clarity and Coherence significantly. What the site says and what actually happens inside the business are often two different stories.
- **208,000+ indexed knowledge claims** across 160+ industries would contextualize your scores against businesses at your stage, revenue range, and market position. A B grade means different things for a $500K landscaping company vs. a $3M SaaS.
- **12 specialized personas** held in adversarial tension surface contradictions and blind spots that a 3-agent surface read cannot reach. The debate between perspectives is where the deepest findings emerge.

If the lite version found something useful, the full analysis finds what's underneath it.

[pharallax.ai](https://pharallax.ai)

## Pharallax Open Source Suite

This tool works standalone. It's part of a growing business intelligence stack:

| Tool | What it does | Status |
|------|-------------|--------|
| **pharallax-lite** | Structural business analysis - positioning, coherence, competitive surface | Live |
| **pharallax-recon** | Competitive intelligence - attack vectors, landscape mapping, threat modeling | Coming soon |
| **pharallax-pricing** | Revenue model audit - pricing power, rate erosion, margin optimization | Coming soon |

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated
- That's it

## Uninstall

```bash
cd pharallax-lite
bash uninstall.sh
```

## License

MIT. Use it, fork it, modify it, ship it.
