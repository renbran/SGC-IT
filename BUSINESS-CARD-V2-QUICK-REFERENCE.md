# Business Card V2 - Quick Reference Guide

## 🚀 Quick Access
- **Live URL:** https://renbran.github.io/SGC-IT/business-card-v2.html
- **Local File:** `d:/it-doc/SGC-IT/business-card-v2.html`
- **Navigation:** index.html → Business Card section → "Premium V2" card

---

## ⚡ Key Features at a Glance

| Feature | Details |
|---------|---------|
| **Design** | Neural network theme with brain/circuit decorations |
| **Layout** | Dual-sided (front: contact, back: QR code) |
| **Theme** | Cyan (#00e5ff) on dark navy background |
| **Dimensions** | 3.5" × 2" standard business card |
| **Print** | Full PDF export support with hidden controls |
| **Mobile** | Fully responsive (90vw on mobile) |
| **Icons** | Font Awesome 6.4.0 (social media) |
| **QR Code** | Dynamic generation via qrserver.com API |

---

## 📝 Editable Fields

### Contact Information (Front Card)
```html
Name:       "MICHAEL RODRIGUEZ GUIDO"
Title:      "Business Development Executive"
Email:      "m.guido@scholarixglobal.com"
Phone:      "+971 54 3423 029"
Address:    "201 Al Maseed Building, Deira - Dubai, UAE"
```

### Social Media (Front Card)
- LinkedIn, Twitter, Facebook, Instagram links (update href attributes)

### QR Code (Back Card)
- URL Parameter: Replace `https://scholarixglobal.com` with your target URL

---

## 🎨 Design Elements

### Front Card Features
- ✨ Hexagon pattern background (SVG)
- 🧠 Neural brain decoration (left side)
- ⚡ Circuit lines (right side)
- 💬 Contact information (3 items with icons)
- 🔗 Social media buttons (4 icons)

### Back Card Features
- 🕸️ Network nodes (8 glowing points)
- 📡 Connection lines (SVG network topology)
- 📲 QR code with decorative border
- ✨ Corner markers on QR frame

---

## 🖨️ How to Print/Export

1. **Click** the "🖨️ Print / PDF" button
2. **Select** printer or "Print to PDF"
3. **Settings:**
   - Paper size: 3.5" × 2"
   - Margins: None or minimal
   - Scale: 100%
   - Color: Color (not grayscale)
4. **Print/Save** your card

> ✅ Header and buttons automatically hidden in print preview

---

## 🎯 Color Scheme

```
Dark Background:     #0a1628
Secondary Dark:      #0d2847
Cyan Accent:         #00e5ff (primary)
Cyan Secondary:      #00bcd4
White Text:          #ffffff
```

---

## 📱 Responsive Behavior

| Device | Size | Card Dimensions |
|--------|------|-----------------|
| Desktop | 1024px+ | 3.5" × 2" (fixed) |
| Tablet | 768px-1023px | 90vw × proportional |
| Mobile | <768px | 90vw × proportional |

---

## 🔧 How to Customize

### 1. Edit Contact Information
Open `business-card-v2.html` and find these sections (marked with `<!-- EDITABLE: -->`):

```html
<!-- Line ~450 -->
<h1 class="name">YOUR NAME HERE</h1>

<!-- Line ~454 -->
<p class="title">YOUR TITLE HERE</p>

<!-- Lines ~463, 470, 477 -->
Email, Phone, Address (in contact-info divs)
```

### 2. Change Social Media Links
```html
<!-- Line ~487-492 -->
<a href="YOUR_LINKEDIN_URL" class="social-icon">...</a>
<a href="YOUR_TWITTER_URL" class="social-icon">...</a>
<!-- etc. -->
```

### 3. Update QR Code
```html
<!-- Line ~507 -->
<img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=YOUR_URL_HERE" alt="QR Code">
```

Replace `YOUR_URL_HERE` with your target URL (e.g., `https://yourwebsite.com`)

### 4. Change Colors
Search/replace in CSS (lines 31-410):
- `#00e5ff` → Cyan primary accent
- `#00bcd4` → Cyan secondary
- `#0a1628` → Dark background
- `#ffffff` → White text

---

## 📊 Technical Details

**File Size:** ~520 lines of HTML + CSS
**CSS:** Included (inline `<style>`)
**JavaScript:** Minimal (console.log only)
**Dependencies:**
- Font Awesome 6.4.0 (CDN)
- Google Fonts: Montserrat (CDN)
- External QR API: qrserver.com

**Browser Support:** All modern browsers (Chrome, Firefox, Safari, Edge)

---

## 📞 Support

### Common Tasks

**Q: How do I change the name?**
A: Find line ~450, change `MICHAEL RODRIGUEZ GUIDO`

**Q: Where do I update the email?**
A: Find `m.guido@scholarixglobal.com` and replace

**Q: How do I add my QR code?**
A: Update the `data=` parameter in line ~507 URL

**Q: Can I change the colors?**
A: Yes, search/replace hex values in the CSS section

**Q: Is this mobile-friendly?**
A: Yes, fully responsive with mobile breakpoints

**Q: Can I print it?**
A: Yes, click the "🖨️ Print / PDF" button

---

## ✅ Implementation Checklist

- [x] File created: `business-card-v2.html`
- [x] Navigation updated: `index.html`
- [x] Features implemented: All core features
- [x] Responsive design: Mobile-optimized
- [x] Print styles: Header/buttons hidden
- [x] Documentation: Comprehensive
- [x] Color scheme: Consistent cyan theme
- [x] Icons: Font Awesome integrated
- [x] QR code: API integrated
- [x] Back button: Navigation included

---

## 🚀 Next Steps

1. **Review** the template at: https://renbran.github.io/SGC-IT/business-card-v2.html
2. **Customize** contact information (name, email, phone, etc.)
3. **Update** social media links to your profiles
4. **Change** QR code URL to your website
5. **Print** or export as PDF
6. **Share** with team and clients

---

## 📚 Related Documentation

- **BUSINESS-CARD-V2-IMPLEMENTATION.md** - Full technical documentation
- **index.html** - Navigation hub
- **DESIGN-SUMMARY.md** - Design system overview

---

*Last Updated: December 16, 2025*
*Version: V2 - Neural Theme Edition*
*Status: ✅ Production Ready*
