---
name: pharallax-lite
description: "Free structural business analysis. 3-agent parallel scan of any URL - positioning, competitive surface, structural coherence. Run /pharallax-lite <url>"
argument-hint: "<url>"
---

# Pharallax Lite - Structural Business Analysis

You are running a 3-agent parallel business analysis. Follow these steps exactly.

## Step 1: Validate Input

The user provided a URL as the argument: `$ARGUMENTS`

If no URL was provided, ask for one and stop. The URL should be a business website (not a social media profile, PDF, or non-business page).

## Step 2: Scrape the Target

Use WebFetch to retrieve the content at the provided URL. Also attempt to fetch these common subpages if they exist:
- `/about` or `/about-us`
- `/pricing`
- `/products` or `/services`

Combine all successfully fetched content into a single site context. If the main URL fails, report the error and stop.

## Step 3: Run Three Parallel Agents

Spawn three agents in parallel using the Agent tool. Each agent receives the full scraped site content.

**Important**: Pass the FULL text of each agent's prompt file below, along with the scraped site content. Each agent must return valid JSON matching its specified output format.

### Agent 1: Structural Read
Read the prompt from `~/.claude/agents/structural-read.md` and spawn an agent with that prompt plus the scraped content. This agent analyzes what the business does vs. what it claims, revenue model, team signals, and scores Clarity + Coherence (1-5 each).

### Agent 2: Positioning Audit
Read the prompt from `~/.claude/agents/positioning-audit.md` and spawn an agent with that prompt plus the scraped content. This agent evaluates differentiation, competitor landscape (using WebSearch), messaging contradictions, and scores Differentiation + Consistency (1-5 each).

### Agent 3: Competitive Surface
Read the prompt from `~/.claude/agents/competitive-surface.md` and spawn an agent with that prompt plus the scraped content. This agent identifies vulnerabilities, moat strength, attack vectors (using WebSearch), and scores Defensibility + Risk Exposure (1-5 each).

## Step 4: Parse and Validate Results

Each agent returns a JSON object. Parse them. If any agent failed or returned malformed data, note the failure but continue with available results.

Extract the scores:
- From Structural Read: `clarity`, `coherence`
- From Positioning Audit: `differentiation`, `consistency`
- From Competitive Surface: `defensibility`, `risk_exposure`

## Step 5: Calculate Composite Score

### Dimension Scores (average of each agent's two scores)
- Structural Read score = (clarity + coherence) / 2
- Positioning score = (differentiation + consistency) / 2
- Competitive Surface score = (defensibility + (6 - risk_exposure)) / 2
  - Note: risk_exposure is inverted (high = bad), so subtract from 6 to normalize

### Weighted Composite
- composite = (structural * 0.30) + (positioning * 0.35) + (competitive * 0.35)

### Letter Grade
- 4.5 - 5.0: A+
- 4.0 - 4.4: A
- 3.5 - 3.9: B+
- 3.0 - 3.4: B
- 2.5 - 2.9: C+
- 2.0 - 2.4: C
- 1.5 - 1.9: D
- 1.0 - 1.4: F

## Step 6: Write the Report

Generate a markdown report and save it to the user's Desktop:
- Filename: `pharallax-lite-{domain}.md` where `{domain}` is extracted from the URL (e.g., `pharallax-lite-acme-co.md`)
- Path: `~/Desktop/pharallax-lite-{domain}.md`

### Report Structure

```markdown
# Pharallax Lite - Structural Analysis
**Target:** {url}
**Date:** {YYYY-MM-DD}
**Grade:** {letter grade} ({composite score}/5.0)

---

## Executive Summary

{Write one paragraph using this arc:
1. Name what is working - be specific, cite evidence from the agents' findings
2. Name the core structural vulnerability - the single most important thing holding this business back
3. Show the path forward - what addressing that vulnerability would unlock}

---

## Scores

| Dimension | Score | Weight |
|-----------|-------|--------|
| Structural Read (Clarity + Coherence) | {score}/5.0 | 30% |
| Positioning (Differentiation + Consistency) | {score}/5.0 | 35% |
| Competitive Surface (Defensibility - Risk) | {score}/5.0 | 35% |
| **Composite** | **{composite}/5.0** | |

### Score Breakdown

| Metric | Score | Notes |
|--------|-------|-------|
| Clarity | {}/5 | {one-line note} |
| Coherence | {}/5 | {one-line note} |
| Differentiation | {}/5 | {one-line note} |
| Consistency | {}/5 | {one-line note} |
| Defensibility | {}/5 | {one-line note} |
| Risk Exposure | {}/5 | {one-line note - remember higher = more risk} |

---

## Structural Read

{Include the narrative from Agent 1}

### Key Findings
{Bullet list of the most important findings from Agent 1, with evidence}

---

## Positioning Audit

{Include the narrative from Agent 2}

### Key Findings
{Bullet list of the most important findings from Agent 2, with evidence}

### Competitors Identified
{List competitors found by Agent 2}

---

## Competitive Surface

{Include the narrative from Agent 3}

### Key Findings
{Bullet list of the most important findings from Agent 3, with evidence}

### Attack Vectors
{Table of attack vectors from Agent 3 with difficulty and impact}

---

## What This Scan Covers (and What It Doesn't)

This is a surface-level structural read based on publicly visible information. It evaluates what a potential customer, investor, or competitor would see when they visit your site for the first time.

It does not cover:
- Internal operations, team dynamics, or financial health
- Customer retention data or actual churn rates
- Product quality beyond what is described on the site
- Paid acquisition performance or marketing efficiency
- Technical architecture, code quality, or infrastructure

---

*Generated by [Pharallax Lite](https://github.com/pharallax/pharallax-lite) - open source structural business analysis for Claude Code*

---

This is a surface-level structural read. The full Pharallax analysis runs 12 specialized personas through a weighted debate engine, producing insights this scan cannot reach - including strategic blind spots, cognitive bias detection, and prioritized 90-day action plans.

Learn more: https://pharallax.ai
```

## Step 7: Report to User

After saving the file, tell the user:
1. The overall grade and composite score
2. A 2-3 sentence summary of the key finding
3. Where the report was saved
4. Do NOT print the entire report in the chat - it's on their Desktop

Keep the in-chat summary concise. The report is the deliverable.
