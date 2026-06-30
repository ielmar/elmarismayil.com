# elmarismayil.com

Personal site built with [Astro](https://astro.build) + Tailwind CSS v4. Static output, no server or database.

## Commands

| Command           | Action                                |
| ----------------- | ------------------------------------- |
| `npm install`     | Install dependencies                  |
| `npm run dev`     | Start dev server at `localhost:4321`  |
| `npm run build`   | Build the static site to `./dist/`    |
| `npm run preview` | Preview the production build locally  |

## Structure

- `src/pages/` — routes (one `.astro` file per page)
- `src/layouts/` — shared page shell
- `src/styles/global.css` — Tailwind entry + theme tokens
- `public/` — static assets served as-is (favicon, robots.txt, images)

## Deploy

Outputs plain static files to `dist/` — deploy to any static host (Cloudflare Pages, Vercel, Netlify). Build command `npm run build`, output dir `dist`.
