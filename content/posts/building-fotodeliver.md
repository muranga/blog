+++
categories = ["Projects", "AI", "Cloudflare"]
date = "2025-11-24"
draft = false
title = "Building FotoDeliver"
description = "Building a photo delivery service from scratch to test Cloudflare's developer platform and AI coding assistants"
keywords = ["cloudflare", "ai coding", "claude code", "ampcode", "antigravity", "photo delivery", "side project"]
+++

I'm building [fotodeliver.com](https://fotodeliver.com) — a service to help photographers deliver photos to their clients.

Yes, there are plenty of tools that already solve this problem. Pixieset, ShootProof, Pic-Time, PicFlow, the list goes on. But that's not really the point. I'm building this as an experiment to test two things I've been curious about.

## Breaking Out of the 9-5 Bubble

It's easy to get comfortable with the frameworks and tools you use at your day job. You know them well, they pay the bills, and there's rarely a reason to reach for something unfamiliar. But that comfort can become a bubble.

For this project, I'm going all-in on [Cloudflare](https://developers.cloudflare.com/). Workers, Pages, R2, D1 — the whole stack. No postgresql, no traditional server framework (django, rails, labstack/echo).Still going to use react-router. 

This feels a lot like when I started my career building on Google App Engine. A platform that handled the infrastructure so you can focused on the product. Cloudflare's developer experience has that same energy — opinionated with flexibility to build real things.

## How Much Does AI Actually Help?

The second experiment is about AI coding assistants. Everyone has opinions. I want data.

I'll be trying out 3 different AI tools to build FotoDeliver and tracking how much they actually contribute:

- **[Claude Code](https://claude.ai/code)** 
- **[AmpCode](https://ampcode.com)** 
- **[Antigravity](https://antigravity.dev)** 

The goal isn't to crown a winner. I want to understand where these tools genuinely save time and where they get in the way. Can they handle the boring parts so I can focus on the interesting problems?

I'm also curious about the economics. Does AI reduce the cost of building and maintaining software enough to change the "build vs. buy" calculus? Is it cheaper to pay $50/month for an established service, or use AI to build and maintain my own solution?

## The Product Itself

FotoDeliver will be straightforward:

- Photographers upload galleries
- Generate shareable links for clients
- Clients browse and download their photos
- Clean, fast, no friction

Nothing revolutionary.

## Following Along

I'll document the build process here, the wins, the frustrations, and the honest assessment of how these tools perform. 

First update coming soon.

I am not sure about building in public but maybe this will help keep me accountable to actually finish this project.
