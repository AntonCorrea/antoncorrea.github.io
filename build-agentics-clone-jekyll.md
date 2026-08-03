# Agent Task: Build an Argentics-Style Jekyll Page for antoncorrea.github.io

> **Purpose**: This document is an agent-ready instruction set to replicate the visual structure,
> layout, and style of [https://www.argentics.io/](https://www.argentics.io/) as a new page
> (or full-site redesign) inside the existing Jekyll site at
> [https://antoncorrea.github.io/](https://antoncorrea.github.io/).
>
> **How to use**: Feed this entire file to an AI coding agent. It contains every section,
> placement detail, style spec, and placeholder instruction needed to build the page locally.
> After the scaffold is built, replace all `<!-- PLACEHOLDER ... -->` blocks with real content.

---

## 0. Repository Context

The existing site is a **Jekyll** repo hosted at `github.com/antoncorrea/antoncorrea.github.io`.
Its current structure is:

```
antoncorrea.github.io/
  _config.yml
  _includes/
  _layouts/
  _plugins/
  _posts/
  _sass/
  css/
  img/
  js/
  portfolio/
  portfolioHidden/
  index.html          <-- current landing (simple name + tagline + 3 buttons)
  about.md
  Gemfile
  phantom.gemspec      <-- uses the "Phantom" Jekyll theme
```

**Current state**: The index.html is a minimal centered card with name, tagline, and three
buttons (Resume, Portfolio, LinkedIn) on a dark background.

**Goal**: Replace or augment this with a full Argentics-style landing page while keeping the
Jekyll/Phantom foundation. The new page should be a new `index.html` (or a new layout + page)
that mirrors the Argentics structure section-by-section.

---

## 1. Design System

### Color Palette

| Token             | Value       | Usage                                       |
|-------------------|-------------|---------------------------------------------|
| `--color-bg-dark` | `#0a0e17`   | Hero background, section alternating bg      |
| `--color-bg-alt`  | `#111827`   | Secondary section backgrounds                |
| `--color-accent`  | `#3ba34c`   | Buttons, hover states, links, active nav     |
| `--color-text`    | `#ffffff`   | Primary text on dark backgrounds             |
| `--color-text-sub`| `#9ca3af`   | Subheadings, descriptions, muted text        |
| `--color-card-bg` | `#1a1f2e`   | Service cards, portfolio cards               |
| `--color-border`  | `#2a2f3e`   | Card borders, dividers                       |

### Typography

| Element       | Font                    | Weight | Size (desktop) | Size (mobile) |
|---------------|-------------------------|--------|----------------|---------------|
| H1 (Hero)     | System sans-serif stack  | 800    | 4rem / 64px    | 2.2rem        |
| H2 (Section)  | System sans-serif stack  | 700    | 2.8rem / 45px  | 1.8rem        |
| H3 (Card)     | System sans-serif stack  | 600    | 1.4rem / 22px  | 1.2rem        |
| Body          | System sans-serif stack  | 400    | 1rem / 16px    | 0.95rem       |
| Button/Nav    | System sans-serif stack  | 600    | 0.875rem / 14px| 0.8rem        |
| Overline/Tag  | System sans-serif stack  | 500    | 0.75rem / 12px | 0.7rem        |

> Use a CSS font stack: `'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif`.
> Load Inter from Google Fonts if available, otherwise fall back.

### Spacing & Layout

- Max content width: `1200px`, centered with `margin: 0 auto`.
- Section vertical padding: `100px` top and bottom (desktop), `60px` (mobile).
- Grid gaps: `24px` for card grids.
- Card border-radius: `12px`.
- Card padding: `32px`.
- Button border-radius: `8px`.
- Button padding: `14px 32px`.

### Responsive Breakpoints

| Breakpoint | Width      | Layout changes                           |
|------------|------------|------------------------------------------|
| Desktop    | `> 980px`  | Full grid layouts, horizontal nav        |
| Tablet     | `601-980`  | 2-column cards, compact spacing          |
| Mobile     | `<= 600px` | Single column, hamburger menu, stacked   |

---

## 2. Full Page Section Map

The Argentics homepage consists of **10 distinct visual sections** stacked vertically.
Build each one in order. Every section is a full-width `<section>` block.

``n
[SECTION 1] Sticky Navigation Bar (fixed top)
[SECTION 2] Hero — full viewport height
[SECTION 3] Tech / Partner Logo Bar
[SECTION 4] Services — 6 cards in a grid
[SECTION 5] Portfolio / Works — image grid
[SECTION 6] About — split text + image
[SECTION 7] Contact — form section
[SECTION 8] Blog / Publications — 3 article cards
[SECTION 9] Footer — links, email, socials, copyright
[SECTION 10] Mobile Slide-Out Menu (hidden, toggled by hamburger)
```

---

## 3. Section-by-Section Build Instructions

---

### SECTION 1: Sticky Navigation Bar

**Placement**: Fixed to top of viewport (`position: fixed; top: 0; z-index: 1000`).
**Height**: `70px`.
**Background**: `rgba(10, 14, 23, 0.95)` with `backdrop-filter: blur(10px)`.
**Border-bottom**: `1px solid var(--color-border)`.

**Layout** (horizontal, space-between):

```
|  [LOGO]                    [Nav Links]                    [CTA Button]  |
|  Left-aligned              Center / Right-aligned         Right-aligned |
```

**Elements left to right:**

1. **Logo** — Your name or brand mark, left-aligned.
   - `<!-- PLACEHOLDER: Replace with your logo SVG or text logo -->`
   - Style: White text, bold, ~20px.

2. **Navigation links** — Horizontal list, center or right.
   - Links: `Services`, `Portfolio`, `About me`, `Blog`, `Contact`
   - Each link: `color: var(--color-text-sub)`, hover → `color: var(--color-accent)`,
     `transition: color 0.3s ease`.
   - Font-size: `14px`, font-weight: `600`, uppercase, `letter-spacing: 0.5px`.
   - On mobile: **hide these links** (show hamburger instead).

3. **CTA Button** — "Contact me" button, right-aligned.
   - Background: `var(--color-accent)` (#3ba34c green).
   - Text: White, `14px`, `600` weight.
   - Padding: `10px 24px`, border-radius: `8px`.
   - Hover: slight brightness increase or scale `1.02`.

4. **Hamburger icon** (mobile only, `display: none` on desktop, `display: flex` on mobile).
   - Three horizontal lines icon (SVG), white, `24px`.
   - Clicking toggles the mobile menu (Section 10).

---

### SECTION 2: Hero

**Placement**: First visible section, starts at top of page (below the fixed nav).
**Height**: `100vh` (full viewport height).
**Background**: `var(--color-bg-dark)` (#0a0e17).
**Layout**: Vertically and horizontally centered content.

**Elements:**

1. **H1 — Main headline** (centered)
   - `<!-- PLACEHOLDER: Replace with your main headline, e.g. "GAME DEVELOPER & CREATIVE TECH" -->`
   - Font-size: `64px`, font-weight: `800`, white, `line-height: 1.1`.
   - Max-width: `900px`, `text-align: center`.
   - Can span 2-3 lines. Use `<br>` or a `<span>` for line breaks.

2. **Platform badges row** (centered, below H1, `margin-top: 40px`)
   - A horizontal row of 3 pill/badge elements: `MOBILE`, `CONSOLE`, `DESKTOP`
   - Each badge: `display: inline-flex`, `padding: 8px 20px`, `border: 1px solid var(--color-border)`,
     `border-radius: 100px`, `color: var(--color-text-sub)`, `font-size: 12px`,
     `font-weight: 600`, `letter-spacing: 1px`, `text-transform: uppercase`.
   - Spacing between badges: `12px`.
   - `<!-- PLACEHOLDER: Replace with your own platform/skill badges -->`

3. **Background visual** (optional, behind the text)
   - The original has abstract dark geometric/animated shapes.
   - `<!-- PLACEHOLDER: Replace with a subtle background image, gradient, or CSS animation -->`
   - Use a dark radial gradient or a subtle particle-like CSS effect.
   - Must not interfere with text readability.

---

### SECTION 3: Tech / Partner Logo Bar

**Placement**: Immediately below the hero section.
**Height**: ~`80px`.
**Background**: Slightly different from hero — can be same `var(--color-bg-dark)` or a thin divider.
**Border-top**: `1px solid var(--color-border)`, `border-bottom`: `1px solid var(--color-border)`.

**Layout**: Horizontal row of logos/icons, centered, evenly spaced.

**Elements:**

- A flex row with `justify-content: center`, `align-items: center`, `gap: 40px`.
- Each logo: grayscale or muted color, `height: 28-32px`, `opacity: 0.5`.
- On hover: `opacity: 0.8`.
- `<!-- PLACEHOLDER: Replace with 6-8 technology/tool logos (e.g. Unity, Unreal, Godot, Blender, C#, etc.) -->`
- Use SVG icons or grayscale PNGs.

---

### SECTION 4: Services

**Placement**: Below the logo bar.
**Background**: `var(--color-bg-dark)` or alternating `var(--color-bg-alt)`.
**Padding**: `100px 0`.

**Layout:**

```
|  [H2: SECTION TITLE]                    (centered, top of section)     |
|                                                                          |
|  [Card 1]  [Card 2]  [Card 3]            (3-column grid, top row)      |
|  [Card 4]  [Card 5]  [Card 6]            (3-column grid, bottom row)   |
```

**Elements:**

1. **H2 Section title** (centered)
   - `<!-- PLACEHOLDER: Replace with your services section title, e.g. "MY SERVICES" -->`
   - Font-size: `45px`, font-weight: `700`, white.
   - `margin-bottom: 60px`.

2. **Service cards** — 6 cards in a `grid-template-columns: repeat(3, 1fr)` grid.
   Each card is a clickable/interactive block:

   **Card structure:**
   ```html
   <a href="#" class="service-card">
     <div class="card-image">
       <!-- PLACEHOLDER: Replace with service thumbnail image (16:9 or 4:3 ratio) -->
       <img src="" alt="" /> <!-- empty placeholder -->
     </div>
     <div class="card-content">
       <h3><!-- PLACEHOLDER: Service title, e.g. "2D ART" --></h3>
       <p><!-- PLACEHOLDER: Service description, 1-2 sentences --></p>
     </div>
   </a>
   ```

   **Card styling:**
   - Background: `var(--color-card-bg)` (#1a1f2e).
   - Border: `1px solid var(--color-border)`.
   - Border-radius: `12px`.
   - Overflow: hidden.
   - The image area takes up ~`60%` of the card height.
   - The text area: `padding: 24px`.
   - H3: White, `22px`, `600` weight.
   - P: `var(--color-text-sub)`, `14px`, `400` weight, `line-height: 1.6`.
   - Hover: slight `transform: translateY(-4px)`, shadow increase, border-color → accent.
   - `transition: all 0.3s ease`.

   **6 service card slots (with placeholder titles from the original):**
   1. `<!-- PLACEHOLDER: Service 1 title & image & description -->`
   2. `<!-- PLACEHOLDER: Service 2 title & image & description -->`
   3. `<!-- PLACEHOLDER: Service 3 title & image & description -->`
   4. `<!-- PLACEHOLDER: Service 4 title & image & description -->`
   5. `<!-- PLACEHOLDER: Service 5 title & image & description -->`
   6. `<!-- PLACEHOLDER: Service 6 title & image & description -->`

   On tablet: `grid-template-columns: repeat(2, 1fr)`.
   On mobile: `grid-template-columns: 1fr`.

---

### SECTION 5: Portfolio / Works

**Placement**: Below services.
**Background**: `var(--color-bg-alt)` (#111827).
**Padding**: `100px 0`.

**Layout:**

```
|  [H2: SECTION TITLE]              (centered)                             |
|  [Subtitle text]                   (centered, muted)                     |
|                                                                          |
|  [img] [img] [img] [img]           (image grid, 4 columns on desktop)    |
|  [img] [img] [img] [img]           (second row)                          |
|  [img] [img] [img]                 (third row, 3 items)                  |
```

**Elements:**

1. **H2 Section title** (centered)
   - `<!-- PLACEHOLDER: Replace with portfolio section title, e.g. "MY WORKS" -->`
   - Same H2 style as Services section.

2. **Subtitle** (centered, below H2)
   - `<!-- PLACEHOLDER: Replace with a tagline, e.g. "A selection of projects I've worked on" -->`
   - Color: `var(--color-text-sub)`, font-size: `18px`, `max-width: 500px`.
   - `margin-bottom: 50px`.

3. **Project image grid**
   - CSS Grid: `grid-template-columns: repeat(4, 1fr)`, `gap: 16px`.
   - Each item: an image thumbnail with `border-radius: 8px`, `overflow: hidden`.
   - Images: `width: 100%`, `aspect-ratio: 16/10`, `object-fit: cover`.
   - Hover: slight scale `1.03`, `transition: transform 0.3s ease`.
   - Total slots: **11 images** (4 + 4 + 3 layout) matching the original.
   - `<!-- PLACEHOLDER: Replace each with your project screenshot -->`
   - On tablet: 3 columns. On mobile: 2 columns.

---

### SECTION 6: About

**Placement**: Below portfolio.
**Background**: `var(--color-bg-dark)`.
**Padding**: `100px 0`.

**Layout** — Two-column split (`grid-template-columns: 1fr 1fr`):

```
|  [Left Column: Text]            |  [Right Column: Image]    |
|                                 |                            |
|  Paragraph 1                    |  <!-- PLACEHOLDER:         |
|  Paragraph 2                    |    About section image,    |
|                                 |    portrait or workspace   |
|  [H2: ABOUT ME]                 |    photo -->               |
|                                 |                            |
```

> **Note from original**: The H2 "ABOUT US" appears on the RIGHT side, below the image,
> overlapping the boundary between the two columns. The text paragraphs are on the LEFT.

**Elements:**

1. **Left column — Text paragraphs** (vertically centered)
   - Two paragraphs of descriptive text about your services/experience.
   - `<!-- PLACEHOLDER: Replace with your about text, paragraph 1 -->`
   - `<!-- PLACEHOLDER: Replace with your about text, paragraph 2 -->`
   - Style: `color: var(--color-text)`, `font-size: 16px`, `line-height: 1.8`,
     `max-width: 500px`.

2. **Right column — Image** (vertically centered)
   - `<!-- PLACEHOLDER: Replace with an about image (photo, workspace, or illustration) -->`
   - Image: `border-radius: 12px`, `width: 100%`, `object-fit: cover`.

3. **H2 "ABOUT ME"** — Positioned at the bottom of the right column area.
   - Same H2 style, could also be centered across full width below both columns.
   - `<!-- PLACEHOLDER: Keep as "ABOUT ME" or change -->`

On mobile: stack to single column (text on top, image below, H2 below image).

---

### SECTION 7: Contact Form

**Placement**: Below about.
**Background**: `var(--color-bg-alt)` (#111827) or a distinct darker shade.
**Padding**: `100px 0`.

**Layout** — Centered content:

```
|                                                                          |
|          [H2: LET'S WORK TOGETHER]              (centered)                |
|          [Subtitle: tagline text]               (centered, muted)        |
|                                                                          |
|          [Name input    ]                                               |
|          [Email input   ]                                               |
|          [Message textarea     ]                                        |
|          [Send button           ]                                        |
|                                                                          |
```

**Elements:**

1. **H2 Section title** (centered)
   - `<!-- PLACEHOLDER: Replace with contact CTA, e.g. "LET'S WORK TOGETHER" -->`
   - Same H2 style.

2. **Subtitle** (centered)
   - `<!-- PLACEHOLDER: Replace with tagline, e.g. "Have a project in mind? Let's talk!" -->`
   - `color: var(--color-text-sub)`, `font-size: 18px`.

3. **Form** (centered, `max-width: 500px`)
   - Form action can point to a static endpoint or `mailto:` link.
   - **Name field**: Text input.
     - `placeholder: "Your Name"`
     - Full-width, `padding: 14px 18px`, `background: var(--color-card-bg)`,
       `border: 1px solid var(--color-border)`, `border-radius: 8px`,
       `color: white`, `font-size: 15px`.
   - **Email field**: Email input.
     - `placeholder: "Your Email"`
     - Same styling as name field.
   - **Message field**: Textarea.
     - `placeholder: "Tell me about your project..."`
     - Same styling, `min-height: 120px`, `resize: vertical`.
   - **Send button**: Full-width.
     - Background: `var(--color-accent)` (#3ba34c).
     - Text: "Send", white, `font-weight: 600`, `padding: 14px 32px`,
       `border-radius: 8px`, `border: none`, `cursor: pointer`.
     - Hover: brightness increase.

---


### SECTION 9: Footer

**Placement**: Bottom of page, full width.
**Background**: `var(--color-bg-alt)` (#111827) or slightly different.
**Padding**: `60px 0 30px`.
**Border-top**: `1px solid var(--color-border)`.

**Layout** — Multi-column footer:

```
|  [Column 1]         |  [Column 2]       |  [Column 3]        |
|  Logo + Email       |  Service Links    |  Social + Legal    |
|                     |                   |                     |
```

**Elements:**

1. **Column 1 (left)** — Brand + contact
   - `<!-- PLACEHOLDER: Your name or logo -->`
   - Email link: `mailto:your@email.com`
   - `<!-- PLACEHOLDER: Replace with your email -->`
   - Style: White, `14px`.

2. **Column 2 (center)** — Navigation links
   - Vertical list of links.
   - `<!-- PLACEHOLDER: Replace with your service/page links -->`
   - Suggested: Services, Portfolio, About, Blog, Contact.
   - Each: `color: var(--color-text-sub)`, hover → `color: var(--color-accent)`.

3. **Column 3 (right)** — Social icons + copyright
   - Social icon links (LinkedIn, GitHub, Twitter/X, etc.) as small SVG icons.
   - `<!-- PLACEHOLDER: Replace with your social media links -->`
   - Copyright: `\u00a9 2026 Your Name. All Rights Reserved.`
   - Privacy/Legal link at bottom.

4. **Bottom bar** (full width, below columns)
   - Copyright text centered.
   - `font-size: 13px`, `color: var(--color-text-sub)`.

On mobile: stack columns vertically.

---

### SECTION 10: Mobile Slide-Out Menu

**Placement**: Off-screen right, slides in when hamburger is clicked.
**Size**: `100vw` x `100vh`.
**Background**: `var(--color-bg-dark)` with slight transparency.
**z-index**: `2000` (above everything).

**Behavior:**
- Hidden by default (`transform: translateX(100%)`).
- When active: `transform: translateX(0)`, with `transition: transform 0.3s ease`.
- Overlay backdrop behind it.

**Layout** (vertical, centered):

```
|  [Close X button]                                                    |
|                                                                      |
|  [LOGO]                                                              |
|                                                                      |
|  [Nav Link 1: Services]                                              |
|  [Nav Link 2: Portfolio]                                             |
|  [Nav Link 3: About me]                                              |
|  [Nav Link 4: Blog]                                                  |
|  [Nav Link 5: Contact]                                               |
|                                                                      |
|  [CTA Button: Contact me]                                            |
```

**Elements:**

1. **Close button** — Top-right, X icon, white, `32px`.
2. **Logo** — Same as nav bar logo.
3. **Nav links** — Vertical list, `font-size: 24px`, `font-weight: 600`, white,
   `margin: 20px 0`, hover → `color: var(--color-accent)`.
4. **CTA button** — Same green button style as nav bar.

---

## 4. Implementation Approach for Jekyll

### Option A: Replace index.html directly

Create a new `index.html` at the repo root with the full page structure. Use the existing
Phantom theme's `_config.yml` and asset pipeline, but override the layout.

```yaml
# index.html front matter
---
layout: default
title: "Antonio Correa - Game Developer"
---
```

Then override or extend the `default` layout in `_layouts/default.html` to include the
new sections, OR create a new layout `home.html` and use `layout: home`.

### Option B: Create a dedicated layout

1. Create `_layouts/home.html` based on the existing `default.html`.
2. Strip out the Phantom theme's default content area.
3. Build all 10 sections directly inside this layout.
4. Set `index.html` to use `layout: home`.

### CSS Strategy

- Add a new SCSS file: `_sass/argentics-style.scss`.
- Import it in `css/main.scss` (or whatever the theme's entry point is).
- All custom styles go here. Override Phantom theme defaults as needed.
- Use CSS custom properties (variables) defined in `:root` for the color palette.

### JavaScript Strategy

- Minimal JS needed. Add a small `js/main.js` for:
  - Mobile menu toggle (hamburger open/close).
  - Smooth scroll for anchor links (`scroll-behavior: smooth` in CSS covers most cases).
  - Optional: Intersection Observer for scroll-triggered fade-in animations.

### Image Placeholders

- Create placeholder images in `img/` directory:
  - `hero-bg.jpg` — Hero background (or use CSS gradient).
  - `service-1.jpg` through `service-6.jpg` — Service card images.
  - `project-1.jpg` through `project-11.jpg` — Portfolio thumbnails.
  - `about-photo.jpg` — About section image.
- Use solid-color placeholder images (`1x1` pixel or generated via CSS `background-color`)
  with the text overlay "PLACEHOLDER" via CSS `::after` pseudo-element.

---

## 5. File Checklist

The agent should create/modify these files:

```
[MODIFY]  _config.yml               — Update title, description, any theme settings
[CREATE]  _layouts/home.html          — New layout with all 10 sections
[MODIFY]  index.html                  — Set layout: home
[CREATE]  _sass/argentics-style.scss — All custom styles
[MODIFY]  css/main.scss               — Import the new SCSS file
[CREATE]  js/main.js                  — Mobile menu toggle + animations
[CREATE]  img/placeholder.svg         — Generic placeholder image
```

---

## 6. CSS Skeleton (Key Selectors)

Provide these CSS classes/IDs for the agent to implement:

```css
/* --- Variables --- */
:root {
  --color-bg-dark: #0a0e17;
  --color-bg-alt: #111827;
  --color-accent: #3ba34c;
  --color-text: #ffffff;
  --color-text-sub: #9ca3af;
  --color-card-bg: #1a1f2e;
  --color-border: #2a2f3e;
}

/* --- Nav --- */
.navbar { position: fixed; top: 0; left: 0; right: 0; z-index: 1000; height: 70px; ... }
.navbar__logo { ... }
.navbar__links { display: flex; gap: 24px; list-style: none; ... }
.navbar__cta { background: var(--color-accent); color: white; ... }
.navbar__hamburger { display: none; } /* shown on mobile */

/* --- Hero --- */
.hero { min-height: 100vh; display: flex; flex-direction: column; align-items: center; justify-content: center; ... }
.hero__title { font-size: 64px; font-weight: 800; text-align: center; ... }
.hero__badges { display: flex; gap: 12px; margin-top: 40px; ... }
.hero__badge { padding: 8px 20px; border: 1px solid var(--color-border); border-radius: 100px; ... }

/* --- Logo Bar --- */
.logo-bar { border-top: 1px solid var(--color-border); border-bottom: 1px solid var(--color-border); padding: 24px 0; ... }
.logo-bar__items { display: flex; justify-content: center; align-items: center; gap: 40px; ... }
.logo-bar__item { height: 28px; opacity: 0.5; ... }

/* --- Services --- */
.services { padding: 100px 0; ... }
.services__grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; ... }
.service-card { background: var(--color-card-bg); border: 1px solid var(--color-border); border-radius: 12px; overflow: hidden; ... }
.service-card:hover { transform: translateY(-4px); border-color: var(--color-accent); ... }
.service-card img { width: 100%; aspect-ratio: 16/10; object-fit: cover; ... }
.service-card__content { padding: 24px; ... }

/* --- Portfolio --- */
.portfolio { padding: 100px 0; background: var(--color-bg-alt); ... }
.portfolio__grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; ... }
.portfolio__item { border-radius: 8px; overflow: hidden; ... }
.portfolio__item img { width: 100%; aspect-ratio: 16/10; object-fit: cover; ... }

/* --- About --- */
.about { padding: 100px 0; ... }
.about__grid { display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center; ... }

/* --- Contact --- */
.contact { padding: 100px 0; background: var(--color-bg-alt); ... }
.contact__form { max-width: 500px; margin: 0 auto; ... }
.contact__input { width: 100%; padding: 14px 18px; background: var(--color-card-bg); border: 1px solid var(--color-border); border-radius: 8px; color: white; margin-bottom: 16px; ... }
.contact__btn { width: 100%; background: var(--color-accent); color: white; padding: 14px; border: none; border-radius: 8px; font-weight: 600; cursor: pointer; ... }

/* --- Blog --- */
.blog { padding: 100px 0 0; ... }
.blog__grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; ... }
.blog-card { background: var(--color-card-bg); border: 1px solid var(--color-border); border-radius: 12px; padding: 28px; ... }

/* --- Footer --- */
.footer { padding: 60px 0 30px; border-top: 1px solid var(--color-border); ... }
.footer__grid { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 40px; ... }

/* --- Mobile Menu --- */
.mobile-menu { position: fixed; top: 0; right: 0; width: 100vw; height: 100vh; z-index: 2000; background: var(--color-bg-dark); transform: translateX(100%); transition: transform 0.3s ease; ... }
.mobile-menu--open { transform: translateX(0); }
.mobile-menu__overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 1999; ... }

/* --- Responsive --- */
@media (max-width: 980px) { ... }
@media (max-width: 600px) { ... }
```

---

## 7. HTML Structure Skeleton

```html
<!-- index.html (or _layouts/home.html content block) -->

<!-- SECTION 1: Navbar -->
<header class="navbar">
  <div class="navbar__container">
    <a href="/" class="navbar__logo">
      <!-- PLACEHOLDER: Your logo/name -->
    </a>
    <nav class="navbar__links">
      <a href="#services">Services</a>
      <a href="#portfolio">Portfolio</a>
      <a href="#about">About me</a>
      <a href="#blog">Blog</a>
    </nav>
    <a href="#contact" class="navbar__cta">Contact me</a>
    <button class="navbar__hamburger" aria-label="Open menu">
      <!-- SVG hamburger icon -->
    </button>
  </div>
</header>

<!-- SECTION 2: Hero -->
<section class="hero" id="hero">
  <h1 class="hero__title">
    <!-- PLACEHOLDER: Main headline -->
  </h1>
  <div class="hero__badges">
    <span class="hero__badge">MOBILE</span>
    <span class="hero__badge">CONSOLE</span>
    <span class="hero__badge">DESKTOP</span>
  </div>
</section>

<!-- SECTION 3: Logo Bar -->
<section class="logo-bar">
  <div class="logo-bar__items">
    <!-- PLACEHOLDER: 6-8 tech logos -->
  </div>
</section>

<!-- SECTION 4: Services -->
<section class="services" id="services">
  <div class="container">
    <h2><!-- PLACEHOLDER: Section title --></h2>
    <div class="services__grid">
      <a href="#" class="service-card">... x6 ...</a>
    </div>
  </div>
</section>

<!-- SECTION 5: Portfolio -->
<section class="portfolio" id="portfolio">
  <div class="container">
    <h2><!-- PLACEHOLDER: Section title --></h2>
    <p><!-- PLACEHOLDER: Subtitle --></p>
    <div class="portfolio__grid">
      <div class="portfolio__item">... x11 ...</div>
    </div>
  </div>
</section>

<!-- SECTION 6: About -->
<section class="about" id="about">
  <div class="container">
    <div class="about__grid">
      <div class="about__text">
        <p><!-- PLACEHOLDER: About paragraph 1 --></p>
        <p><!-- PLACEHOLDER: About paragraph 2 --></p>
      </div>
      <div class="about__image">
        <!-- PLACEHOLDER: About image -->
      </div>
    </div>
    <h2>ABOUT ME</h2>
  </div>
</section>

<!-- SECTION 7: Contact -->
<section class="contact" id="contact">
  <div class="container">
    <h2><!-- PLACEHOLDER: CTA title --></h2>
    <p><!-- PLACEHOLDER: Subtitle --></p>
    <form class="contact__form">
      <input type="text" class="contact__input" placeholder="Your Name" />
      <input type="email" class="contact__input" placeholder="Your Email" />
      <textarea class="contact__input" placeholder="Tell me about your project..."></textarea>
      <button type="submit" class="contact__btn">Send</button>
    </form>
  </div>
</section>

<!-- SECTION 8: Blog -->
<section class="blog" id="blog">
  <div class="container">
    <h3><!-- PLACEHOLDER: Blog section title --></h3>
    <p><!-- PLACEHOLDER: Blog description --></p>
    <div class="blog__grid">
      <article class="blog-card">... x3 ...</article>
    </div>
  </div>
</section>

<!-- SECTION 9: Footer -->
<footer class="footer">
  <div class="container">
    <div class="footer__grid">
      <div class="footer__brand">...</div>
      <div class="footer__links">...</div>
      <div class="footer__social">...</div>
    </div>
    <div class="footer__copyright">...</div>
  </div>
</footer>

<!-- SECTION 10: Mobile Menu -->
<div class="mobile-menu__overlay"></div>
<div class="mobile-menu">
  <button class="mobile-menu__close">X</button>
  <nav class="mobile-menu__nav">
    <a href="#services">Services</a>
    <a href="#portfolio">Portfolio</a>
    <a href="#about">About me</a>
    <a href="#blog">Blog</a>
    <a href="#contact">Contact</a>
  </nav>
  <a href="#contact" class="navbar__cta">Contact me</a>
</div>

<script src="/js/main.js"></script>
```

---

## 8. JS Skeleton

```javascript
// js/main.js

document.addEventListener('DOMContentLoaded', () => {
  // Mobile menu toggle
  const hamburger = document.querySelector('.navbar__hamburger');
  const mobileMenu = document.querySelector('.mobile-menu');
  const mobileOverlay = document.querySelector('.mobile-menu__overlay');
  const closeBtn = document.querySelector('.mobile-menu__close');

  function openMenu() {
    mobileMenu.classList.add('mobile-menu--open');
    mobileOverlay.style.display = 'block';
    document.body.style.overflow = 'hidden';
  }

  function closeMenu() {
    mobileMenu.classList.remove('mobile-menu--open');
    mobileOverlay.style.display = 'none';
    document.body.style.overflow = '';
  }

  hamburger.addEventListener('click', openMenu);
  closeBtn.addEventListener('click', closeMenu);
  mobileOverlay.addEventListener('click', closeMenu);

  // Close menu when a nav link is clicked
  mobileMenu.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', closeMenu);
  });

  // Optional: Scroll-triggered fade-in animations
  const observerOptions = { threshold: 0.1, rootMargin: '0px 0px -50px 0px' };
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('fade-in--visible');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  document.querySelectorAll('.service-card, .portfolio__item, .blog-card, .about__grid').forEach(el => {
    el.classList.add('fade-in');
    observer.observe(el);
  });

  // Navbar background on scroll
  const navbar = document.querySelector('.navbar');
  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      navbar.style.borderBottom = '1px solid var(--color-border)';
    } else {
      navbar.style.borderBottom = '1px solid transparent';
    }
  });
});
```

---

## 9. Placeholder Strategy

All `<!-- PLACEHOLDER -->` comments follow this convention:

```html
<!-- PLACEHOLDER: [description of what goes here] -->
```

When building, the agent should:

1. **For images**: Use `img/placeholder.svg` (a simple gray rectangle with "IMAGE" text) as the `src`.
   Optionally add a CSS class that shows "PLACEHOLDER" overlay text via `::after`.
2. **For text**: Use the text from the original Argentics site as a reference but wrapped in
   placeholder comments so it's clear what needs to be replaced later.
3. **For links**: Use `#` as `href` values.

---

## 10. Build & Test Instructions

After creating all files:

```bash
# Navigate to the repo
cd /path/to/antoncorrea.github.io

# Install dependencies (if not already)
bundle install

# Serve locally
bundle exec jekyll serve

# Open in browser
# http://localhost:4000
```

**Verification checklist:**
- [ ] Navbar is fixed at top, transparent/blurred background
- [ ] Hero fills viewport, headline centered, badges visible
- [ ] Logo bar shows in a horizontal row
- [ ] Services grid shows 6 cards in 3x2 layout
- [ ] Portfolio grid shows 11 image placeholders
- [ ] About section has side-by-side text and image
- [ ] Contact form is centered and styled
- [ ] Blog section shows 3 article cards
- [ ] Footer has 3 columns
- [ ] Mobile menu slides in from right on small screens
- [ ] Hamburger appears on mobile, desktop nav hides
- [ ] All placeholder images/text are clearly marked
- [ ] Smooth scroll works for anchor links
- [ ] Green accent color (#3ba34c) is used consistently

---

## 11. Original Site Reference

| Feature              | Original (argentics.io)            | Your Version                        |
|----------------------|------------------------------------|-------------------------------------|
| Nav links            | Services, Portfolio, About, Careers, Blog, Contact | Customize to your pages |
| Hero H1              | GAME DEVELOPMENT & ART PRODUCTION OUTSOURCING | Your headline |
| Hero badges          | MOBILE, CONSOLE, DESKTOP           | Your platforms/skills               |
| Logo bar             | Playstation, Steam, Apple, Android, Oculus, Adobe, Unreal, Unity | Your tech stack |
| Service cards (6)    | 2D Art, 3D Art, Game Art, Game Dev, AR/VR, UI-UX | Your services |
| Portfolio images     | 11 project thumbnails              | Your projects                       |
| About text (2 paras) | Company description                 | Your bio                            |
| Contact CTA          | LET'S TALK ABOUT YOUR PROJECT       | Your CTA                            |
| Blog posts (3)       | 3 recent articles with dates       | Your posts or remove section        |
| Footer email         | contact@argentics.io               | Your email                          |
| Accent color         | #3ba34c (green)                    | Keep or customize                   |
| Background           | Dark (#0a0e17)                     | Keep or customize                   |
