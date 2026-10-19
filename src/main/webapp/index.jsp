<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NexusShop — modern e‑commerce</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600;14..32,700&family=Plus+Jakarta+Sans:wght@500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #0b2b3b;
            --primary-light: #1c3e52;
            --accent: #3b82f6;
            --accent-soft: #e0f2fe;
            --light: #f9fcff;
            --dark: #121826;
            --gray: #5f6c80;
            --gray-light: #eef3f9;
            --success: #10b981;
            --shadow-sm: 0 4px 12px rgba(0, 0, 0, 0.02);
            --shadow-md: 0 12px 30px rgba(0, 0, 0, 0.04);
            --shadow-lg: 0 24px 48px -12px rgba(0, 0, 0, 0.1);
            --radius-card: 20px;
            --radius-btn: 40px;
            --transition: all 0.25s cubic-bezier(0.2, 0, 0, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', system-ui, sans-serif;
            background-color: #ffffff;
            color: var(--dark);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
        }

        h1, h2, h3, h4 {
            font-family: 'Plus Jakarta Sans', 'Inter', sans-serif;
            font-weight: 700;
            letter-spacing: -0.02em;
            line-height: 1.2;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 24px;
        }

        /* ---------- HEADER ---------- */
        header {
            background: rgba(255, 255, 255, 0.88);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
            position: sticky;
            top: 0;
            z-index: 200;
            border-bottom: 1px solid rgba(0, 0, 0, 0.02);
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 0;
            flex-wrap: wrap;
            gap: 12px;
        }

        .logo {
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -0.03em;
            color: var(--primary);
            text-decoration: none;
            font-family: 'Plus Jakarta Sans', sans-serif;
            display: flex;
            align-items: center;
        }

        .logo span {
            color: var(--accent);
            margin-left: 2px;
        }

        nav ul {
            display: flex;
            list-style: none;
            gap: 6px;
            align-items: center;
        }

        nav ul li {
            position: relative;
        }

        nav ul li a {
            text-decoration: none;
            color: var(--gray);
            font-weight: 500;
            font-size: 15px;
            padding: 8px 14px;
            border-radius: 40px;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 8px;
            white-space: nowrap;
        }

        nav ul li a i {
            font-size: 14px;
            opacity: 0.8;
        }

        nav ul li a:hover {
            color: var(--dark);
            background: var(--gray-light);
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background: white;
            min-width: 220px;
            box-shadow: var(--shadow-lg);
            z-index: 100;
            border-radius: 18px;
            padding: 10px 0;
            top: calc(100% + 8px);
            left: 0;
            border: 1px solid rgba(0, 0, 0, 0.02);
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            padding: 10px 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            color: var(--dark);
            font-weight: 500;
            border-radius: 0;
            background: transparent;
        }

        .dropdown-content a:hover {
            background: var(--accent-soft);
            color: var(--primary);
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid rgba(0, 0, 0, 0.06);
            border-radius: 40px;
            padding: 8px 18px;
            width: 260px;
            transition: var(--transition);
            box-shadow: var(--shadow-sm);
        }

        .search-bar:focus-within {
            border-color: var(--accent);
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
        }

        .search-bar input {
            border: none;
            background: transparent;
            width: 100%;
            padding: 6px 8px;
            outline: none;
            font-size: 14px;
            font-family: 'Inter', sans-serif;
        }

        .search-bar button {
            background: transparent;
            border: none;
            color: var(--gray);
            cursor: pointer;
            font-size: 15px;
            transition: var(--transition);
        }

        .search-bar button:hover {
            color: var(--accent);
        }

        .header-icons {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .header-icons a {
            color: var(--gray);
            position: relative;
            text-decoration: none;
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 40px;
            transition: var(--transition);
            font-size: 18px;
        }

        .header-icons a:hover {
            background: var(--gray-light);
            color: var(--dark);
        }

        .cart-count {
            position: absolute;
            top: 2px;
            right: 2px;
            background: var(--accent);
            color: white;
            border-radius: 20px;
            min-width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            font-weight: 700;
            padding: 0 5px;
            border: 2px solid white;
        }

        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            font-size: 22px;
            color: var(--dark);
            cursor: pointer;
            width: 42px;
            height: 42px;
            border-radius: 40px;
            transition: var(--transition);
        }

        .mobile-menu-btn:hover {
            background: var(--gray-light);
        }

        /* ---------- HERO ---------- */
        .hero {
            height: 540px;
            background: linear-gradient(135deg, rgba(11, 43, 59, 0.8) 0%, rgba(11, 43, 59, 0.6) 100%), 
                        url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80');
            background-size: cover;
            background-position: center 30%;
            display: flex;
            align-items: center;
            color: white;
            text-align: center;
            border-radius: 0 0 40px 40px;
            margin-bottom: 20px;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 24px;
        }

        .hero h1 {
            font-size: clamp(2.4rem, 6vw, 4rem);
            font-weight: 800;
            letter-spacing: -0.03em;
            line-height: 1.1;
            margin-bottom: 24px;
            text-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .hero p {
            font-size: 1.15rem;
            margin-bottom: 36px;
            opacity: 0.9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 14px 36px;
            border-radius: var(--radius-btn);
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: var(--transition);
            border: none;
            cursor: pointer;
            gap: 8px;
            letter-spacing: -0.01em;
        }

        .btn-primary {
            background: white;
            color: var(--primary);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .btn-primary:hover {
            background: var(--accent-soft);
            transform: translateY(-2px);
            box-shadow: 0 16px 28px rgba(0, 0, 0, 0.15);
        }

        .btn-secondary {
            background: transparent;
            color: white;
            border: 1.5px solid rgba(255, 255, 255, 0.4);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: white;
            transform: translateY(-2px);
        }

        .hero-buttons {
            display: flex;
            gap: 16px;
            justify-content: center;
        }

        /* ---------- SECTION TITLE ---------- */
        .section-title {
            text-align: center;
            margin: 64px 0 40px;
        }

        .section-title h2 {
            font-size: clamp(1.9rem, 4vw, 2.6rem);
            font-weight: 800;
            letter-spacing: -0.03em;
            color: var(--primary);
            margin-bottom: 12px;
        }

        .section-title p {
            color: var(--gray);
            font-size: 1.05rem;
            max-width: 620px;
            margin: 0 auto;
        }

        /* ---------- CATEGORIES ---------- */
        .categories {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 20px;
            margin-bottom: 40px;
        }

        .category-card {
            background: white;
            border-radius: var(--radius-card);
            padding: 28px 16px;
            text-align: center;
            transition: var(--transition);
            border: 1px solid rgba(0, 0, 0, 0.02);
            box-shadow: var(--shadow-sm);
            cursor: pointer;
        }

        .category-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-md);
            border-color: var(--accent-soft);
        }

        .category-icon {
            font-size: 34px;
            color: var(--accent);
            margin-bottom: 18px;
            display: inline-flex;
            width: 70px;
            height: 70px;
            align-items: center;
            justify-content: center;
            background: var(--accent-soft);
            border-radius: 30px;
            transition: var(--transition);
        }

        .category-card:hover .category-icon {
            background: var(--accent);
            color: white;
            transform: scale(1.05);
        }

        .category-card h3 {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 6px;
            color: var(--primary);
        }

        .category-card p {
            color: var(--gray);
            font-size: 0.85rem;
            line-height: 1.4;
        }

        /* ---------- PRODUCTS ---------- */
        .products {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 26px;
            margin-bottom: 40px;
        }

        .product-card {
            background: white;
            border-radius: var(--radius-card);
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            transition: var(--transition);
            position: relative;
            border: 1px solid rgba(0, 0, 0, 0.02);
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-lg);
            border-color: rgba(59, 130, 246, 0.15);
        }

        .product-badge {
            position: absolute;
            top: 14px;
            left: 14px;
            background: var(--success);
            color: white;
            padding: 5px 14px;
            border-radius: 40px;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.3px;
            text-transform: uppercase;
            z-index: 2;
            box-shadow: 0 4px 10px rgba(16, 185, 129, 0.3);
        }

        .product-img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            transition: var(--transition);
            background: var(--gray-light);
        }

        .product-card:hover .product-img {
            transform: scale(1.02);
        }

        .product-info {
            padding: 20px 18px 18px;
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .product-info h3 {
            font-size: 1.05rem;
            font-weight: 700;
            margin-bottom: 6px;
            color: var(--primary);
            line-height: 1.3;
        }

        .price {
            font-weight: 800;
            font-size: 1.25rem;
            color: var(--primary);
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .old-price {
            text-decoration: line-through;
            color: #b0b8c5;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .rating {
            color: #fbbf24;
            margin-bottom: 18px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .rating span {
            color: var(--gray);
            font-size: 0.8rem;
            font-weight: 500;
        }

        .add-to-cart {
            width: 100%;
            padding: 12px 0;
            background: var(--gray-light);
            color: var(--primary);
            border: none;
            border-radius: 40px;
            cursor: pointer;
            transition: var(--transition);
            font-weight: 600;
            font-size: 0.9rem;
            margin-top: auto;
            font-family: 'Inter', sans-serif;
        }

        .add-to-cart:hover {
            background: var(--primary);
            color: white;
            transform: scale(1.02);
        }

        /* ---------- DEALS ---------- */
        .deals {
            background: linear-gradient(145deg, #f6faff 0%, #ffffff 100%);
            padding: 20px 0 60px;
            margin: 40px 0;
            border-radius: 48px 48px 0 0;
        }

        .deal-container {
            display: flex;
            align-items: stretch;
            background: white;
            border-radius: 32px;
            overflow: hidden;
            box-shadow: var(--shadow-md);
            border: 1px solid rgba(0, 0, 0, 0.02);
        }

        .deal-img {
            width: 50%;
            height: 440px;
            object-fit: cover;
        }

        .deal-content {
            width: 50%;
            padding: 48px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .deal-content h3 {
            font-size: 2rem;
            font-weight: 800;
            color: var(--primary);
            margin-bottom: 8px;
        }

        .deal-content > p {
            color: var(--gray);
            margin-bottom: 16px;
        }

        .deal-timer {
            display: flex;
            gap: 12px;
            margin: 20px 0 28px;
        }

        .timer-box {
            background: var(--primary);
            color: white;
            padding: 12px 8px;
            border-radius: 16px;
            min-width: 72px;
            text-align: center;
        }

        .timer-box span:first-child {
            font-size: 1.8rem;
            font-weight: 700;
            display: block;
            line-height: 1.2;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        .timer-box span:last-child {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            opacity: 0.7;
        }

        .deal-price {
            font-size: 2.2rem;
            font-weight: 800;
            color: var(--primary);
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .deal-old-price {
            text-decoration: line-through;
            color: #b0b8c5;
            font-size: 1.2rem;
            font-weight: 500;
        }

        .deal-discount {
            background: #ef4444;
            color: white;
            padding: 6px 14px;
            border-radius: 40px;
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 0.3px;
        }

        .deal-content .btn-primary {
            background: var(--primary);
            color: white;
            align-self: flex-start;
            margin-top: 16px;
            box-shadow: none;
        }

        .deal-content .btn-primary:hover {
            background: var(--accent);
            transform: translateY(-2px);
        }

        /* ---------- TESTIMONIALS ---------- */
        .testimonials {
            margin: 20px 0 60px;
        }

        .testimonial-slider {
            display: flex;
            overflow-x: auto;
            scroll-snap-type: x mandatory;
            gap: 26px;
            padding: 16px 4px 32px;
            scrollbar-width: thin;
            scrollbar-color: var(--accent) var(--gray-light);
        }

        .testimonial-slider::-webkit-scrollbar {
            height: 4px;
        }

        .testimonial-slider::-webkit-scrollbar-track {
            background: var(--gray-light);
            border-radius: 10px;
        }

        .testimonial-slider::-webkit-scrollbar-thumb {
            background: var(--accent);
            border-radius: 10px;
        }

        .testimonial-card {
            min-width: 340px;
            background: white;
            border-radius: 28px;
            padding: 32px;
            box-shadow: var(--shadow-sm);
            border: 1px solid rgba(0, 0, 0, 0.02);
            scroll-snap-align: start;
            transition: var(--transition);
        }

        .testimonial-card:hover {
            box-shadow: var(--shadow-md);
        }

        .testimonial-card .rating {
            color: #fbbf24;
            font-size: 1rem;
            margin-bottom: 16px;
        }

        .testimonial-card p {
            font-size: 1rem;
            line-height: 1.6;
            color: var(--dark);
            margin-bottom: 24px;
            font-style: normal;
            font-weight: 400;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .user-avatar {
            width: 52px;
            height: 52px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .user-name {
            font-weight: 700;
            color: var(--primary);
            font-size: 0.95rem;
        }

        .user-title {
            color: var(--gray);
            font-size: 0.8rem;
            font-weight: 500;
        }

        /* ---------- NEWSLETTER ---------- */
        .newsletter {
            background: var(--primary);
            color: white;
            padding: 72px 0;
            text-align: center;
            margin: 20px 0 0;
            border-radius: 48px 48px 0 0;
            position: relative;
            overflow: hidden;
        }

        .newsletter::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -20%;
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(59, 130, 246, 0.15) 0%, transparent 70%);
            border-radius: 50%;
        }

        .newsletter h2 {
            font-size: 2.2rem;
            font-weight: 800;
            margin-bottom: 16px;
            position: relative;
            z-index: 1;
        }

        .newsletter p {
            max-width: 540px;
            margin: 0 auto 36px;
            opacity: 0.8;
            font-size: 1.05rem;
            position: relative;
            z-index: 1;
        }

        .newsletter-form {
            display: flex;
            max-width: 520px;
            margin: 0 auto;
            gap: 12px;
            position: relative;
            z-index: 1;
        }

        .newsletter-form input {
            flex: 1;
            padding: 18px 22px;
            border: none;
            border-radius: var(--radius-btn);
            outline: none;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            background: rgba(255, 255, 255, 0.95);
            transition: var(--transition);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .newsletter-form input:focus {
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.3);
        }

        .newsletter-form button {
            padding: 0 32px;
            background: var(--accent);
            color: white;
            border: none;
            border-radius: var(--radius-btn);
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: var(--transition);
            font-family: 'Inter', sans-serif;
            white-space: nowrap;
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.3);
        }

        .newsletter-form button:hover {
            background: #2563eb;
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(59, 130, 246, 0.4);
        }

        /* ---------- FOOTER ---------- */
        footer {
            background: var(--dark);
            color: white;
            padding: 64px 0 24px;
        }

        .footer-container {
            display: grid;
            grid-template-columns: 1.3fr 1fr 1fr 1fr;
            gap: 48px;
            margin-bottom: 48px;
        }

        .footer-col h3 {
            font-size: 1.05rem;
            font-weight: 700;
            margin-bottom: 24px;
            position: relative;
            padding-bottom: 12px;
            color: white;
        }

        .footer-col h3::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 40px;
            height: 2px;
            background: var(--accent);
            border-radius: 2px;
        }

        .footer-col p {
            color: #a0aec0;
            line-height: 1.7;
            font-size: 0.95rem;
        }

        .footer-col ul {
            list-style: none;
        }

        .footer-col ul li {
            margin-bottom: 12px;
        }

        .footer-col ul li a {
            color: #a0aec0;
            text-decoration: none;
            transition: var(--transition);
            font-size: 0.95rem;
            display: inline-block;
        }

        .footer-col ul li a:hover {
            color: white;
            transform: translateX(4px);
        }

        .social-links {
            display: flex;
            gap: 10px;
            margin-top: 24px;
        }

        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 42px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            color: white;
            transition: var(--transition);
            font-size: 16px;
        }

        .social-links a:hover {
            background: var(--accent);
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(59, 130, 246, 0.3);
        }

        .payment-methods {
            display: flex;
            gap: 12px;
            margin-top: 24px;
            flex-wrap: wrap;
        }

        .payment-methods img {
            height: 26px;
            filter: brightness(0) invert(1);
            opacity: 0.5;
            transition: var(--transition);
        }

        .payment-methods img:hover {
            opacity: 0.9;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 28px;
            border-top: 1px solid rgba(255, 255, 255, 0.06);
            color: #718096;
            font-size: 0.9rem;
        }

        /* ---------- RESPONSIVE ---------- */
        @media (max-width: 1200px) {
            .categories { grid-template-columns: repeat(3, 1fr); }
            .products { grid-template-columns: repeat(3, 1fr); }
            .deal-container { flex-direction: column; border-radius: 28px; }
            .deal-img, .deal-content { width: 100%; }
            .deal-img { height: 340px; }
            .deal-content { padding: 36px 32px; }
        }

        @media (max-width: 992px) {
            .footer-container { grid-template-columns: repeat(2, 1fr); gap: 36px; }
            .hero { height: 480px; }
        }

        @media (max-width: 768px) {
            .header-container { gap: 8px; }
            .search-bar { order: 3; width: 100%; margin-top: 8px; }
            .categories { grid-template-columns: repeat(2, 1fr); gap: 16px; }
            .products { grid-template-columns: repeat(2, 1fr); gap: 18px; }
            .hero h1 { font-size: 2.2rem; }
            .hero p { font-size: 1rem; }
            .hero-buttons { flex-direction: column; align-items: center; }
            .btn { width: 100%; max-width: 280px; }
            .mobile-menu-btn { display: flex; }
            nav {
                display: none;
                width: 100%;
                order: 4;
                margin-top: 12px;
            }
            nav.active { display: block; }
            nav ul { flex-direction: column; align-items: stretch; gap: 4px; }
            nav ul li a { padding: 12px 16px; border-radius: 16px; }
            .dropdown-content {
                position: static;
                box-shadow: none;
                display: none;
                padding-left: 16px;
                background: transparent;
                border: none;
            }
            .dropdown:hover .dropdown-content { display: none; }
            .dropdown.active .dropdown-content { display: block; }
            .newsletter-form { flex-direction: column; }
            .newsletter-form button { padding: 16px; }
            .deal-content { padding: 28px 22px; }
            .deal-content h3 { font-size: 1.6rem; }
            .deal-price { font-size: 1.8rem; }
            .timer-box { min-width: 60px; padding: 10px 6px; }
            .timer-box span:first-child { font-size: 1.4rem; }
            .product-img { height: 180px; }
        }

        @media (max-width: 576px) {
            .categories, .products { grid-template-columns: 1fr; }
            .footer-container { grid-template-columns: 1fr; }
            .hero { height: 420px; border-radius: 0 0 28px 28px; }
            .deal-img { height: 240px; }
            .testimonial-card { min-width: 280px; padding: 24px; }
            .container { padding: 0 16px; }
            .section-title h2 { font-size: 1.8rem; }
        }

        /* ---------- ADDED MICRO-INTERACTIONS ---------- */
        .add-to-cart:active {
            transform: scale(0.98);
        }

        .btn:active {
            transform: scale(0.98);
        }

        .category-card:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container header-container">
            <a href="#" class="logo">Nexus<span>Shop</span></a>
            
            <nav id="mainNav">
                <ul>
                    <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li class="dropdown">
                        <a href="#"><i class="fas fa-th-large"></i> Categories <i class="fas fa-chevron-down" style="font-size: 10px;"></i></a>
                        <div class="dropdown-content">
                            <a href="#"><i class="fas fa-mobile-alt"></i> Smartphones</a>
                            <a href="#"><i class="fas fa-laptop"></i> Laptops</a>
                            <a href="#"><i class="fas fa-tshirt"></i> Clothing</a>
                            <a href="#"><i class="fas fa-headphones"></i> Gadgets</a>
                            <a href="#"><i class="fas fa-shoe-prints"></i> Footwear</a>
                            <a href="#"><i class="fas fa-watch"></i> Accessories</a>
                        </div>
                    </li>
                    <li><a href="#"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#"><i class="fas fa-percent"></i> Deals</a></li>
                    <li><a href="#"><i class="fas fa-info-circle"></i> About</a></li>
                    <li><a href="#"><i class="fas fa-envelope"></i> Contact</a></li>
                </ul>
            </nav>
            
            <div class="search-bar">
                <input type="text" placeholder="Search products, brands...">
                <button type="submit"><i class="fas fa-search"></i></button>
            </div>
            
            <div class="header-icons">
                <a href="#" aria-label="Account"><i class="far fa-user"></i></a>
                <a href="#" aria-label="Wishlist"><i class="far fa-heart"></i></a>
                <a href="#" aria-label="Cart"><i class="fas fa-shopping-bag"></i><span class="cart-count">3</span></a>
                <button class="mobile-menu-btn" id="mobileMenuBtn" aria-label="Menu"><i class="fas fa-bars"></i></button>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Winter Collection 2023</h1>
            <p>Discover the latest trends in fashion, technology and accessories with up to 40% off selected items.</p>
            <div class="hero-buttons">
                <a href="#" class="btn btn-primary">Shop Now <i class="fas fa-arrow-right" style="font-size: 13px;"></i></a>
                <a href="#" class="btn btn-secondary">Explore Deals</a>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="container">
        <div class="section-title">
            <h2>Shop by Category</h2>
            <p>Browse through our wide range of products in different categories</p>
        </div>
        
        <div class="categories">
            <div class="category-card">
                <div class="category-icon"><i class="fas fa-mobile-alt"></i></div>
                <h3>Smartphones</h3>
                <p>Latest models from top brands</p>
            </div>
            <div class="category-card">
                <div class="category-icon"><i class="fas fa-laptop"></i></div>
                <h3>Laptops</h3>
                <p>Powerful machines for work & play</p>
            </div>
            <div class="category-card">
                <div class="category-icon"><i class="fas fa-tshirt"></i></div>
                <h3>Clothing</h3>
                <p>Trendy outfits for every occasion</p>
            </div>
            <div class="category-card">
                <div class="category-icon"><i class="fas fa-headphones"></i></div>
                <h3>Gadgets</h3>
                <p>Smart devices for modern life</p>
            </div>
            <div class="category-card">
                <div class="category-icon"><i class="fas fa-shoe-prints"></i></div>
                <h3>Footwear</h3>
                <p>Comfortable & stylish shoes</p>
            </div>
            <div class="category-card">
                <div class="category-icon"><i class="fas fa-watch"></i></div>
                <h3>Accessories</h3>
                <p>Complete your look</p>
            </div>
        </div>
    </section>

    <!-- Trending Products -->
    <section class="container">
        <div class="section-title">
            <h2>Trending Products</h2>
            <p>Discover what's popular right now</p>
        </div>
        
        <div class="products">
            <div class="product-card">
                <span class="product-badge">New</span>
                <img src="https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="iPhone 14 Pro Max" class="product-img">
                <div class="product-info">
                    <h3>iPhone 14 Pro Max</h3>
                    <div class="price">$1,099 <span class="old-price">$1,199</span></div>
                    <div class="rating">★★★★★ <span>(128)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="MacBook Pro 14" class="product-img">
                <div class="product-info">
                    <h3>MacBook Pro 14"</h3>
                    <div class="price">$1,999</div>
                    <div class="rating">★★★★☆ <span>(86)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <span class="product-badge">-25%</span>
                <img src="https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Apple Watch Series 8" class="product-img">
                <div class="product-info">
                    <h3>Apple Watch Series 8</h3>
                    <div class="price">$349 <span class="old-price">$399</span></div>
                    <div class="rating">★★★★★ <span>(214)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1542272604-787c3835535d?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Nike Air Max 270" class="product-img">
                <div class="product-info">
                    <h3>Nike Air Max 270</h3>
                    <div class="price">$150</div>
                    <div class="rating">★★★★☆ <span>(53)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Sony A7 IV Camera" class="product-img">
                <div class="product-info">
                    <h3>Sony A7 IV Camera</h3>
                    <div class="price">$2,499</div>
                    <div class="rating">★★★★★ <span>(42)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <span class="product-badge">Bestseller</span>
                <img src="https://images.unsplash.com/photo-1585386959984-a4155224a1ad?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Chanel No. 5" class="product-img">
                <div class="product-info">
                    <h3>Chanel No. 5</h3>
                    <div class="price">$120</div>
                    <div class="rating">★★★★★ <span>(189)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1551232864-3f0890e580d9?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Travel Backpack" class="product-img">
                <div class="product-info">
                    <h3>Travel Backpack</h3>
                    <div class="price">$79 <span class="old-price">$99</span></div>
                    <div class="rating">★★★★☆ <span>(67)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <div class="product-card">
                <img src="https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Sony WH-1000XM5" class="product-img">
                <div class="product-info">
                    <h3>Sony WH-1000XM5</h3>
                    <div class="price">$399</div>
                    <div class="rating">★★★★★ <span>(156)</span></div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
        </div>
    </section>

    <!-- Deals Section -->
    <section class="deals">
        <div class="container">
            <div class="section-title" style="margin-top: 0;">
                <h2>Flash Sale</h2>
                <p>Limited time offers — don't miss out!</p>
            </div>
            
            <div class="deal-container">
                <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" alt="MacBook Air M2" class="deal-img">
                <div class="deal-content">
                    <h3>MacBook Air M2</h3>
                    <p>The incredibly thin and light MacBook Air with the powerful M2 chip.</p>
                    
                    <div class="deal-timer">
                        <div class="timer-box">
                            <span id="hours">24</span>
                            <span>Hours</span>
                        </div>
                        <div class="timer-box">
                            <span id="minutes">59</span>
                            <span>Minutes</span>
                        </div>
                        <div class="timer-box">
                            <span id="seconds">59</span>
                            <span>Seconds</span>
                        </div>
                    </div>
                    
                    <div class="deal-price">$999 <span class="deal-old-price">$1,199</span> <span class="deal-discount">-17%</span></div>
                    
                    <p style="margin-bottom: 8px;">Only <strong style="color: var(--primary);">12</strong> items left at this price!</p>
                    
                    <button class="btn btn-primary">Buy Now <i class="fas fa-arrow-right" style="font-size: 13px;"></i></button>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="container testimonials">
        <div class="section-title">
            <h2>What Our Customers Say</h2>
            <p>Trusted by thousands of happy customers worldwide</p>
        </div>
        
        <div class="testimonial-slider">
            <div class="testimonial-card">
                <div class="rating">★★★★★</div>
                <p>“I've never had such a smooth shopping experience. The products are top quality and exactly as described. Delivery was super fast too!”</p>
                <div class="user-info">
                    <img src="https://randomuser.me/api/portraits/women/43.jpg" alt="Sarah J." class="user-avatar">
                    <div>
                        <div class="user-name">Sarah J.</div>
                        <div class="user-title">Verified Buyer</div>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <div class="rating">★★★★☆</div>
                <p>“Great selection of products at competitive prices. Customer service was helpful when I had a question about my order.”</p>
                <div class="user-info">
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Michael T." class="user-avatar">
                    <div>
                        <div class="user-name">Michael T.</div>
                        <div class="user-title">Verified Buyer</div>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <div class="rating">★★★★★</div>
                <p>“The flash deals are amazing! I got a brand new laptop for 25% off. Will definitely be shopping here again.”</p>
                <div class="user-info">
                    <img src="https://randomuser.me/api/portraits/women/65.jpg" alt="Emma L." class="user-avatar">
                    <div>
                        <div class="user-name">Emma L.</div>
                        <div class="user-title">Verified Buyer</div>
                    </div>
                </div>
            </div>
            <div class="testimonial-card">
                <div class="rating">★★★★★</div>
                <p>“Fast shipping and excellent packaging. The product exceeded my expectations. Highly recommend this store!”</p>
                <div class="user-info">
                    <img src="https://randomuser.me/api/portraits/men/75.jpg" alt="David K." class="user-avatar">
                    <div>
                        <div class="user-name">David K.</div>
                        <div class="user-title">Verified Buyer</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Newsletter Section -->
    <section class="newsletter">
        <div class="container">
            <h2>Stay Updated</h2>
            <p>Subscribe to our newsletter and get 10% off your first order plus exclusive access to sales and new arrivals.</p>
            <form class="newsletter-form">
                <input type="email" placeholder="Enter your email address" required>
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-container">
                <div class="footer-col">
                    <h3>NexusShop</h3>
                    <p>Your one-stop destination for all the latest products in technology, fashion, and lifestyle.</p>
                    <div class="social-links">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="footer-col">
                    <h3>Shop</h3>
                    <ul>
                        <li><a href="#">All Products</a></li>
                        <li><a href="#">Featured Items</a></li>
                        <li><a href="#">New Arrivals</a></li>
                        <li><a href="#">On Sale</a></li>
                        <li><a href="#">Gift Cards</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h3>Customer Service</h3>
                    <ul>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">FAQs</a></li>
                        <li><a href="#">Shipping Policy</a></li>
                        <li><a href="#">Returns & Exchanges</a></li>
                        <li><a href="#">Track Order</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h3>About</h3>
                    <ul>
                        <li><a href="#">Our Story</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>
                    <div class="payment-methods">
                        <img src="https://cdn-icons-png.flaticon.com/512/196/196578.png" alt="Visa">
                        <img src="https://cdn-icons-png.flaticon.com/512/196/196561.png" alt="Mastercard">
                        <img src="https://cdn-icons-png.flaticon.com/512/196/196566.png" alt="American Express">
                        <img src="https://cdn-icons-png.flaticon.com/512/825/825454.png" alt="PayPal">
                    </div>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>© 2023 NexusShop. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Mobile Menu Toggle
        const mobileMenuBtn = document.getElementById('mobileMenuBtn');
        const mainNav = document.getElementById('mainNav');
        
        mobileMenuBtn.addEventListener('click', () => {
            mainNav.classList.toggle('active');
        });
        
        // Dropdown Toggle for Mobile
        const dropdowns = document.querySelectorAll('.dropdown');
        
        dropdowns.forEach(dropdown => {
            dropdown.addEventListener('click', (e) => {
                if (window.innerWidth <= 768) {
                    e.preventDefault();
                    dropdown.classList.toggle('active');
                }
            });
        });
        
        // Countdown Timer
        function updateCountdown() {
            const now = new Date();
            const endOfDay = new Date();
            endOfDay.setHours(23, 59, 59, 999);
            
            const diff = endOfDay - now;
            
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);
            
            document.getElementById('hours').textContent = String(Math.floor(hours)).padStart(2, '0');
            document.getElementById('minutes').textContent = String(minutes).padStart(2, '0');
            document.getElementById('seconds').textContent = String(seconds).padStart(2, '0');
        }
        
        setInterval(updateCountdown, 1000);
        updateCountdown();
        
        // Add to Cart Animation
        const addToCartButtons = document.querySelectorAll('.add-to-cart');
        const cartCount = document.querySelector('.cart-count');
        
        addToCartButtons.forEach(button => {
            button.addEventListener('click', () => {
                button.textContent = 'Added!';
                button.style.background = 'var(--success)';
                button.style.color = 'white';
                
                const currentCount = parseInt(cartCount.textContent);
                cartCount.textContent = currentCount + 1;
                
                setTimeout(() => {
                    button.textContent = 'Add to Cart';
                    button.style.background = '';
                    button.style.color = '';
                }, 1200);
            });
        });
        
        // Testimonial Slider Drag
        const testimonialSlider = document.querySelector('.testimonial-slider');
        let isDown = false;
        let startX;
        let scrollLeft;
        
        testimonialSlider.addEventListener('mousedown', (e) => {
            isDown = true;
            startX = e.pageX - testimonialSlider.offsetLeft;
            scrollLeft = testimonialSlider.scrollLeft;
        });
        
        testimonialSlider.addEventListener('mouseleave', () => {
            isDown = false;
        });
        
        testimonialSlider.addEventListener('mouseup', () => {
            isDown = false;
        });
        
        testimonialSlider.addEventListener('mousemove', (e) => {
            if(!isDown) return;
            e.preventDefault();
            const x = e.pageX - testimonialSlider.offsetLeft;
            const walk = (x - startX) * 2;
            testimonialSlider.scrollLeft = scrollLeft - walk;
        });
    </script>
</body>
</html>
