# 🚀 Cloudflare Wrangler Deployment Plan - doc.sgctech.ai

**Status:** 📋 READY FOR EXECUTION
**Date:** December 16, 2025
**Target:** Cloudflare Pages with Wrangler CLI
**Subdomain:** doc.sgctech.ai
**Repository:** github.com/renbran/SGC-IT

---

## 📋 Deployment Overview

### What We're Deploying
- Complete SGC-IT documentation hub
- Business Card V2 with neural theme
- Company Profile 2025
- All supporting documentation

### Deployment Destination
- **Domain:** sgctech.ai
- **Subdomain:** doc.sgctech.ai
- **Platform:** Cloudflare Pages
- **Method:** Wrangler CLI

### Project Status
✅ GitHub Push: Complete (deployment hash: f9dacc3)
✅ GitHub Pages: Live at https://renbran.github.io/SGC-IT/
✅ Git Status: Clean, all changes committed
⏳ Cloudflare Pages: Ready to deploy

---

## 🔧 Pre-Deployment Checklist

- [x] All changes committed to git
- [x] GitHub Pages deployment active
- [x] wrangler.toml exists in repo
- [x] deployment-info.json configured
- [x] Cloudflare account access ready
- [ ] Domain ownership verified in Cloudflare
- [ ] API token generated for Wrangler
- [ ] Subdomain created in Cloudflare DNS
- [ ] Wrangler CLI authenticated

---

## 📦 Step 1: Verify Wrangler Installation & Authentication

```bash
# Check Wrangler version
wrangler --version

# Login to Cloudflare
wrangler login

# This will open browser to authenticate
# Required permissions:
# - Account Read
# - Workers Routes (Edit)
# - Pages (Edit)
# - DNS (Manage)
```

**Expected Output:**
```
✓ Successfully authenticated with Cloudflare!
```

---

## 🌐 Step 2: Create DNS Subdomain

**Method A: Via Cloudflare Dashboard**
1. Go to: https://dash.cloudflare.com/
2. Select domain: sgctech.ai
3. Go to: DNS → Records
4. Click: "+ Add Record"
5. Configure:
   - Type: CNAME
   - Name: doc
   - Content: (will be provided by Wrangler)
   - TTL: Auto
6. Click: "Save"

**Method B: Via Wrangler (Automatic)**
Wrangler can create the DNS record automatically during deployment if you configure the routes properly.

**Method C: Via Cloudflare API**
```bash
# Using curl (requires API token)
curl -X POST "https://api.cloudflare.com/client/v4/zones/{zone_id}/dns_records" \
  -H "Authorization: Bearer {api_token}" \
  -d '{"type":"CNAME","name":"doc","content":"sgctech.ai","ttl":3600}'
```

---

## 📝 Step 3: Update Wrangler Configuration

Create/Update `wrangler.toml` with doc.sgctech.ai configuration:

```toml
name = "sgc-it-documentation"
compatibility_date = "2024-12-16"
type = "javascript"

# Main production deployment
[env.production]
name = "sgc-it-docs-prod"
routes = [
  { pattern = "doc.sgctech.ai/*", zone_name = "sgctech.ai" }
]
build = { command = "" }

# Staging environment
[env.staging]
name = "sgc-it-docs-staging"
routes = [
  { pattern = "docs-staging.sgctech.ai/*", zone_name = "sgctech.ai" }
]

# Environment variables
[vars]
ENVIRONMENT = "production"
DOMAIN = "doc.sgctech.ai"
API_URL = "https://doc.sgctech.ai"

# Analytics
[analytics]
enabled = true

# Performance settings
[env.production.limits]
cpu_ms = 50

# Cache configuration
[env.production.cache]
default_ttl = 3600
browser_cache_ttl = 3600
```

**Save to:** `d:/it-doc/SGC-IT/wrangler.toml`

---

## 🚀 Step 4: Deploy to Cloudflare Pages

### Option A: Direct Wrangler Deployment

```bash
cd d:/it-doc/SGC-IT

# Deploy to production
wrangler pages deploy . --project-name sgc-it-docs --branch main --env production

# Expected output:
# ✓ Uploading... (progress bar)
# ✓ Upload complete
# ✓ Deployment ID: ...
# ✓ URL: https://doc.sgctech.ai/
```

