#!/bin/bash

# =====================================================
# SCHOLARIX BUSINESS CARD - SYSTEMATIC DEPLOYMENT
# =====================================================

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
PROJECT_NAME="scholarix-business-card"
DOMAIN="scholarixstudy.com"
SUBDOMAIN="business-card"
FULL_DOMAIN="${SUBDOMAIN}.${DOMAIN}"
REPO_URL="https://github.com/renbran/SGC-IT.git"

echo -e "${BLUE}🚀 SCHOLARIX BUSINESS CARD - SYSTEMATIC DEPLOYMENT${NC}"
echo -e "${BLUE}=================================================${NC}"
echo ""

# Step 1: Environment Check
echo -e "${YELLOW}📋 Step 1: Environment Check${NC}"
echo "Checking prerequisites..."

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed${NC}"
    exit 1
fi

# Check if node/npm is available (for wrangler)
if ! command -v npm &> /dev/null; then
    echo -e "${YELLOW}⚠️ Node.js/npm not found. Installing Wrangler globally recommended.${NC}"
else
    echo -e "${GREEN}✅ Node.js/npm found${NC}"
fi

echo -e "${GREEN}✅ Environment check completed${NC}"
echo ""

# Step 2: Repository Verification
echo -e "${YELLOW}📋 Step 2: Repository Verification${NC}"
echo "Verifying repository status..."

if [ -d ".git" ]; then
    echo -e "${GREEN}✅ Git repository detected${NC}"
    
    # Check if we're on main branch
    CURRENT_BRANCH=$(git branch --show-current)
    if [ "$CURRENT_BRANCH" != "main" ]; then
        echo -e "${YELLOW}⚠️ Currently on branch: $CURRENT_BRANCH${NC}"
        echo -e "${YELLOW}Switching to main branch...${NC}"
        git checkout main
    fi
    
    # Pull latest changes
    echo "Pulling latest changes..."
    git pull origin main
    
    echo -e "${GREEN}✅ Repository is up to date${NC}"
else
    echo -e "${RED}❌ Not a git repository${NC}"
    exit 1
fi
echo ""

# Step 3: File Verification
echo -e "${YELLOW}📋 Step 3: File Verification${NC}"
echo "Checking required files..."

REQUIRED_FILES=(
    "index.html"
    "index-simple.html"
    "wrangler.toml"
    "_headers"
    "_redirects"
    "DEPLOYMENT.md"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✅ $file${NC}"
    else
        echo -e "${RED}❌ $file (missing)${NC}"
        exit 1
    fi
done

echo -e "${GREEN}✅ All required files present${NC}"
echo ""

# Step 4: Build Verification
echo -e "${YELLOW}📋 Step 4: Build Verification${NC}"
echo "Verifying HTML files..."

# Check if main HTML files are valid
if grep -q "<!DOCTYPE html>" index.html && grep -q "<!DOCTYPE html>" index-simple.html; then
    echo -e "${GREEN}✅ HTML files are valid${NC}"
else
    echo -e "${RED}❌ HTML files may be corrupted${NC}"
    exit 1
fi

# Check if JavaScript libraries are referenced
if grep -q "html2canvas" index-simple.html && grep -q "jspdf" index-simple.html; then
    echo -e "${GREEN}✅ Required JavaScript libraries referenced${NC}"
else
    echo -e "${YELLOW}⚠️ Some JavaScript libraries may be missing${NC}"
fi

echo ""

# Step 5: Cloudflare Configuration
echo -e "${YELLOW}📋 Step 5: Cloudflare Configuration${NC}"
echo "Generating deployment configuration..."

# Create production deployment info
cat > deployment-info.json << EOF
{
    "project": "$PROJECT_NAME",
    "domain": "$FULL_DOMAIN",
    "repository": "$REPO_URL",
    "branch": "main",
    "framework": "static",
    "buildCommand": "",
    "buildOutput": "./",
    "deploymentDate": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
    "version": "$(git rev-parse --short HEAD)",
    "features": [
        "Business Card Designer",
        "PDF Generation",
        "QR Code Generation",
        "Responsive Design",
        "Progressive Forms",
        "Social Media Integration"
    ]
}
EOF

echo -e "${GREEN}✅ Deployment configuration generated${NC}"
echo ""

# Step 6: Security Check
echo -e "${YELLOW}📋 Step 6: Security Check${NC}"
echo "Verifying security configurations..."

# Check _headers file
if grep -q "X-Frame-Options" _headers && grep -q "Content-Security-Policy" _headers; then
    echo -e "${GREEN}✅ Security headers configured${NC}"
else
    echo -e "${YELLOW}⚠️ Security headers may need review${NC}"
fi

# Check for sensitive data
if grep -qr "password\|secret\|key\|token" --exclude-dir=.git --exclude="*.md" .; then
    echo -e "${YELLOW}⚠️ Potential sensitive data found - please review${NC}"
else
    echo -e "${GREEN}✅ No obvious sensitive data detected${NC}"
fi

echo ""

# Step 7: Pre-deployment Tests
echo -e "${YELLOW}📋 Step 7: Pre-deployment Tests${NC}"
echo "Running pre-deployment tests..."

# Test HTML validation (basic)
echo "Testing HTML structure..."
if [ -f "index-simple.html" ]; then
    # Check for required elements
    if grep -q "business-card-front" index-simple.html && grep -q "business-card-back" index-simple.html; then
        echo -e "${GREEN}✅ Business card elements found${NC}"
    else
        echo -e "${RED}❌ Business card elements missing${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}✅ Pre-deployment tests passed${NC}"
echo ""

# Step 8: Deployment Instructions
echo -e "${YELLOW}📋 Step 8: Deployment Instructions${NC}"
echo "Ready for deployment! Follow these steps:"
echo ""
echo -e "${BLUE}🌐 CLOUDFLARE PAGES DEPLOYMENT:${NC}"
echo "1. Go to: https://dash.cloudflare.com/pages"
echo "2. Click 'Create a project' → 'Connect to Git'"
echo "3. Select repository: renbran/SGC-IT"
echo "4. Configure:"
echo "   - Project name: $PROJECT_NAME"
echo "   - Production branch: main"
echo "   - Build command: (leave empty)"
echo "   - Build directory: ./"
echo "5. Deploy and set custom domain: $FULL_DOMAIN"
echo ""

echo -e "${BLUE}📊 DEPLOYMENT SUMMARY:${NC}"
echo "- Repository: $REPO_URL"
echo "- Branch: main"
echo "- Target Domain: $FULL_DOMAIN"
echo "- Project Type: Static Site"
echo "- Deployment Method: Cloudflare Pages"
echo ""

# Step 9: Post-deployment Checklist
echo -e "${YELLOW}📋 Step 9: Post-deployment Checklist${NC}"
echo "After deployment, verify:"
echo "□ Site loads at $FULL_DOMAIN"
echo "□ Business card designer functions"
echo "□ PDF download works"
echo "□ Form validation works"
echo "□ Mobile responsiveness"
echo "□ Social media links function"
echo "□ QR code generation works"
echo "□ Newsletter signup works"
echo ""

echo -e "${GREEN}🎉 SYSTEMATIC DEPLOYMENT PREPARATION COMPLETE!${NC}"
echo -e "${GREEN}All files are ready for production deployment.${NC}"
echo ""
echo -e "${BLUE}Next step: Execute deployment via Cloudflare Pages dashboard${NC}"
echo -e "${BLUE}Documentation: See DEPLOYMENT.md for detailed instructions${NC}"