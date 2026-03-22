# Milestone Creative Solutions — Build Report (Section 16 Checklist)

## 1. Files modified

| File | Changes |
|------|---------|
| [css/style.css](css/style.css) | Full brand theme: `:root`, `.text-primary`/`.border-primary` overrides, buttons, navbar hover, hero, service cards, footer, spinner, testimonial, stats, product badge, `.hero-milestone`, `.testimonial-initial`, `.badge.bg-primary` |
| [index.html](index.html) | Homepage: hero, stats, 6 services, 4 featured products, about snippet, quote form, 3 testimonials, footer, WhatsApp; removed team section and food menu |
| [about.html](about.html) | Story, mission/vision/values, why choose us, shared chrome |
| [service.html](service.html) | 8 services + CTA |
| [shop.html](shop.html) | Renamed from `menu.html`; catalog + filters + inline JS |
| [contact.html](contact.html) | Cards, map, form |
| [testimonial.html](testimonial.html) | 6 carousel items, initials |
| [booking.html](booking.html) | Nav/footer/head/WhatsApp; neutral enquiry copy |
| [team.html](team.html) | Nav/footer/head/WhatsApp; section title de-themed |
| [js/main.js](js/main.js) | Removed stray `console.log($videoSrc)` |
| [restoran-1.0.0/*](restoran-1.0.0/) | Mirrored same files as root for parity |

## 2. Color values changed in CSS

- `--primary`: `#FEA116` → `#1A3C8F`
- `--light`: `#F1F8FF` → `#F8F9FA`
- `--dark`: `#0F172B` → `#0D1E4C`
- Added `--accent`: `#F5A623`
- Hero overlay: `rgba(13, 30, 76, 0.85)` over `bg-hero.jpg`
- `.text-primary` / `.border-primary` → `#1A3C8F`
- Navbar link hover/active: `#F5A623`
- `.btn-primary` / hover: `#1A3C8F` / `#0D1E4C`
- `.btn-warning` / hover: `#F5A623` / `#e09610`
- Service hover: border `#1A3C8F`, shadow `rgba(26,60,143,0.15)`
- Footer background: `#0D1E4C`; footer titles: `#F5A623`; link/social hover: `#F5A623`
- Testimonial center slide: `#1A3C8F`; dots active: `#1A3C8F`
- `.testimonial-initial`: `#1A3C8F` on `#FFFFFF` text

## 3. Font references updated

- Removed **Pacifico** from all Google Fonts URLs (HTML) and from `.ff-secondary` (CSS).
- `.ff-secondary`: `Nunito`, `font-weight: 700`.
- Body/headings continue to use **Heebo** / **Nunito** via existing stacks and Google Fonts link (`Nunito` weights 400–800).

## 4. Navbar consistency

All primary pages use the same structure: logo → Home, About, Products & Services, Shop, Testimonials, Contact → **Get a Quote** (`btn-warning`) → `contact.html`.

## 5. Active states

| Page | Active link |
|------|-------------|
| index.html | Home |
| about.html | About |
| service.html | Products & Services |
| shop.html | Shop |
| testimonial.html | Testimonials |
| contact.html | Contact |
| booking.html / team.html | None (not in main nav) |

## 6. `menu.html` → `shop.html`

- Renamed to `shop.html` (root and `restoran-1.0.0/`).
- No remaining `menu.html` references (verified by search).

## 7. WhatsApp floating button

Present on every HTML page (fixed `bottom: 45px; right: 45px`, mirrored from back-to-top; `wa.me/254726578235`).

## 8. Food-related content

- Removed from main site flows (homepage team, food menu, etc.).
- **Flags:** [booking.html](booking.html) still uses the original **video + datetime** reservation *layout* (legacy template); copy was neutralized (“Request a Consultation”). [team.html](team.html) still uses placeholder team images/cards from the template (non-food labels updated).

## 9. Font Awesome 5.10 flags

- **`fa-boxes`**: Not used in FA 5.10 free set as a standard alias; [about.html](about.html) uses **`fa-cubes`** for “Wide Product Range” instead of brief’s `fa-boxes`.
- **`fa-couch`**: Present in FA5 solid (Pro in some builds). If an icon fails to render, replace with `fa-chair` or `fa-warehouse` per your kit.
- **`fa-football-ball`**: Valid in FA5 free solid; if missing in your build, use `fa-futbol` or `fa-football-ball` per CDN version.

## 10. Internal links

- Nav and footer use relative `.html` targets (`index.html`, `about.html`, `service.html`, `shop.html`, `testimonial.html`, `contact.html`).
- No broken `menu.html` links found.

## 11. Template sections not found / adapted

- Original **standalone 4-column stats bar** did not exist; **inserted** on the homepage.
- **Food menu** block replaced with **featured products** and **shop** page.
- **Team** block removed from homepage; **team.html** retained as optional page.

## 12. Image paths referenced (add assets under `img/`)

**Shop catalog** (`shop.html`): all product images under `img/` with prefixes `book`, `sta`, `ball`, `lab`, `furniture`, `exam` are listed as separate products (see `scripts/gen_shop_products.ps1` + `shop-products-snippet.html`). **Not** used as shop products: `logo.png`, `bg-hero.jpg`, `hero.png`, `about-1.jpg` … `about-4.jpg` (about/hero chrome).

Other: `favicon.ico`, `product-1.jpg` … `product-12.jpg` if referenced, **team.html** (`team-1.jpg` …), **booking** (`video.jpg` if used).

---

*Generated as part of the Milestone site implementation.*
