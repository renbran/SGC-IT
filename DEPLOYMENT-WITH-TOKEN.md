# 🚀 Deploy to doc.sgctech.ai - Token Authentication Required

## ⚠️ Current Status
Your changes are committed locally and ready to deploy, but you need to provide GitHub authentication.

The credential manager has cached the wrong GitHub account (scholarixglobal-ctrl instead of renbran).

## 🔑 Step-by-Step Authentication

### Step 1: Generate a GitHub Personal Access Token
1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Set the name: `SGC-IT Deploy Token`
4. Check the **`repo`** scope (full control of private repos)
5. Click **"Generate token"**
6. **COPY THE TOKEN** (you'll only see it once!)

Your token will look like: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

### Step 2: Clear Old Credentials (Windows)

Windows Credential Manager stores your Git credentials. We need to remove the old one:

#### Option A: Via GUI (Easiest)
1. Press **Windows Key + R**
2. Type: `credential` and press Enter
3. Click **"Manage credentials"**
4. Click **"Windows Credentials"**
5. Find entry like: `git:https://github.com` or `github.com`
6. Click it and select **"Remove"**
7. Close the window

#### Option B: Via PowerShell
```powershell
# Remove the cached GitHub credential
cmdkey /delete:git:https://github.com
```

### Step 3: Configure Git with Your Token

Replace `<YOUR-TOKEN>` with the token from Step 1:

```bash
cd d:\Downloader\DATA_FILES\github\SGC-IT
git remote set-url origin https://<YOUR-TOKEN>@github.com/renbran/SGC-IT.git
```

**Example** (don't use this exact token):
```bash
git remote set-url origin https://ghp_a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6@github.com/renbran/SGC-IT.git
```

### Step 4: Push to Deploy

```bash
git push origin main
```

### Step 5: Verify Deployment (2-5 minutes)

Check both URLs:
- **GitHub Pages:** https://renbran.github.io/SGC-IT/lead-scoring.html
- **Cloudflare Pages:** https://doc.sgctech.ai/lead-scoring.html

---

## ✅ What Gets Deployed

All your changes including:
- ✅ lead-scoring.html (35.7 KB)
- ✅ index.html (with menu updates)
- ✅ All documentation files
- ✅ Deployment guides

---

## 🎯 Timeline

1. Get token: **1 minute**
2. Clear credentials: **1 minute**  
3. Configure: **< 1 minute**
4. Push: **< 1 minute**
5. Deploy: **2-5 minutes total**

**Total: ~5-10 minutes to LIVE**

---

## 📋 Current Git Status

```
Branch: main
Ahead by: 1 commit
Ready to push: YES
Files staged: ✅
Commit message: docs: Add comprehensive deployment documentation and guides
```

---

## 🚨 Troubleshooting

### "Permission denied to scholarixglobal-ctrl"
- Old credentials are cached
- Follow Step 2 to clear them
- Or use Step 3 token method

### "Invalid token"
- Make sure you copied the ENTIRE token
- Check you're not missing any characters
- Generate a new token if uncertain

### "fatal: could not resolve host"
- Check your internet connection
- Verify you can access github.com in browser

---

## 🔒 Security Note

⚠️ **The token in your git remote URL is visible to anyone with access to this computer.**

For production use, consider:
- Using SSH keys instead (more secure)
- Using GitHub CLI (handles tokens automatically)
- Using temporary tokens with short expiration dates

---

## Need Help?

Once your changes are live on doc.sgctech.ai:

1. **Sales team access:**
   Send them: https://doc.sgctech.ai/lead-scoring.html

2. **Implementation guide:**
   Send them: LEAD-SCORING-QUICK-START.md

3. **Monitor deployment:**
   Go to: https://github.com/renbran/SGC-IT/actions

---

**Ready?** Follow Steps 1-4 above and your site will be live in 5-10 minutes!
