# Scholarix Business Card Designer - Cloudflare Deployment

## 🚀 Deployment Instructions for scholarixstudy.com

### Option 1: Cloudflare Pages (Recommended)

#### Prerequisites:
- Cloudflare account with domain management for scholarixstudy.com
- Git repository access (GitHub/GitLab)

#### Step-by-Step Deployment:

1. **Connect Repository to Cloudflare Pages:**
   ```bash
   # Login to Cloudflare Dashboard
   # Go to Pages → Create a project → Connect to Git
   # Select this repository: renbran/SGC-IT
   ```

2. **Configure Build Settings:**
   - **Project name:** `scholarix-business-card`
   - **Production branch:** `main`
   - **Build command:** *(leave empty - static site)*
   - **Build output directory:** `./`
   - **Root directory:** `./`

3. **Custom Domain Setup:**
   ```bash
   # In Cloudflare Pages project settings:
   # Custom domains → Add custom domain
   # Enter: business-card.scholarixstudy.com
   # Or: scholarixstudy.com/business-card
   ```

4. **DNS Configuration:**
   ```
   # Add CNAME record in Cloudflare DNS:
   Name: business-card
   Type: CNAME
   Content: scholarix-business-card.pages.dev
   Proxy: Enabled (Orange cloud)
   ```

### Option 2: Cloudflare Workers (Alternative)

#### Install Wrangler CLI:
```bash
npm install -g wrangler
wrangler login
```

#### Deploy to Workers:
```bash
# From project directory
wrangler pages publish . --project-name=scholarix-business-card
```

### Option 3: Manual File Upload

#### Using Cloudflare Dashboard:
1. Go to **Websites** → **scholarixstudy.com**
2. Navigate to **Rules** → **Page Rules** or **Workers Routes**
3. Upload files directly via File Manager

---

## 🌐 Expected URLs After Deployment:

- **Primary:** `https://business-card.scholarixstudy.com`
- **Alternative:** `https://scholarixstudy.com/business-card`
- **Direct:** `https://scholarixstudy.com/index-simple.html`

---

## 📋 Files Included in Deployment:

- ✅ `index.html` - Navigation hub
- ✅ `index-simple.html` - Business card designer (main app)
- ✅ `test.html` - Test page
- ✅ `wrangler.toml` - Cloudflare Workers configuration
- ✅ `_headers` - Security headers and caching rules
- ✅ `_redirects` - URL redirects configuration

---

## 🔧 Configuration Files Created:

### `wrangler.toml`
- Production/staging environment setup
- Custom domain routing
- Build configuration

### `_headers`
- Security headers (CSP, XSS protection)
- Cache control for static assets
- Performance optimization

### `_redirects`
- SEO-friendly URL redirects
- Legacy path compatibility
- User-friendly routes

---

## 🚦 Deployment Status Checks:

After deployment, verify:
- [ ] Site loads at custom domain
- [ ] Business card designer functions correctly
- [ ] PDF download works
- [ ] Form submissions work
- [ ] Mobile responsiveness
- [ ] Social media links functional
- [ ] QR code generation working

---

## 🔄 Continuous Deployment:

Once connected to Cloudflare Pages:
1. Any push to `main` branch automatically deploys
2. Preview deployments for pull requests
3. Rollback functionality available
4. Build logs and monitoring

---

## 🛠️ Troubleshooting:

**Common Issues:**
- **404 errors:** Check `_redirects` file configuration
- **CSP violations:** Adjust Content-Security-Policy in `_headers`
- **Build failures:** Ensure all files committed to repository
- **Domain issues:** Verify DNS settings in Cloudflare

**Support:**
- Cloudflare Pages Documentation
- Cloudflare Community Forums
- Repository Issues