<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEXUS — curated objects & tech</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #0e0e0e;
            --bg-elevated: #161616;
            --bg-card: #1a1a1a;
            --white: #f5f3ef;
            --muted: #8a8a8a;
            --line: rgba(245, 243, 239, 0.08);
            --accent: #e8ff47;
            --accent-dim: rgba(232, 255, 71, 0.12);
            --radius: 4px;
            --font-sans: 'Space Grotesk', system-ui, sans-serif;
            --font-serif: 'Instrument Serif', Georgia, serif;
            --ease: cubic-bezier(0.19, 1, 0.22, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            background: var(--bg);
            color: var(--white);
            font-family: var(--font-sans);
            font-size: 15px;
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
            overflow-x: hidden;
        }

        ::selection {
            background: var(--accent);
            color: var(--bg);
        }

        .container {
            max-width: 1440px;
            margin: 0 auto;
            padding: 0 40px;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        /* ---------- ANNOUNCEMENT BAR ---------- */
        .announcement {
            background: var(--accent);
            color: var(--bg);
            text-align: center;
            padding: 10px;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            overflow: hidden;
            white-space: nowrap;
        }

        .announcement span {
            display: inline-block;
            animation: marquee 20s linear infinite;
        }

        @keyframes marquee {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }

        /* ---------- HEADER ---------- */
        header {
            position: sticky;
            top: 0;
            z-index: 200;
            background: rgba(14, 14, 14, 0.85);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--line);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 76px;
            gap: 20px;
        }

        .logo {
            font-family: var(--font-sans);
            font-weight: 700;
            font-size: 22px;
            letter-spacing: -0.04em;
            display: flex;
            align-items: center;
            gap: 8px;
            white-space: nowrap;
        }

        .logo::before {
            content: '';
            width: 10px;
            height: 10px;
            background: var(--accent);
            border-radius: 50%;
            flex-shrink: 0;
        }

        .nav-main {
            display: flex;
            gap: 4px;
            align-items: center;
        }

        .nav-main > a,
        .nav-dropdown > a {
            font-size: 13px;
            font-weight: 500;
            letter-spacing: 0.02em;
            padding: 10px 16px;
            color: var(--muted);
            transition: color 0.25s var(--ease);
            display: flex;
            align-items: center;
            gap: 6px;
            position: relative;
        }

        .nav-main > a:hover,
        .nav-dropdown > a:hover {
            color: var(--white);
        }

        .nav-main > a::after {
            content: '';
            position: absolute;
            bottom: 4px;
            left: 16px;
            right: 16px;
            height: 1px;
            background: var(--accent);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.35s var(--ease);
        }

        .nav-main > a:hover::after {
            transform: scaleX(1);
            transform-origin: left;
        }

        .nav-dropdown {
            position: relative;
        }

        .nav-dropdown-menu {
            position: absolute;
            top: calc(100% + 8px);
            left: 0;
            background: var(--bg-elevated);
            border: 1px solid var(--line);
            border-radius: var(--radius);
            min-width: 220px;
            padding: 8px;
            opacity: 0;
            visibility: hidden;
            transform: translateY(-8px);
            transition: all 0.3s var(--ease);
            box-shadow: 0 24px 48px rgba(0, 0, 0, 0.6);
        }

        .nav-dropdown:hover .nav-dropdown-menu {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        .nav-dropdown-menu a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 11px 14px;
            font-size: 13px;
            color: var(--muted);
            border-radius: var(--radius);
            transition: all 0.2s var(--ease);
        }

        .nav-dropdown-menu a:hover {
            background: var(--bg-card);
            color: var(--white);
        }

        .nav-dropdown-menu a i {
            font-size: 13px;
            width: 16px;
            opacity: 0.6;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .icon-btn {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            color: var(--muted);
            font-size: 15px;
            transition: all 0.25s var(--ease);
            position: relative;
            background: transparent;
            border: none;
            cursor: pointer;
        }

        .icon-btn:hover {
            color: var(--white);
            background: var(--bg-card);
        }

        .cart-dot {
            position: absolute;
            top: 8px;
            right: 8px;
            width: 7px;
            height: 7px;
            background: var(--accent);
            border-radius: 50%;
            border: 2px solid var(--bg);
        }

        .menu-toggle {
            display: none;
            width: 42px;
            height: 42px;
            background: none;
            border: none;
            color: var(--white);
            font-size: 18px;
            cursor: pointer;
        }

        /* search overlay */
        .search-trigger {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 9px 18px;
            border: 1px solid var(--line);
            border-radius: 40px;
            color: var(--muted);
            font-size: 13px;
            cursor: text;
            transition: all 0.25s var(--ease);
            margin-right: 8px;
        }

        .search-trigger:hover {
            border-color: rgba(245, 243, 239, 0.2);
            color: var(--white);
        }

        .search-trigger i {
            font-size: 12px;
        }

        .search-trigger kbd {
            font-family: var(--font-sans);
            font-size: 10px;
            padding: 2px 6px;
            border-radius: 4px;
            background: var(--bg-card);
            border: 1px solid var(--line);
            color: var(--muted);
        }

        /* ---------- HERO ---------- */
        .hero {
            position: relative;
            min-height: 92vh;
            display: flex;
            align-items: flex-end;
            padding-bottom: 60px;
            overflow: hidden;
        }

        .hero-bg {
            position: absolute;
            inset: 0;
            z-index: 0;
        }

        .hero-bg img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: grayscale(40%) brightness(0.55);
        }

        .hero-bg::after {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(14,14,14,0.3) 0%, rgba(14,14,14,0.95) 100%);
        }

        .hero-content {
            position: relative;
            z-index: 2;
            width: 100%;
        }

        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--accent);
            margin-bottom: 28px;
        }

        .hero-tag::before {
            content: '';
            width: 24px;
            height: 1px;
            background: var(--accent);
        }

        .hero h1 {
            font-family: var(--font-serif);
            font-weight: 400;
            font-size: clamp(3.4rem, 10vw, 8.5rem);
            line-height: 0.95;
            letter-spacing: -0.03em;
            margin-bottom: 32px;
            max-width: 1100px;
        }

        .hero h1 em {
            font-style: italic;
            color: var(--accent);
        }

        .hero-bottom {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            gap: 40px;
            flex-wrap: wrap;
        }

        .hero-desc {
            max-width: 400px;
            color: var(--muted);
            font-size: 15px;
            line-height: 1.7;
        }

        .hero-cta {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 16px 32px;
            border-radius: 40px;
            font-family: var(--font-sans);
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            cursor: pointer;
            border: 1px solid transparent;
            transition: all 0.3s var(--ease);
            white-space: nowrap;
        }

        .btn-accent {
            background: var(--accent);
            color: var(--bg);
        }

        .btn-accent:hover {
            background: var(--white);
            transform: translateY(-2px);
        }

        .btn-ghost {
            background: transparent;
            color: var(--white);
            border-color: rgba(245, 243, 239, 0.2);
        }

        .btn-ghost:hover {
            border-color: var(--white);
            background: rgba(245, 243, 239, 0.04);
        }

        .btn i {
            font-size: 12px;
        }

        .hero-scroll {
            position: absolute;
            bottom: 60px;
            right: 40px;
            z-index: 2;
            writing-mode: vertical-rl;
            font-size: 11px;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: var(--muted);
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .hero-scroll::after {
            content: '';
            width: 1px;
            height: 60px;
            background: linear-gradient(var(--accent), transparent);
        }

        /* ---------- MARQUEE STRIP ---------- */
        .strip {
            border-top: 1px solid var(--line);
            border-bottom: 1px solid var(--line);
            padding: 22px 0;
            overflow: hidden;
            white-space: nowrap;
            display: flex;
        }

        .strip-track {
            display: flex;
            gap: 48px;
            padding-right: 48px;
            animation: strip-scroll 30s linear infinite;
            flex-shrink: 0;
        }

        .strip-track span {
            font-family: var(--font-serif);
            font-size: 22px;
            font-style: italic;
            color: var(--muted);
            display: flex;
            align-items: center;
            gap: 48px;
        }

        .strip-track span::after {
            content: '✦';
            font-style: normal;
            font-size: 14px;
            color: var(--accent);
        }

        @keyframes strip-scroll {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }

        /* ---------- SECTION HEADINGS ---------- */
        .section-head {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            gap: 30px;
            padding: 100px 0 48px;
            border-bottom: 1px solid var(--line);
            margin-bottom: 0;
            flex-wrap: wrap;
        }

        .section-head-left {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .section-index {
            font-size: 11px;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: var(--accent);
            font-weight: 600;
        }

        .section-head h2 {
            font-family: var(--font-serif);
            font-weight: 400;
            font-size: clamp(2.2rem, 5vw, 3.8rem);
            line-height: 1;
            letter-spacing: -0.02em;
        }

        .section-head h2 em {
            font-style: italic;
        }

        .section-link {
            font-size: 12px;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--muted);
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding-bottom: 6px;
            border-bottom: 1px solid transparent;
            transition: all 0.3s var(--ease);
            white-space: nowrap;
        }

        .section-link:hover {
            color: var(--accent);
            border-color: var(--accent);
            gap: 16px;
        }

        /* ---------- CATEGORY GRID ---------- */
        .cat-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            border-left: 1px solid var(--line);
            border-top: 1px solid var(--line);
        }

        .cat-item {
            padding: 44px 36px;
            border-right: 1px solid var(--line);
            border-bottom: 1px solid var(--line);
            display: flex;
            flex-direction: column;
            gap: 24px;
            transition: background 0.4s var(--ease);
            position: relative;
            overflow: hidden;
            cursor: pointer;
            min-height: 240px;
        }

        .cat-item::before {
            content: '';
            position: absolute;
            inset: 0;
            background: var(--accent);
            transform: translateY(101%);
            transition: transform 0.5s var(--ease);
            z-index: 0;
        }

        .cat-item:hover::before {
            transform: translateY(0);
        }

        .cat-item > * {
            position: relative;
            z-index: 1;
            transition: color 0.4s var(--ease);
        }

        .cat-item:hover {
            color: var(--bg);
        }

        .cat-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .cat-num {
            font-size: 11px;
            letter-spacing: 0.1em;
            color: var(--muted);
            font-weight: 500;
        }

        .cat-item:hover .cat-num,
        .cat-item:hover .cat-desc {
            color: rgba(14, 14, 14, 0.6);
        }

        .cat-icon {
            font-size: 20px;
            opacity: 0.7;
        }

        .cat-name {
            font-family: var(--font-serif);
            font-size: 30px;
            line-height: 1;
            letter-spacing: -0.01em;
            margin-top: auto;
        }

        .cat-desc {
            font-size: 12px;
            color: var(--muted);
            letter-spacing: 0.02em;
        }

        /* ---------- PRODUCTS ---------- */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            border-left: 1px solid var(--line);
        }

        .product {
            border-right: 1px solid var(--line);
            border-bottom: 1px solid var(--line);
            padding: 24px;
            display: flex;
            flex-direction: column;
            position: relative;
            transition: background 0.35s var(--ease);
            cursor: pointer;
            group: product;
        }

        .product:hover {
            background: var(--bg-elevated);
        }

        .product-visual {
            position: relative;
            aspect-ratio: 1 / 1.1;
            overflow: hidden;
            background: var(--bg-card);
            margin-bottom: 22px;
            border-radius: var(--radius);
        }

        .product-visual img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.8s var(--ease);
            filter: grayscale(15%);
        }

        .product:hover .product-visual img {
            transform: scale(1.06);
            filter: grayscale(0%);
        }

        .product-tag {
            position: absolute;
            top: 12px;
            left: 12px;
            font-size: 10px;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            padding: 5px 10px;
            border-radius: 30px;
            background: var(--bg);
            color: var(--white);
            z-index: 2;
        }

        .product-tag.sale {
            background: var(--accent);
            color: var(--bg);
        }

        .quick-add {
            position: absolute;
            bottom: 12px;
            left: 12px;
            right: 12px;
            padding: 12px;
            background: var(--white);
            color: var(--bg);
            font-family: var(--font-sans);
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            opacity: 0;
            transform: translateY(8px);
            transition: all 0.35s var(--ease);
            z-index: 2;
        }

        .product:hover .quick-add {
            opacity: 1;
            transform: translateY(0);
        }

        .quick-add:hover {
            background: var(--accent);
        }

        .product-meta {
            display: flex;
            flex-direction: column;
            gap: 6px;
            flex: 1;
        }

        .product-cat {
            font-size: 10px;
            letter-spacing: 0.14em;
            text-transform: uppercase;
            color: var(--muted);
        }

        .product-name {
            font-family: var(--font-sans);
            font-weight: 500;
            font-size: 15px;
            letter-spacing: -0.01em;
            line-height: 1.35;
            color: var(--white);
        }

        .product-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .product-price {
            font-size: 15px;
            font-weight: 600;
            color: var(--white);
            display: flex;
            align-items: baseline;
            gap: 8px;
        }

        .product-price del {
            font-size: 12px;
            color: var(--muted);
            font-weight: 400;
        }

        .product-rating {
            display: flex;
            gap: 2px;
            font-size: 10px;
            color: var(--accent);
        }

        /* ---------- EDITORIAL / DEAL ---------- */
        .editorial {
            padding: 100px 0;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
        }

        .editorial-visual {
            position: relative;
            aspect-ratio: 4 / 5;
            border-radius: var(--radius);
            overflow: hidden;
        }

        .editorial-visual img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: grayscale(30%);
        }

        .editorial-badge {
            position: absolute;
            top: 24px;
            right: 24px;
            background: var(--accent);
            color: var(--bg);
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            padding: 10px 16px;
            border-radius: 40px;
        }

        .editorial-content {
            display: flex;
            flex-direction: column;
            gap: 28px;
            max-width: 520px;
        }

        .editorial-content h2 {
            font-family: var(--font-serif);
            font-weight: 400;
            font-size: clamp(2.4rem, 4.5vw, 3.6rem);
            line-height: 1.02;
            letter-spacing: -0.02em;
        }

        .editorial-content h2 em {
            font-style: italic;
            color: var(--accent);
        }

        .editorial-content > p {
            color: var(--muted);
            font-size: 15px;
            line-height: 1.75;
        }

        .timer {
            display: flex;
            gap: 12px;
        }

        .timer-unit {
            display: flex;
            flex-direction: column;
            gap: 6px;
            padding: 16px 20px;
            border: 1px solid var(--line);
            border-radius: var(--radius);
            min-width: 76px;
            text-align: center;
        }

        .timer-unit strong {
            font-family: var(--font-serif);
            font-size: 32px;
            line-height: 1;
            font-weight: 400;
            color: var(--white);
        }

        .timer-unit span {
            font-size: 10px;
            letter-spacing: 0.14em;
            text-transform: uppercase;
            color: var(--muted);
        }

        .editorial-price {
            display: flex;
            align-items: baseline;
            gap: 16px;
            padding-top: 8px;
        }

        .editorial-price .now {
            font-family: var(--font-serif);
            font-size: 44px;
            line-height: 1;
            color: var(--accent);
        }

        .editorial-price .was {
            font-size: 16px;
            color: var(--muted);
            text-decoration: line-through;
        }

        .stock-line {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 12px;
            color: var(--muted);
            letter-spacing: 0.04em;
        }

        .stock-bar {
            flex: 1;
            height: 2px;
            background: var(--line);
            border-radius: 2px;
            overflow: hidden;
            max-width: 200px;
        }

        .stock-bar::after {
            content: '';
            display: block;
            width: 30%;
            height: 100%;
            background: var(--accent);
        }

        /* ---------- TESTIMONIALS ---------- */
        .testi-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            border-left: 1px solid var(--line);
        }

        .testi {
            border-right: 1px solid var(--line);
            border-bottom: 1px solid var(--line);
            padding: 44px 36px;
            display: flex;
            flex-direction: column;
            gap: 28px;
            transition: background 0.35s var(--ease);
        }

        .testi:hover {
            background: var(--bg-elevated);
        }

        .testi-quote {
            font-family: var(--font-serif);
            font-size: 21px;
            line-height: 1.45;
            letter-spacing: -0.01em;
            color: var(--white);
            flex: 1;
        }

        .testi-quote::before {
            content: '“';
            color: var(--accent);
            font-size: 1.4em;
            line-height: 0;
            vertical-align: -0.2em;
            margin-right: 2px;
        }

        .testi-footer {
            display: flex;
            align-items: center;
            gap: 14px;
            padding-top: 20px;
            border-top: 1px solid var(--line);
        }

        .testi-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            filter: grayscale(100%);
        }

        .testi-who {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .testi-name {
            font-size: 13px;
            font-weight: 600;
            color: var(--white);
        }

        .testi-role {
            font-size: 11px;
            color: var(--muted);
            letter-spacing: 0.04em;
        }

        .testi-stars {
            margin-left: auto;
            display: flex;
            gap: 2px;
            color: var(--accent);
            font-size: 10px;
        }

        /* ---------- NEWSLETTER ---------- */
        .newsletter {
            border-top: 1px solid var(--line);
            padding: 120px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            gap: 28px;
            position: relative;
            overflow: hidden;
        }

        .newsletter::before {
            content: 'NEXUS';
            position: absolute;
            font-family: var(--font-sans);
            font-weight: 700;
            font-size: 28vw;
            letter-spacing: -0.06em;
            color: rgba(245, 243, 239, 0.015);
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            pointer-events: none;
            white-space: nowrap;
        }

        .newsletter > * {
            position: relative;
            z-index: 1;
        }

        .newsletter h2 {
            font-family: var(--font-serif);
            font-weight: 400;
            font-size: clamp(2.4rem, 6vw, 4.4rem);
            line-height: 1;
            letter-spacing: -0.02em;
            max-width: 700px;
        }

        .newsletter h2 em {
            font-style: italic;
            color: var(--accent);
        }

        .newsletter p {
            color: var(--muted);
            max-width: 440px;
            font-size: 15px;
            line-height: 1.7;
        }

        .newsletter-form {
            display: flex;
            gap: 0;
            max-width: 480px;
            width: 100%;
            border-bottom: 1px solid rgba(245, 243, 239, 0.2);
            margin-top: 12px;
            transition: border-color 0.3s var(--ease);
        }

        .newsletter-form:focus-within {
            border-color: var(--accent);
        }

        .newsletter-form input {
            flex: 1;
            background: transparent;
            border: none;
            outline: none;
            padding: 18px 4px;
            font-family: var(--font-sans);
            font-size: 15px;
            color: var(--white);
        }

        .newsletter-form input::placeholder {
            color: var(--muted);
        }

        .newsletter-form button {
            background: transparent;
            border: none;
            color: var(--accent);
            font-family: var(--font-sans);
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            cursor: pointer;
            padding: 0 4px;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: gap 0.3s var(--ease);
        }

        .newsletter-form button:hover {
            gap: 14px;
        }

        /* ---------- FOOTER ---------- */
        footer {
            border-top: 1px solid var(--line);
            padding-top: 80px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 1.4fr 1fr 1fr 1fr;
            gap: 48px;
            padding-bottom: 80px;
        }

        .footer-brand {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .footer-brand .logo {
            font-size: 24px;
        }

        .footer-brand p {
            color: var(--muted);
            font-size: 14px;
            line-height: 1.7;
            max-width: 300px;
        }

        .footer-socials {
            display: flex;
            gap: 8px;
            margin-top: 8px;
        }

        .footer-socials a {
            width: 38px;
            height: 38px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid var(--line);
            border-radius: 50%;
            color: var(--muted);
            font-size: 13px;
            transition: all 0.3s var(--ease);
        }

        .footer-socials a:hover {
            background: var(--accent);
            color: var(--bg);
            border-color: var(--accent);
            transform: translateY(-3px);
        }

        .footer-col {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .footer-col h4 {
            font-size: 11px;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--muted);
            font-weight: 600;
            margin-bottom: 4px;
        }

        .footer-col a {
            font-size: 14px;
            color: var(--white);
            opacity: 0.8;
            transition: all 0.25s var(--ease);
            width: fit-content;
        }

        .footer-col a:hover {
            opacity: 1;
            color: var(--accent);
            transform: translateX(4px);
        }

        .footer-bottom {
            border-top: 1px solid var(--line);
            padding: 28px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .footer-bottom p {
            font-size: 12px;
            color: var(--muted);
            letter-spacing: 0.04em;
        }

        .footer-payments {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .footer-payments img {
            height: 20px;
            filter: brightness(0) invert(0.6);
            opacity: 0.7;
            transition: opacity 0.25s;
        }

        .footer-payments img:hover {
            opacity: 1;
        }

        /* ---------- SEARCH OVERLAY ---------- */
        .search-overlay {
            position: fixed;
            inset: 0;
            background: rgba(14, 14, 14, 0.96);
            backdrop-filter: blur(20px);
            z-index: 500;
            display: flex;
            align-items: flex-start;
            justify-content: center;
            padding-top: 18vh;
            opacity: 0;
            visibility: hidden;
            transition: all 0.35s var(--ease);
        }

        .search-overlay.open {
            opacity: 1;
            visibility: visible;
        }

        .search-box {
            width: 100%;
            max-width: 720px;
            padding: 0 40px;
        }

        .search-box-label {
            font-size: 11px;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: var(--muted);
            margin-bottom: 16px;
        }

        .search-box input {
            width: 100%;
            background: transparent;
            border: none;
            border-bottom: 1px solid rgba(245, 243, 239, 0.2);
            padding: 16px 0;
            font-family: var(--font-serif);
            font-size: 36px;
            color: var(--white);
            outline: none;
        }

        .search-box input::placeholder {
            color: rgba(245, 243, 239, 0.25);
        }

        .search-hint {
            margin-top: 20px;
            font-size: 12px;
            color: var(--muted);
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .search-close {
            position: absolute;
            top: 32px;
            right: 40px;
            background: transparent;
            border: 1px solid var(--line);
            color: var(--muted);
            width: 44px;
            height: 44px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.25s var(--ease);
        }

        .search-close:hover {
            color: var(--white);
            border-color: var(--white);
        }

        /* ---------- REVEAL ANIMATION ---------- */
        .reveal {
            opacity: 0;
            transform: translateY(24px);
            transition: opacity 0.8s var(--ease), transform 0.8s var(--ease);
        }

        .reveal.in {
            opacity: 1;
            transform: translateY(0);
        }

        /* ---------- RESPONSIVE ---------- */
        @media (max-width: 1100px) {
            .products-grid { grid-template-columns: repeat(3, 1fr); }
            .footer-grid { grid-template-columns: 1fr 1fr; gap: 40px; }
        }

        @media (max-width: 900px) {
            .container { padding: 0 24px; }
            .nav-main { display: none; }
            .menu-toggle { display: flex; }
            .search-trigger { display: none; }
            .cat-grid { grid-template-columns: repeat(2, 1fr); }
            .testi-grid { grid-template-columns: 1fr; }
            .editorial { grid-template-columns: 1fr; gap: 40px; padding: 64px 0; }
            .editorial-visual { aspect-ratio: 16 / 12; }
            .section-head { padding: 64px 0 32px; }
            .hero { min-height: 80vh; }
            .hero-scroll { display: none; }

            /* mobile nav */
            .nav-main.mobile-open {
                display: flex;
                flex-direction: column;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: var(--bg);
                border-bottom: 1px solid var(--line);
                padding: 16px;
                gap: 4px;
                align-items: stretch;
            }
            .nav-main.mobile-open > a,
            .nav-main.mobile-open .nav-dropdown > a {
                padding: 16px;
                font-size: 15px;
                color: var(--white);
            }
            .nav-main.mobile-open .nav-dropdown-menu {
                position: static;
                opacity: 1;
                visibility: visible;
                transform: none;
                box-shadow: none;
                border: none;
                background: transparent;
                padding-left: 16px;
            }
        }

        @media (max-width: 680px) {
            .products-grid { grid-template-columns: repeat(2, 1fr); }
            .cat-grid { grid-template-columns: 1fr 1fr; }
            .cat-item { padding: 32px 24px; min-height: 200px; }
            .cat-name { font-size: 22px; }
            .product { padding: 16px; }
            .testi { padding: 32px 24px; }
            .testi-quote { font-size: 18px; }
            .hero-bottom { flex-direction: column; align-items: flex-start; }
            .editorial-price .now { font-size: 34px; }
            .timer-unit { min-width: 62px; padding: 12px 14px; }
            .timer-unit strong { font-size: 24px; }
            .footer-grid { grid-template-columns: 1fr; gap: 36px; padding-bottom: 48px; }
            .footer-bottom { justify-content: center; text-align: center; }
            .newsletter { padding: 80px 0; }
            .search-box input { font-size: 24px; }
            .search-close { top: 20px; right: 20px; }
        }

        @media (max-width: 480px) {
            .products-grid { grid-template-columns: 1fr; }
            .cat-grid { grid-template-columns: 1fr; }
            .hero h1 { font-size: 3rem; }
            .section-head h2 { font-size: 2rem; }
        }
    </style>
</head>
<body>

    <!-- Announcement bar -->
    <div class="announcement">
        <span>Free worldwide shipping over $150 &nbsp;·&nbsp; New drop: Winter 2023 &nbsp;·&nbsp; Free worldwide shipping over $150 &nbsp;·&nbsp; New drop: Winter 2023 &nbsp;·&nbsp; Free worldwide shipping over $150 &nbsp;·&nbsp; New drop: Winter 2023 &nbsp;·&nbsp;</span>
    </div>

    <!-- Header -->
    <header>
        <div class="container header-inner">
            <a href="#" class="logo">NEXUS</a>

            <nav class="nav-main" id="mainNav">
                <a href="#">Shop</a>
                <div class="nav-dropdown">
                    <a href="#">Categories <i class="fas fa-chevron-down" style="font-size: 9px; opacity: 0.6;"></i></a>
                    <div class="nav-dropdown-menu">
                        <a href="#"><i class="fas fa-mobile-alt"></i> Smartphones</a>
                        <a href="#"><i class="fas fa-laptop"></i> Laptops</a>
                        <a href="#"><i class="fas fa-tshirt"></i> Clothing</a>
                        <a href="#"><i class="fas fa-headphones"></i> Audio</a>
                        <a href="#"><i class="fas fa-shoe-prints"></i> Footwear</a>
                        <a href="#"><i class="fas fa-watch"></i> Accessories</a>
                    </div>
                </div>
                <a href="#">Collections</a>
                <a href="#">Journal</a>
                <a href="#">About</a>
            </nav>

            <div class="header-actions">
                <div class="search-trigger" id="searchTrigger">
                    <i class="fas fa-search"></i>
                    <span>Search</span>
                    <kbd>⌘K</kbd>
                </div>
                <a href="#" class="icon-btn" aria-label="Account"><i class="far fa-user"></i></a>
                <a href="#" class="icon-btn" aria-label="Wishlist"><i class="far fa-heart"></i></a>
                <a href="#" class="icon-btn" aria-label="Cart">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-dot"></span>
                </a>
                <button class="menu-toggle" id="menuToggle" aria-label="Menu"><i class="fas fa-bars"></i></button>
            </div>
        </div>
    </header>

    <!-- Hero -->
    <section class="hero">
        <div class="hero-bg">
            <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80" alt="Editorial fashion display">
        </div>
        <div class="container hero-content">
            <div class="hero-tag">Winter 2023 — Curated Selection</div>
            <h1>Objects of<br>desire, <em>made</em><br>to last.</h1>
            <div class="hero-bottom">
                <p class="hero-desc">
                    A tightly edited collection of technology, fashion, and objects — chosen for craftsmanship, utility, and the way they live in your life.
                </p>
                <div class="hero-cta">
                    <a href="#" class="btn btn-accent">Shop the edit <i class="fas fa-arrow-right"></i></a>
                    <a href="#" class="btn btn-ghost">View lookbook</a>
                </div>
            </div>
        </div>
        <div class="hero-scroll">Scroll to explore</div>
    </section>

    <!-- Marquee strip -->
    <div class="strip">
        <div class="strip-track">
            <span>Smartphones</span><span>Audio</span><span>Laptops</span><span>Footwear</span><span>Accessories</span><span>Clothing</span>
        </div>
        <div class="strip-track" aria-hidden="true">
            <span>Smartphones</span><span>Audio</span><span>Laptops</span><span>Footwear</span><span>Accessories</span><span>Clothing</span>
        </div>
    </div>

    <!-- Categories -->
    <section class="container">
        <div class="section-head reveal">
            <div class="section-head-left">
                <span class="section-index">01 — Categories</span>
                <h2>Browse by <em>category</em></h2>
            </div>
            <a href="#" class="section-link">View all categories <i class="fas fa-arrow-right" style="font-size: 10px;"></i></a>
        </div>

        <div class="cat-grid reveal">
            <div class="cat-item">
                <div class="cat-top"><span class="cat-num">01 / 06</span><i class="fas fa-mobile-alt cat-icon"></i></div>
                <div class="cat-name">Smartphones</div>
                <div class="cat-desc">Flagship devices, thoughtfully chosen</div>
            </div>
            <div class="cat-item">
                <div class="cat-top"><span class="cat-num">02 / 06</span><i class="fas fa-laptop cat-icon"></i></div>
                <div class="cat-name">Laptops</div>
                <div class="cat-desc">Machines for makers and thinkers</div>
            </div>
            <div class="cat-item">
                <div class="cat-top"><span class="cat-num">03 / 06</span><i class="fas fa-headphones cat-icon"></i></div>
                <div class="cat-name">Audio</div>
                <div class="cat-desc">Sound that deserves your attention</div>
            </div>
            <div class="cat-item">
                <div class="cat-top"><span class="cat-num">04 / 06</span><i class="fas fa-tshirt cat-icon"></i></div>
                <div class="cat-name">Clothing</div>
                <div class="cat-desc">Considered garments, timeless cuts</div>
            </div>
            <div class="cat-item">
                <div class="cat-top"><span class="cat-num">05 / 06</span><i class="fas fa-shoe-prints cat-icon"></i></div>
                <div class="cat-name">Footwear</div>
                <div class="cat-desc">Built for the long walk home</div>
            </div>
            <div class="cat-item">
                <div class="cat-top"><span class="cat-num">06 / 06</span><i class="fas fa-watch cat-icon"></i></div>
                <div class="cat-name">Accessories</div>
                <div class="cat-desc">The details that complete the picture</div>
            </div>
        </div>
    </section>

    <!-- Products -->
    <section class="container">
        <div class="section-head reveal">
            <div class="section-head-left">
                <span class="section-index">02 — The Edit</span>
                <h2>New <em>arrivals</em></h2>
            </div>
            <a href="#" class="section-link">All products <i class="fas fa-arrow-right" style="font-size: 10px;"></i></a>
        </div>

        <div class="products-grid reveal">
            <!-- Product 1 -->
            <article class="product">
                <div class="product-visual">
                    <span class="product-tag">New</span>
                    <img src="https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="iPhone 14 Pro Max">
                    <button class="quick-add" data-name="iPhone 14 Pro Max">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Smartphones</span>
                    <h3 class="product-name">iPhone 14 Pro Max</h3>
                    <div class="product-row">
                        <div class="product-price">$1,099 <del>$1,199</del></div>
                        <div class="product-rating">★★★★★</div>
                    </div>
                </div>
            </article>

            <!-- Product 2 -->
            <article class="product">
                <div class="product-visual">
                    <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="MacBook Pro 14">
                    <button class="quick-add" data-name="MacBook Pro 14">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Laptops</span>
                    <h3 class="product-name">MacBook Pro 14"</h3>
                    <div class="product-row">
                        <div class="product-price">$1,999</div>
                        <div class="product-rating">★★★★☆</div>
                    </div>
                </div>
            </article>

            <!-- Product 3 -->
            <article class="product">
                <div class="product-visual">
                    <span class="product-tag sale">−25%</span>
                    <img src="https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="Apple Watch Series 8">
                    <button class="quick-add" data-name="Apple Watch Series 8">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Wearables</span>
                    <h3 class="product-name">Apple Watch Series 8</h3>
                    <div class="product-row">
                        <div class="product-price">$349 <del>$399</del></div>
                        <div class="product-rating">★★★★★</div>
                    </div>
                </div>
            </article>

            <!-- Product 4 -->
            <article class="product">
                <div class="product-visual">
                    <img src="https://images.unsplash.com/photo-1542272604-787c3835535d?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="Nike Air Max 270">
                    <button class="quick-add" data-name="Nike Air Max 270">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Footwear</span>
                    <h3 class="product-name">Nike Air Max 270</h3>
                    <div class="product-row">
                        <div class="product-price">$150</div>
                        <div class="product-rating">★★★★☆</div>
                    </div>
                </div>
            </article>

            <!-- Product 5 -->
            <article class="product">
                <div class="product-visual">
                    <img src="https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="Sony A7 IV Camera">
                    <button class="quick-add" data-name="Sony A7 IV Camera">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Photography</span>
                    <h3 class="product-name">Sony A7 IV Camera</h3>
                    <div class="product-row">
                        <div class="product-price">$2,499</div>
                        <div class="product-rating">★★★★★</div>
                    </div>
                </div>
            </article>

            <!-- Product 6 -->
            <article class="product">
                <div class="product-visual">
                    <span class="product-tag">Bestseller</span>
                    <img src="https://images.unsplash.com/photo-1585386959984-a4155224a1ad?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="Chanel No. 5">
                    <button class="quick-add" data-name="Chanel No. 5">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Fragrance</span>
                    <h3 class="product-name">Chanel No. 5</h3>
                    <div class="product-row">
                        <div class="product-price">$120</div>
                        <div class="product-rating">★★★★★</div>
                    </div>
                </div>
            </article>

            <!-- Product 7 -->
            <article class="product">
                <div class="product-visual">
                    <img src="https://images.unsplash.com/photo-1551232864-3f0890e580d9?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="Travel Backpack">
                    <button class="quick-add" data-name="Travel Backpack">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Bags</span>
                    <h3 class="product-name">Travel Backpack</h3>
                    <div class="product-row">
                        <div class="product-price">$79 <del>$99</del></div>
                        <div class="product-rating">★★★★☆</div>
                    </div>
                </div>
            </article>

            <!-- Product 8 -->
            <article class="product">
                <div class="product-visual">
                    <img src="https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-4.0.3&auto=format&fit=crop&w=700&q=80" alt="Sony WH-1000XM5">
                    <button class="quick-add" data-name="Sony WH-1000XM5">Add to bag</button>
                </div>
                <div class="product-meta">
                    <span class="product-cat">Audio</span>
                    <h3 class="product-name">Sony WH-1000XM5</h3>
                    <div class="product-row">
                        <div class="product-price">$399</div>
                        <div class="product-rating">★★★★★</div>
                    </div>
                </div>
            </article>
        </div>
    </section>

    <!-- Editorial / Deal -->
    <section class="container">
        <div class="editorial reveal">
            <div class="editorial-visual">
                <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="MacBook Air M2">
                <span class="editorial-badge">Flash sale</span>
            </div>
            <div class="editorial-content">
                <span class="section-index">03 — Limited release</span>
                <h2>MacBook Air <em>M2</em>,<br>the everyday machine.</h2>
                <p>The incredibly thin and light MacBook Air, now with the M2 chip. Impossibly powerful. Impossible to beat at this price.</p>

                <div class="timer">
                    <div class="timer-unit"><strong id="hours">24</strong><span>Hours</span></div>
                    <div class="timer-unit"><strong id="minutes">59</strong><span>Minutes</span></div>
                    <div class="timer-unit"><strong id="seconds">59</strong><span>Seconds</span></div>
                </div>

                <div class="editorial-price">
                    <span class="now">$999</span>
                    <span class="was">$1,199</span>
                </div>

                <div class="stock-line">
                    <span>Only 12 left</span>
                    <div class="stock-bar"></div>
                </div>

                <a href="#" class="btn btn-accent" style="align-self: flex-start; margin-top: 8px;">Shop now <i class="fas fa-arrow-right"></i></a>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="container">
        <div class="section-head reveal">
            <div class="section-head-left">
                <span class="section-index">04 — Voices</span>
                <h2>What people <em>say</em></h2>
            </div>
            <a href="#" class="section-link">Read all reviews <i class="fas fa-arrow-right" style="font-size: 10px;"></i></a>
        </div>

        <div class="testi-grid reveal">
            <div class="testi">
                <p class="testi-quote">I've never had such a smooth shopping experience. The products are top quality and exactly as described.</p>
                <div class="testi-footer">
                    <img src="https://randomuser.me/api/portraits/women/43.jpg" alt="Sarah J." class="testi-avatar">
                    <div class="testi-who">
                        <span class="testi-name">Sarah J.</span>
                        <span class="testi-role">Verified buyer</span>
                    </div>
                    <div class="testi-stars">★★★★★</div>
                </div>
            </div>
            <div class="testi">
                <p class="testi-quote">Great selection of products at competitive prices. Customer service was genuinely helpful.</p>
                <div class="testi-footer">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Michael T." class="testi-avatar">
                    <div class="testi-who">
                        <span class="testi-name">Michael T.</span>
                        <span class="testi-role">Verified buyer</span>
                    </div>
                    <div class="testi-stars">★★★★☆</div>
                </div>
            </div>
            <div class="testi">
                <p class="testi-quote">The flash deals are amazing! I got a brand new laptop for 25% off. Will definitely be back.</p>
                <div class="testi-footer">
                    <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Emma L." class="testi-avatar">
                    <div class="testi-who">
                        <span class="testi-name">Emma L.</span>
                        <span class="testi-role">Verified buyer</span>
                    </div>
                    <div class="testi-stars">★★★★★</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Newsletter -->
    <section class="container">
        <div class="newsletter reveal">
            <span class="section-index">05 — Stay close</span>
            <h2>Join the list. Get <em>10% off</em> your first order.</h2>
            <p>Early access to drops, private sales, and stories from the studio. No noise — just the good stuff.</p>
            <form class="newsletter-form" onsubmit="event.preventDefault(); this.querySelector('input').value=''; alert('Thanks for subscribing.');">
                <input type="email" placeholder="your@email.com" required>
                <button type="submit">Subscribe <i class="fas fa-arrow-right" style="font-size: 10px;"></i></button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="#" class="logo">NEXUS</a>
                    <p>A curated shop for people who care about how things are made. Based everywhere, shipping worldwide.</p>
                    <div class="footer-socials">
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="Pinterest"><i class="fab fa-pinterest-p"></i></a>
                        <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="footer-col">
                    <h4>Shop</h4>
                    <a href="#">All products</a>
                    <a href="#">New arrivals</a>
                    <a href="#">On sale</a>
                    <a href="#">Gift cards</a>
                    <a href="#">Lookbook</a>
                </div>
                <div class="footer-col">
                    <h4>Support</h4>
                    <a href="#">Contact us</a>
                    <a href="#">FAQs</a>
                    <a href="#">Shipping</a>
                    <a href="#">Returns</a>
                    <a href="#">Track order</a>
                </div>
                <div class="footer-col">
                    <h4>Studio</h4>
                    <a href="#">Our story</a>
                    <a href="#">Careers</a>
                    <a href="#">Journal</a>
                    <a href="#">Privacy</a>
                    <a href="#">Terms</a>
                </div>
            </div>

            <div class="footer-bottom">
                <p>© 2023 NexusShop — All rights reserved.</p>
                <div class="footer-payments">
                    <img src="https://cdn-icons-png.flaticon.com/512/196/196578.png" alt="Visa">
                    <img src="https://cdn-icons-png.flaticon.com/512/196/196561.png" alt="Mastercard">
                    <img src="https://cdn-icons-png.flaticon.com/512/196/196566.png" alt="American Express">
                    <img src="https://cdn-icons-png.flaticon.com/512/825/825454.png" alt="PayPal">
                </div>
            </div>
        </div>
    </footer>

    <!-- Search overlay -->
    <div class="search-overlay" id="searchOverlay">
        <button class="search-close" id="searchClose" aria-label="Close search"><i class="fas fa-times"></i></button>
        <div class="search-box">
            <div class="search-box-label">Search the shop</div>
            <input type="text" id="searchInput" placeholder="What are you looking for?">
            <div class="search-hint">
                <i class="fas fa-lightbulb" style="color: var(--accent);"></i>
                Try “MacBook”, “headphones”, or “sneakers”
            </div>
        </div>
    </div>

    <script>
        // ----- Mobile menu
        const menuToggle = document.getElementById('menuToggle');
        const mainNav = document.getElementById('mainNav');
        menuToggle.addEventListener('click', () => {
            mainNav.classList.toggle('mobile-open');
            menuToggle.innerHTML = mainNav.classList.contains('mobile-open')
                ? '<i class="fas fa-times"></i>'
                : '<i class="fas fa-bars"></i>';
        });

        // ----- Search overlay
        const searchTrigger = document.getElementById('searchTrigger');
        const searchOverlay = document.getElementById('searchOverlay');
        const searchClose = document.getElementById('searchClose');
        const searchInput = document.getElementById('searchInput');

        function openSearch() {
            searchOverlay.classList.add('open');
            setTimeout(() => searchInput.focus(), 120);
        }
        function closeSearch() {
            searchOverlay.classList.remove('open');
            searchInput.value = '';
        }

        searchTrigger.addEventListener('click', openSearch);
        searchClose.addEventListener('click', closeSearch);
        searchOverlay.addEventListener('click', (e) => {
            if (e.target === searchOverlay) closeSearch();
        });

        document.addEventListener('keydown', (e) => {
            if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 'k') {
                e.preventDefault();
                searchOverlay.classList.contains('open') ? closeSearch() : openSearch();
            }
            if (e.key === 'Escape') closeSearch();
        });

        // ----- Countdown timer
        function updateCountdown() {
            const now = new Date();
            const end = new Date();
            end.setHours(23, 59, 59, 999);
            const diff = end - now;

            const h = Math.floor((diff / (1000 * 60 * 60)) % 24);
            const m = Math.floor((diff / (1000 * 60)) % 60);
            const s = Math.floor((diff / 1000) % 60);

            document.getElementById('hours').textContent = String(h).padStart(2, '0');
            document.getElementById('minutes').textContent = String(m).padStart(2, '0');
            document.getElementById('seconds').textContent = String(s).padStart(2, '0');
        }
        setInterval(updateCountdown, 1000);
        updateCountdown();

        // ----- Quick add to bag
        document.querySelectorAll('.quick-add').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.stopPropagation();
                const original = btn.textContent;
                btn.textContent = '✓ Added';
                btn.style.background = 'var(--accent)';
                btn.style.color = 'var(--bg)';
                setTimeout(() => {
                    btn.textContent = original;
                    btn.style.background = '';
                    btn.style.color = '';
                }, 1400);
            });
        });

        // ----- Scroll reveal
        const reveals = document.querySelectorAll('.reveal');
        const io = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('in');
                    io.unobserve(entry.target);
                }
            });
        }, { threshold: 0.08 });

        reveals.forEach(el => io.observe(el));
    </script>
</body>
</html>