### Option B: GitHub Integration (Automatic)

1. Go to Cloudflare Dashboard
2. Pages section → Create project
3. Select: GitHub repository (renbran/SGC-IT)
4. Configure:
   - Build command: (leave empty - static site)
   - Build output directory: ./
   - Environment variables:
     - DOMAIN = doc.sgctech.ai
     - ENVIRONMENT = production
5. Click: Deploy site
6. Cloudflare auto-deploys on each git push

**Recommended:** Use GitHub integration for automatic deployments

---

## 🔐 Step 5: Configure Cloudflare Settings

### Security Settings
```
1. SSL/TLS:
   - Mode: Full (strict)
   - Minimum TLS Version: 1.2

2. Page Rules:
   - Cache Level: Cache Everything
   - Browser Cache TTL: 30 days (for static assets)
   - Edge Cache TTL: 1 month

3. WAF Rules:
   - Enable: Basic protection
   - Allow: All static file types

4. Redirect Rules:
   - HTTP → HTTPS (automatic)
   - doc.sgctech.ai → Always HTTPS
```

### Performance Settings
```
1. HTTP/2:
   - Enabled ✓

2. GZIP Compression:
   - Enabled ✓

3. Brotli:
   - Enabled ✓

4. Minification:
   - Minify HTML ✓
   - Minify CSS ✓
   - Minify JavaScript ✓
```

### Analytics & Monitoring
```
1. Enable:
   - Web Analytics
   - Performance Metrics
   - Error Tracking

2. Create alerts for:
   - High error rate (>5%)
   - High latency (>2s)
   - Deployment failures
```

---

## ✅ Step 6: Verify Deployment

### DNS Verification
```bash
# Check DNS propagation
nslookup doc.sgctech.ai
# or
dig doc.sgctech.ai

# Expected:
# Non-authoritative answer:
# doc.sgctech.ai  canonical name = sgctech.ai
# sgctech.ai  A record = 104.x.x.x (Cloudflare IP)
```

### SSL Certificate Verification
```bash
# Check SSL certificate
curl -I https://doc.sgctech.ai/

# Expected headers:
# HTTP/2 200
# server: cloudflare
# content-type: text/html; charset=utf-8
```

### Content Verification
```bash
# Test homepage
curl https://doc.sgctech.ai/ | head -20

# Test specific file
curl https://doc.sgctech.ai/business-card-v2.html | head -10

# Should return HTML content
```

### Functional Testing
1. **Homepage:** https://doc.sgctech.ai/
   - [ ] Loads correctly
   - [ ] Navigation visible
   - [ ] All styles applied

2. **Business Card V2:** https://doc.sgctech.ai/business-card-v2.html
   - [ ] Card displays
   - [ ] Print button works
   - [ ] QR code visible
   - [ ] Icons render

3. **Company Profile:** https://doc.sgctech.ai/SGC%20TECH%20AI%20COMPANY%20PROFILE%202025.html
   - [ ] Profile loads
   - [ ] Print button visible
   - [ ] All sections accessible

4. **Navigation:**
   - [ ] Navigation tabs work
   - [ ] Links functional
   - [ ] Smooth scrolling works

---

## 📊 Step 7: Monitor Performance

### Key Metrics to Track
```
1. Page Load Time:
   - Target: < 2 seconds
   - Actual: [measure after deployment]

2. Largest Contentful Paint (LCP):
   - Target: < 2.5 seconds
   - Actual: [measure after deployment]

3. Cumulative Layout Shift (CLS):
   - Target: < 0.1
   - Actual: [measure after deployment]

4. Time to First Byte (TTFB):
   - Target: < 600ms
   - Actual: [measure after deployment]

5. Cache Hit Ratio:
   - Target: > 80%
   - Actual: [measure after deployment]
```

### Monitoring Tools
1. **Cloudflare Analytics:** https://dash.cloudflare.com/ → Analytics
2. **Google PageSpeed Insights:** https://pagespeed.web.dev/
3. **Lighthouse:** Built-in to Chrome DevTools
4. **GTmetrix:** https://gtmetrix.com/

---

## 🔄 Step 8: Set Up Automatic Deployments

### GitHub Actions Integration

Create `.github/workflows/deploy-cloudflare.yml`:

