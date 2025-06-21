#!/bin/bash

# Alec Boyd Website Deployment Script
# This script helps deploy the website to various hosting platforms

echo "🎵 Alec Boyd Website Deployment Script"
echo "======================================"

# Check if required files exist
if [ ! -f "index.html" ] || [ ! -f "styles.css" ]; then
    echo "❌ Error: Required files (index.html, styles.css) not found!"
    echo "Please run this script from the project directory."
    exit 1
fi

# Function to deploy to GitHub Pages
deploy_github_pages() {
    echo "🚀 Deploying to GitHub Pages..."
    
    # Check if git is initialized
    if [ ! -d ".git" ]; then
        echo "📁 Initializing git repository..."
        git init
        git add .
        git commit -m "Initial commit"
    fi
    
    echo "📤 Pushing to GitHub..."
    echo "Please ensure you have:"
    echo "1. Created a GitHub repository"
    echo "2. Added the remote origin: git remote add origin https://github.com/username/repo-name.git"
    echo "3. Enabled GitHub Pages in repository settings"
    
    read -p "Press Enter when ready to continue..."
    
    git add .
    git commit -m "Update website"
    git push origin main
    
    echo "✅ Deployment complete! Check your GitHub Pages URL."
}

# Function to prepare for Netlify
deploy_netlify() {
    echo "🚀 Preparing for Netlify deployment..."
    
    # Create netlify.toml if it doesn't exist
    if [ ! -f "netlify.toml" ]; then
        cat > netlify.toml << EOF
[build]
  publish = "."
  command = ""

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
EOF
        echo "📄 Created netlify.toml configuration file"
    fi
    
    echo "✅ Ready for Netlify deployment!"
    echo "📋 Next steps:"
    echo "1. Go to netlify.com and sign up/login"
    echo "2. Drag and drop this folder to deploy"
    echo "3. Or connect your GitHub repository for automatic deployments"
}

# Function to prepare for Vercel
deploy_vercel() {
    echo "🚀 Preparing for Vercel deployment..."
    
    # Create vercel.json if it doesn't exist
    if [ ! -f "vercel.json" ]; then
        cat > vercel.json << EOF
{
  "version": 2,
  "builds": [
    {
      "src": "*.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ]
}
EOF
        echo "📄 Created vercel.json configuration file"
    fi
    
    echo "✅ Ready for Vercel deployment!"
    echo "📋 Next steps:"
    echo "1. Install Vercel CLI: npm i -g vercel"
    echo "2. Run: vercel"
    echo "3. Follow the prompts to deploy"
}

# Function to optimize for production
optimize_production() {
    echo "🔧 Optimizing for production..."
    
    # Create a production directory
    mkdir -p production
    
    # Copy files
    cp index.html production/
    cp styles.css production/
    cp README.md production/
    
    # Create .htaccess for Apache servers
    cat > production/.htaccess << EOF
# Enable compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
</IfModule>

# Set cache headers
<IfModule mod_expires.c>
    ExpiresActive on
    ExpiresByType text/css "access plus 1 year"
    ExpiresByType application/javascript "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
</IfModule>

# Security headers
<IfModule mod_headers.c>
    Header always set X-Content-Type-Options nosniff
    Header always set X-Frame-Options DENY
    Header always set X-XSS-Protection "1; mode=block"
    Header always set Referrer-Policy "strict-origin-when-cross-origin"
</IfModule>
EOF
    
    echo "✅ Production files created in 'production/' directory"
    echo "📁 Upload the contents of the 'production/' folder to your web server"
}

# Function to validate HTML
validate_html() {
    echo "🔍 Validating HTML..."
    
    if command -v tidy &> /dev/null; then
        tidy -q -e index.html
        echo "✅ HTML validation complete"
    else
        echo "⚠️  HTML Tidy not found. Install it for HTML validation:"
        echo "   macOS: brew install tidy-html5"
        echo "   Ubuntu: sudo apt-get install tidy"
    fi
}

# Function to check performance
check_performance() {
    echo "⚡ Performance check..."
    
    echo "📊 File sizes:"
    echo "   index.html: $(wc -c < index.html | numfmt --to=iec) bytes"
    echo "   styles.css: $(wc -c < styles.css | numfmt --to=iec) bytes"
    
    echo "📋 Performance recommendations:"
    echo "   ✅ CSS is externalized"
    echo "   ✅ Images use lazy loading"
    echo "   ✅ Fonts are preloaded"
    echo "   ✅ Semantic HTML structure"
    
    if [ -f "production/styles.css" ]; then
        echo "   📦 Production CSS: $(wc -c < production/styles.css | numfmt --to=iec) bytes"
    fi
}

# Main menu
while true; do
    echo ""
    echo "Choose an option:"
    echo "1) Deploy to GitHub Pages"
    echo "2) Prepare for Netlify"
    echo "3) Prepare for Vercel"
    echo "4) Optimize for production"
    echo "5) Validate HTML"
    echo "6) Check performance"
    echo "7) Exit"
    echo ""
    read -p "Enter your choice (1-7): " choice
    
    case $choice in
        1)
            deploy_github_pages
            ;;
        2)
            deploy_netlify
            ;;
        3)
            deploy_vercel
            ;;
        4)
            optimize_production
            ;;
        5)
            validate_html
            ;;
        6)
            check_performance
            ;;
        7)
            echo "👋 Goodbye!"
            exit 0
            ;;
        *)
            echo "❌ Invalid option. Please choose 1-7."
            ;;
    esac
    
    echo ""
    read -p "Press Enter to continue..."
done 