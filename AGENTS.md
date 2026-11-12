# Repository guide for agents

## Project overview

This repository is Behrad Saraiyeh's personal website and blog at
`https://saraiyeh-b.com`. It is a static Astro site using TypeScript, Markdown/MDX,
Astro's content collections, RSS, and sitemap integrations. There is no application
server, database, or client UI framework configured.

## Where to make changes

- `src/pages/`: file-based routes. `index.astro` is the home page,
  `about.astro` is the profile, `blog/index.astro` lists posts,
  `blog/[...slug].astro` generates individual posts, and `rss.xml.js` builds the feed.
- `src/content/blog/`: published Markdown and MDX posts.
- `src/content.config.ts`: blog collection loader and frontmatter schema.
- `src/layouts/BlogPost.astro`: shared post layout, translation switch, and Persian
  content styling.
- `src/components/`: shared head metadata, navigation, footer, and date formatting.
- `src/consts.ts`: shared site title and description.
- `src/styles/global.css`: site-wide styles, CSS variables, and font definitions.
- `src/assets/`: source images processed by Astro. Use `Image` from `astro:assets`
  in Astro templates where appropriate.
- `public/`: files served unchanged at root-relative URLs, including fonts, icons,
  and versioned resume PDFs. Preserve existing download URLs.
- `docs/`: Markdown/MDX reference examples; these are outside the blog collection.
- `archive/`: archived writing; files here are not loaded as published posts.
- `astro.config.mjs`: production site URL and Astro integrations.
- `Dockerfile`, `Dockerfile.dev`, `docker-compose.yml`, `nginx.conf`: container build
  and static serving configuration.
- `.github/workflows/`: manually triggered GitHub Pages deployment and Docker image
  publishing workflows.

Do not edit generated `dist/`, `.astro/`, or `node_modules/` files.

## Local commands

Run commands from the repository root. Use pnpm and retain `pnpm-lock.yaml`; do not
introduce npm or Yarn lockfiles. The `packageManager` field in `package.json` pins
pnpm. Node 24 is used in the Dockerfiles and Pages workflow.

```sh
pnpm install --frozen-lockfile  # Install the existing dependency set
pnpm dev                      # Start the development server (default port 4321)
pnpm build                    # Generate the static site in dist/
pnpm preview                  # Serve the production build locally
pnpm astro --help             # Inspect available Astro CLI commands
```

The README still contains starter-template npm commands. Prefer the package
manifest and actual source when determining how this project works. The Pages
workflow and `Dockerfile.dev` currently pin an older pnpm version than
`package.json` and `Dockerfile`; account for this when investigating build issues.
Change those pins only when relevant to the task.

## Content conventions

- Add posts as `.md` or `.mdx` files under `src/content/blog/`. Use descriptive,
  lowercase, hyphenated filenames. Collection entry IDs determine blog URLs;
  renaming a published file can change its URL and break incoming links.
- Frontmatter requires `title`, `description`, and `pubDate` (a date-coercible value).
  Optional fields are `updatedDate`, `heroImage`, `language`, and `alternate`.
  Treat `src/content.config.ts` as the authoritative schema.
- For a post directly inside `src/content/blog/`, a local hero image typically uses
  a path such as `../../assets/example.jpg`. The schema validates images through
  Astro's `image()` helper.
- English posts may omit `language` or use `language: "en"`. Persian posts use
  `language: "fa"`; existing translations use a `-fa` filename suffix.
- `alternate` contains the other post's collection ID, without `/blog/` or a file
  extension. Maintain reciprocal links when adding or renaming translations.
- The blog index excludes Persian posts and sorts by descending publication date.
  Individual routes and RSS currently include all posts. Preserve these behaviors
  unless the task calls for changing them.
- Persian posts set the document language to `fa`, while the overall document stays
  LTR. RTL direction and the Vazirmatn font are scoped to `.prose.persian-layout`.
  Preserve navigation layout and verify Persian text when modifying post styles.
- Preserve the author's voice, factual claims, publication dates, and existing
  translations unless editing them is part of the request.

## Implementation conventions

- Prefer existing Astro components and static rendering. Add dependencies or
  browser-side scripts only when the requested behavior needs them.
- TypeScript extends Astro's strict configuration. Reuse `CollectionEntry<"blog">`
  for post types and the existing `getCollection`/`render` pattern for content.
- Follow formatting in the file being edited; the repository has mixed indentation
  and quote styles. Avoid unrelated reformatting.
- Keep shared metadata in `BaseHead.astro` and shared identity in `src/consts.ts`.
  Preserve canonical URLs, social metadata, RSS links, and sitemap integration.
- Use scoped Astro styles for component-specific presentation and `global.css` for
  shared rules. Keep layouts responsive, use semantic HTML and descriptive image
  alt text, and preserve keyboard-accessible links.
- Keep changes focused on the request. Avoid incidental edits to deployment
  configuration, existing articles, images, or resume files.

## Verification

- For code, content, asset, or configuration changes, run `pnpm build`. This checks
  content loading and static generation, but is not a full TypeScript check.
- No dedicated test, lint, format, or type-check script is configured. Do not claim
  those checks ran. `astro check` may require additional packages; do not assume it
  is available or add tooling solely for a small unrelated change.
- For visual changes, inspect affected pages at desktop and mobile widths using
  the dev server or production preview. Check both English and Persian posts when
  changing shared typography or layout.
- For post changes, check the generated post, blog listing, image paths, and any
  translation links; inspect RSS or sitemap output when changing URLs or metadata.
- Documentation-only changes require reviewing the text against the repository,
  rather than rebuilding the site.
- Report what changed, which checks ran, and any remaining validation limitations.
