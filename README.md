# Pharallax Lite

A free, open-source structural business analysis tool for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Point it at any URL and get a scored breakdown of positioning clarity, competitive vulnerability, and structural coherence - produced by three parallel AI agents, each analyzing a different dimension.

No API keys. No database. No external dependencies. Just Claude Code and a URL.

## What You Get

Three specialized agents run in parallel against a target business website:

- **Structural Read** - What the business says it does vs. what it actually does. Revenue model detection, team size signals, promise-proof gaps. Scores Clarity and Coherence.
- **Positioning Audit** - Value proposition strength, competitive differentiation, messaging contradictions. Runs live competitor research. Scores Differentiation and Consistency.
- **Competitive Surface** - Adversarial analysis. Where the moat is thinnest, what a well-funded competitor would exploit, single points of failure. Scores Defensibility and Risk Exposure.

Results are aggregated into a weighted composite score (A+ through F) with an executive summary and detailed findings, saved as a markdown report on your Desktop.

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed and authenticated
- That's it

## Install

```bash
git clone https://github.com/pharallax/pharallax-lite.git
cd pharallax-lite
bash install.sh
```

This copies the skill and agent prompts to `~/.claude/`. Nothing else is modified.

## Usage

In any Claude Code session:

```
/pharallax-lite https://example.com
```

The analysis takes 1-3 minutes depending on site complexity and search results. The report saves to `~/Desktop/pharallax-lite-{domain}.md`.

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

## Uninstall

```bash
cd pharallax-lite
bash uninstall.sh
```

## How the Scoring Works

Each agent produces two scores on a 1-5 scale. These are averaged per agent, then combined with weights:

| Agent | Weight | Rationale |
|-------|--------|-----------|
| Structural Read | 30% | Foundation - does the business make sense? |
| Positioning Audit | 35% | Market fit - does it stand out? |
| Competitive Surface | 35% | Durability - can it survive pressure? |

Risk Exposure is inverted before aggregation (high risk = low score). The composite maps to a letter grade from A+ (4.5+) to F (below 1.5).

## What This Is (and Isn't)

This is a surface-level structural read. It evaluates what a customer, investor, or competitor sees when they visit a website for the first time. It catches positioning gaps, messaging contradictions, and competitive vulnerabilities that are visible from the outside.

It does not assess internal operations, actual financial performance, product quality beyond marketing claims, or team capability. Treat it as a first-pass diagnostic, not a comprehensive audit.

## Full Analysis

Pharallax Lite demonstrates the structural analysis approach. The full Pharallax product goes substantially deeper:

- **12 specialized personas** debate each finding through a weighted dialogue engine, surfacing contradictions and blind spots that a single-pass analysis misses
- **7 cognitive modes** (market physics, network dynamics, temporal arbitrage, resource topology, information asymmetry, behavioral economics, ecosystem dynamics) stress-test the business from orthogonal angles
- **Prioritized 90-day action plan** with cost-of-inaction calculations for each recommendation
- **HTML report** with interactive scoring, delivered via email and Telegram

If the lite version found something useful, the full analysis will find what's underneath it.

[pharallax.ai](https://pharallax.ai)

## License

MIT. Use it, fork it, modify it, ship it.