```yaml
name: Deploy to Cloudflare Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  deploy:
    name: Deploy to Cloudflare Pages
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      
      - name: Install Wrangler
        run: npm install -g wrangler
      
      - name: Deploy
        env:
          CLOUDFLARE_API_TOKEN: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          CLOUDFLARE_ACCOUNT_ID: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
        run: |
          wrangler pages deploy . \
            --project-name sgc-it-docs \
            --branch main \
            --commit-message "Deploy: ${{ github.event.head_commit.message }}"
      
      - name: Notify Success
        run: echo "✓ Deployment to doc.sgctech.ai successful!"
```

### Required Secrets
Add to GitHub repository settings:
1. **CLOUDFLARE_API_TOKEN**
   - Get from: Cloudflare Dashboard → My Profile → API Tokens
   - Scope: Pages, Workers Routes, DNS

2. **CLOUDFLARE_ACCOUNT_ID**
   - Get from: Cloudflare Dashboard → Overview → Account ID

---

## 📈 Step 9: Set Up Redirects & Rewrites

Create `_redirects` file for URL rewrites:

```
# Redirect old business card URLs
/business-card       /business-card-v2.html
/card                /business-card-v2.html

# Redirect documentation
/docs                /
/documentation       /
/help                /

# Redirect company profile
/profile             /SGC%20TECH%20AI%20COMPANY%20PROFILE%202025.html
/company             /SGC%20TECH%20AI%20COMPANY%20PROFILE%202025.html

# Security headers
/*                   200

# SPA fallback
/index.html          200
```

Create `_headers` file for headers:

```
# Security headers
/*
  X-Content-Type-Options: nosniff
  X-Frame-Options: SAMEORIGIN
  X-XSS-Protection: 1; mode=block
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: geolocation=(), microphone=(), camera=()

# Cache headers
/index.html
  Cache-Control: max-age=3600, must-revalidate
  
/*.html
  Cache-Control: max-age=3600, must-revalidate

/*.js
/*.css
/*.svg
/*.png
/*.jpg
  Cache-Control: max-age=31536000, immutable

# CORS headers
/api/*
  Access-Control-Allow-Origin: *
  Access-Control-Allow-Methods: GET, OPTIONS
```

---

## 🎯 Deployment Commands Summary

### Quick Deployment
```bash
cd d:/it-doc/SGC-IT

# 1. Update wrangler.toml
# 2. Authenticate with Cloudflare
wrangler login

# 3. Deploy to Cloudflare Pages
wrangler pages deploy . \
  --project-name sgc-it-docs \
  --branch main \
  --env production

# 4. Verify deployment
curl https://doc.sgctech.ai/

# 5. Check status
wrangler pages list --project-name sgc-it-docs
```

### Full Deployment with Verification
```bash
#!/bin/bash

echo "🚀 Starting Cloudflare deployment..."

cd d:/it-doc/SGC-IT

# 1. Check git status
echo "✓ Git status:"
git status

# 2. Login to Cloudflare
echo "✓ Logging in to Cloudflare..."
wrangler login

# 3. Deploy to Cloudflare Pages
echo "✓ Deploying to Cloudflare Pages..."
DEPLOY_ID=$(wrangler pages deploy . \
  --project-name sgc-it-docs \
  --branch main \
  --env production | grep "Deployment ID" | awk '{print $NF}')

echo "✓ Deployment ID: $DEPLOY_ID"

# 4. Wait for DNS propagation (30 seconds)
echo "✓ Waiting for DNS propagation..."
sleep 30

# 5. Test deployment
echo "✓ Testing deployment..."
curl -I https://doc.sgctech.ai/

# 6. Final verification
echo "✓ Testing specific routes..."
curl -I https://doc.sgctech.ai/business-card-v2.html
curl -I https://doc.sgctech.ai/index.html

echo "🎉 Deployment complete!"
```

---

## 📊 Comparison: GitHub Pages vs Cloudflare

| Feature | GitHub Pages | Cloudflare Pages |
|---------|-------------|-----------------|
| **URL** | renbran.github.io/SGC-IT | doc.sgctech.ai |
| **Deploy Time** | 1-2 minutes | ~30 seconds |
| **Custom Domain** | Limited | Full support |
| **SSL/TLS** | Free | Free (Advanced options) |
| **CDN** | GitHub CDN | Cloudflare Global CDN |
| **Performance** | Good | Excellent |
| **Analytics** | Basic | Advanced |
| **Cache Control** | Limited | Full control |
| **Auto Deploy** | Git push | Git push (with GitHub Actions) |
| **Cost** | Free | Free (with optional paid features) |

