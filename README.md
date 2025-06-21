# Alec Boyd - Music Producer Website

A modern, responsive website for Alec Boyd, a professional music producer, engineer, and songwriter. Built with HTML5, CSS3, and vanilla JavaScript following web development best practices.

## 🎵 Features

- **Responsive Design**: Mobile-first approach that works on all devices
- **Modern UI/UX**: Clean, professional design with smooth animations
- **Accessibility**: WCAG compliant with proper ARIA labels and keyboard navigation
- **Performance Optimized**: Fast loading with optimized images and CSS
- **SEO Ready**: Proper meta tags, structured data, and semantic HTML
- **Contact Form**: Integrated with Formspree for easy form handling
- **Smooth Animations**: Subtle animations that enhance user experience

## 🚀 Quick Start

1. **Clone or download** the project files
2. **Open `index.html`** in your web browser to view locally
3. **Customize** the content, images, and styling to match your needs
4. **Deploy** to your preferred hosting service

## 📁 Project Structure

```
alb-website/
├── index.html          # Main HTML file
├── styles.css          # CSS styles and animations
├── README.md           # Project documentation
└── assets/             # Images and other assets (create as needed)
    ├── images/
    ├── favicon/
    └── icons/
```

## 🎨 Customization

### Colors
The color scheme is defined using CSS custom properties in `styles.css`:

```css
:root {
  --color-primary: #1a1a1a;
  --color-secondary: #f8f9fa;
  --color-accent: #007bff;
  --color-text: #333;
  --color-text-light: #666;
  --color-white: #fff;
}
```

### Typography
The website uses Montserrat font family with responsive sizing:

```css
:root {
  --font-family-primary: 'Montserrat', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --font-size-h1: clamp(2.5rem, 8vw, 4rem);
  --font-size-h2: clamp(1.5rem, 4vw, 2rem);
}
```

### Content Updates
1. **Hero Section**: Update the title, subtitle, and background image
2. **About Section**: Modify the description and add your photo
3. **Portfolio**: Replace placeholder images with actual project images
4. **Services**: Customize service descriptions and icons
5. **Contact**: Update the Formspree form ID

## 🌐 Deployment Options

### Option 1: GitHub Pages (Free)
1. Create a GitHub repository
2. Upload your files
3. Go to Settings > Pages
4. Select source branch (usually `main`)
5. Your site will be available at `https://username.github.io/repository-name`

### Option 2: Netlify (Free tier)
1. Sign up at [netlify.com](https://netlify.com)
2. Drag and drop your project folder
3. Get a custom domain or use the provided subdomain

### Option 3: Vercel (Free tier)
1. Sign up at [vercel.com](https://vercel.com)
2. Connect your GitHub repository
3. Deploy automatically on every push

### Option 4: Traditional Web Hosting
Upload files to your web hosting provider via FTP or file manager.

## 📧 Contact Form Setup

The contact form uses Formspree for handling submissions:

1. Sign up at [formspree.io](https://formspree.io)
2. Create a new form
3. Replace `your-form-id` in the form action URL:
   ```html
   <form action="https://formspree.io/f/YOUR-ACTUAL-FORM-ID" method="POST">
   ```

## 🔧 Performance Optimizations

- **Image Optimization**: Use WebP format and appropriate sizes
- **Lazy Loading**: Images load as they come into view
- **CSS Optimization**: Minified CSS for production
- **Font Loading**: Preloaded critical fonts
- **Caching**: Proper cache headers for static assets

## ♿ Accessibility Features

- Semantic HTML structure
- ARIA labels and roles
- Keyboard navigation support
- Focus indicators
- Skip to main content link
- Reduced motion support
- Screen reader friendly

## 📱 Responsive Breakpoints

- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px

## 🛠️ Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers

## 📈 SEO Features

- Meta description and keywords
- Open Graph tags for social sharing
- Twitter Card support
- Structured data markup
- Semantic HTML
- Fast loading times

## 🔄 Future Enhancements

- Blog section for music production tips
- Audio player for portfolio samples
- Booking calendar integration
- Testimonials section
- Newsletter signup
- Dark mode toggle

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

---

**Built with ❤️ for the music community** 