---

## ✨ Post-Deployment Checklist

- [ ] DNS subdomain created (doc.sgctech.ai)
- [ ] Cloudflare Pages project created
- [ ] Wrangler authentication successful
- [ ] Deployment completed without errors
- [ ] SSL certificate issued and valid
- [ ] Homepage accessible at doc.sgctech.ai
- [ ] All pages loading correctly
- [ ] Navigation functional
- [ ] Print functionality working
- [ ] QR codes generating
- [ ] Mobile responsive verified
- [ ] Performance metrics acceptable
- [ ] Analytics enabled
- [ ] Auto-deployment configured
- [ ] Alerts set up
- [ ] Team notified of new URL

---

## 🎯 Success Criteria

✅ **Deployment Successful When:**
1. Site accessible at https://doc.sgctech.ai/
2. All pages loading (status 200)
3. SSL certificate valid (HTTPS working)
4. Performance acceptable (< 2s load time)
5. Navigation functional
6. Mobile responsive
7. Print functionality working
8. Analytics showing traffic
9. DNS propagated globally
10. Team can access and use

---

## 📞 Troubleshooting Guide

### Issue: "Subdomain not found"
**Solution:**
1. Wait 24-48 hours for DNS propagation
2. Verify DNS record in Cloudflare dashboard
3. Use `nslookup doc.sgctech.ai` to check
4. Clear browser cache (Ctrl+Shift+R)

### Issue: "SSL certificate error"
**Solution:**
1. Cloudflare issues certificate automatically
2. Wait 15 minutes for issuance
3. Check certificate in Cloudflare dashboard
4. Force HTTPS redirect if not automatic

### Issue: "Pages not loading"
**Solution:**
1. Verify files were deployed (check Cloudflare Pages dashboard)
2. Check for 404 errors in Cloudflare Analytics
3. Verify file paths are correct
4. Check _redirects file syntax

### Issue: "Deployment failed in Wrangler"
**Solution:**
1. Check Cloudflare API token validity
2. Verify account ID is correct
3. Ensure project name matches
4. Run `wrangler pages list` to see projects

---

## 📚 Next Steps After Deployment

1. **Update Documentation**
   - Add doc.sgctech.ai to all guides
   - Update links in README.md
   - Publish deployment announcement

2. **Monitor Performance**
   - Set up alerts in Cloudflare
   - Check analytics weekly
   - Optimize based on metrics

3. **Configure Auto-Deployments**
   - Set up GitHub Actions workflow
   - Test automatic deployment on git push
   - Configure alerts for failures

4. **User Communication**
   - Share new URL with team
   - Update email signatures
   - Add to business card

5. **Backup & Maintenance**
   - Keep GitHub as source of truth
   - Regular backups
   - Monitor uptime

---

## 📋 Final Deployment Summary

| Item | Status |
|------|--------|
| GitHub Deployment | ✅ Complete |
| Files Pushed | ✅ 11 files |
| Git Commit | ✅ Hash: f9dacc3 |
| GitHub Pages URL | ✅ renbran.github.io/SGC-IT |
| Cloudflare Config | 📋 Ready to execute |
| Subdomain | 📋 doc.sgctech.ai |
| Wrangler Ready | 📋 Awaiting execution |
| DNS Config | 📋 Ready to configure |
| Deployment Guide | ✅ Complete |

---

## 🚀 Ready to Deploy to Cloudflare

**Status:** All prerequisites complete. Ready to execute Cloudflare deployment.

**Recommended Execution Order:**
1. Update wrangler.toml with doc.sgctech.ai config
2. Run `wrangler login`
3. Create DNS record in Cloudflare
4. Run `wrangler pages deploy`
5. Verify deployment
6. Set up GitHub Actions
7. Monitor performance

**Time to Complete:** ~15 minutes total

---

*Cloudflare Deployment Plan | SGC-IT Project*
*December 16, 2025 | doc.sgctech.ai*
*Status: 📋 READY FOR EXECUTION*
