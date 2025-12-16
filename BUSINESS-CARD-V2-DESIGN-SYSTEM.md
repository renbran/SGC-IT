# Business Card V2 - Visual Layout & Design System

**Document Version:** V1
**Created:** December 16, 2025
**Purpose:** Visual reference and design specifications

---

## 📐 Card Layout Specification

### Physical Dimensions
```
Width:   3.5 inches (88.9 mm)
Height:  2 inches (50.8 mm)
Ratio:   7:4 (standard business card)
Safe Zone: 0.25" margins (internal printing area)
```

### Digital Dimensions (Screen)
```
Desktop: 3.5in × 2in (exact size)
Tablet:  90vw × (90vw × 0.571)
Mobile:  90vw × (90vw × 0.571)
Max:     3.5in × 2in (hardcap)
```

---

## 🎨 Color Palette Reference

### Primary Colors
```
Cyan Bright:     #00e5ff  ← Main accent color
  RGB: (0, 229, 255)
  HSL: 188°, 100%, 50%
  Use: Text accents, borders, nodes, highlights

Cyan Dark:       #00bcd4  ← Secondary accent
  RGB: (0, 188, 212)
  HSL: 188°, 100%, 42%
  Use: Icon backgrounds, gradients, hover states
```

### Background Colors
```
Dark Navy:       #0a1628  ← Primary background
  RGB: (10, 22, 40)
  HSL: 215°, 60%, 10%
  Use: Card base background

Secondary Dark:  #0d2847  ← Gradient component
  RGB: (13, 40, 71)
  HSL: 215°, 69%, 16%
  Use: Gradient backgrounds, overlays

Text White:      #ffffff  ← Primary text
  RGB: (255, 255, 255)
  HSL: 0°, 0%, 100%
  Use: All readable text, contact info
```

### Color Applications
| Element | Color | Usage |
|---------|-------|-------|
| Card Background | #0a1628 | Base layer |
| Gradient | #0d2847 | 135° gradient background |
| Text (Name) | #ffffff | Primary heading |
| Text (Title) | #00e5ff | Job title accent |
| Text (Contact) | #ffffff | Contact information |
| Icon Background | #00bcd4 + #00e5ff | Circular icon containers |
| Border (QR) | #00e5ff | QR code frame |
| Glow Effect | #00e5ff | Node glow effects |
| Links | #00bcd4 | Social media icons |

---

## 🧩 Layout Structure

### Front Card Composition

```
┌─────────────────────────────────────────┐
│  NEURAL DECORATION                      │
│  (80px × 60px, bottom-left)             │
│  ┌─ Brain outline (ellipses)            │
│  ├─ Neural nodes (6 circles)            │
│  └─ Connections (6 lines)               │
│                                         │
│                                         │
│  MICHAEL                    CIRCUIT     │
│  RODRIGUEZ GUIDO            LINES       │
│  Business Development...  (120×80px,    │
│                            bottom-right)│
│                                         │
│  ✉️ Email: m.guido@...                  │
│  ☎️ Phone: +971 54 3423 029             │
│  📍 Address: 201 Al Maseed...           │
│                                         │
│  🔗 🐦 📘 📷                             │
│  (4 social icons, 18px × 18px)          │
│                                         │
└─────────────────────────────────────────┘

Dimensions: 3.5" × 2"
Background: #0a1628 + #0d2847 gradient
Pattern: Hexagon SVG background (60px tiles)
```

### Back Card Composition

```
┌─────────────────────────────────────────┐
│                                         │
│      ╱─── Network Node ───╲            │
│     ╱  ●        ●        ●   ╲          │
│    │  ●   ╱─────────╲    ● │          │
│    │  ●   │    ●    │    ● │          │
│    │   ╲──────────╱      ●  │          │
│    │      ●        ●        │          │
│    │                        │          │
│    │        ┌─────────┐      │          │
│    │        │ QR CODE │      │          │
│    │        │ (80×80) │      │          │
│    │        │         │      │          │
│    │        └─────────┘      │          │
│    │      (with decorative   │          │
│    │       corner markers)   │          │
│    │                         │          │
│    └─────────────────────────┘          │
│                                         │
│      (SVG connection lines overlay)    │
│      (Radial glow gradients)            │
│                                         │
└─────────────────────────────────────────┘

Dimensions: 3.5" × 2"
Background: #0a1628 + #0d2847 gradient
Radials: Cyan gradient glows (transparent)
```

---

## 🔤 Typography Reference

### Fonts Used
```
Font Family:  Montserrat (imported from Google Fonts)
Weights:      400 (Regular), 600 (Semi-bold), 700 (Bold)
Fallback:     sans-serif
```

### Typography Hierarchy

| Element | Font | Size | Weight | Color | Use |
|---------|------|------|--------|-------|-----|
| Name | Montserrat | 16px | 700 | #fff | Main heading |
| Title | Montserrat | 9px | 600 | #00e5ff | Subtitle |
| Contact Text | Montserrat | 8px | 400 | #fff | Body text |
| Contact Icon | - | 7px | - | #0a1628 | Icon fill |
| Social Icons | Font Awesome | 9px | - | #0a1628 | Social links |
| Print Labels | Montserrat | 12px | 600 | #666 | Identification |

### Text Styling
```
Name:
  text-transform: uppercase
  letter-spacing: 1px
  line-height: 1.2
  margin-bottom: 4px

Title:
  letter-spacing: 0.5px
  margin-bottom: 15px
  opacity: 1.0 (full)

Contact:
  display: flex
  align-items: center
  gap: 10px (icon to text)
  margin: 6px 0

Social Icons:
  gap: 8px (between icons)
  margin-top: 12px
```

---

## 🎭 Visual Elements & Decorations

### 1. Hexagon Pattern Background
```
SVG Pattern:
  Tile Size: 60px × 60px
  Element: Hexagon path outline
  Stroke: #00bcd4
  Width: 0.5px
  Opacity: 0.15 (subtle)
  Repeat: Across entire background
```

### 2. Neural Brain Decoration (Front)
```
Position: Absolute, bottom: 10px, left: 15px
Size: 80px × 60px
SVG Elements:
  - Ellipse 1: cx=50, ry=28, stroke #00e5ff
  - Ellipse 2: cx=50, ry=20, stroke #00e5ff (inner)
  - 6 Neural Nodes: r=1.5-2px, #00e5ff circles
  - 6 Connections: Lines joining nodes
Opacity: 0.6 (background element)
```

### 3. Circuit Lines Decoration (Front)
```
Position: Absolute, bottom: 0, right: 0
Size: 120px × 80px
SVG Elements:
  - 3 Horizontal/diagonal lines
  - 2 Connection circles (r=2px)
  - Connection points forming circuit
Opacity: 0.4 (subtle)
```

### 4. Network Nodes (Back)
```
Count: 8 positioned nodes
Size: 4-6px (varying)
Color: #00e5ff (glowing)
Glow: 0 0 10px #00e5ff, 0 0 20px #00e5ff
Opacity: 0.5-0.8 (varying by position)
Positioning: Scattered across background
  Node 1: top 15%, left 10%
  Node 2: top 25%, left 25%
  Node 3: top 10%, right 20%
  ... (8 total, see CSS for exact positions)
```

### 5. Connection Lines (Back)
```
SVG Overlay:
  Count: 11 lines (various thicknesses)
  Stroke Color: #00e5ff
  Width: 0.3-0.5px
  Opacity: 0.3 (very subtle)
  Pattern: Network topology connecting nodes
```

### 6. QR Code Container (Back)
```
Border:
  Width: 2px
  Color: #00e5ff
  Style: solid

Shadow:
  Primary: 0 0 20px rgba(0, 229, 255, 0.5)
  Inner: inset 0 0 20px rgba(0, 229, 255, 0.1)

Corner Markers:
  4 L-shaped corners
  Size: 20px × 20px
  Position: Absolute at corners (with -8px offset)
  Color: #00e5ff
  Width: 2px

Padding: 8px (around QR code)
Background: transparent (shows card behind)

QR Image:
  Size: 80px × 80px
  Background: #ffffff (white)
  Source: API (qrserver.com)
```

---

## 📊 Spacing & Layout Grid

### Base Unit: 8px Grid

```
Common Spacing Values:
  4px   - Small gaps (icon to text)
  6px   - Contact item vertical gap
  8px   - Social icon gaps
  10px  - General padding
  12px  - Margin between sections
  15px  - Larger sections
  20px  - Card padding
  25px  - Horizontal padding
  30px  - Navigation gaps
  40px  - Large section gaps
```

### Card Padding
```
Front Card:
  Padding: 20px 25px (vertical × horizontal)
  Flex: column
  Justify: center

Back Card:
  Flex: center
  Align items: center
```

### Element Spacing
```
Name to Title:     4px
Title to Contacts: 15px
Contact Items:     6px (vertical gap)
Contacts to Social: 12px
Social Icon Gap:   8px
```

---

## 🖱️ Interactive States

### Button States

**Normal:**
```css
background: linear-gradient(135deg, #00bcd4 0%, #00e5ff 100%)
color: #0a1628
box-shadow: none
transform: none
```

**Hover:**
```css
background: linear-gradient(135deg, #00bcd4 0%, #00e5ff 100%)
transform: translateY(-2px)
box-shadow: 0 5px 15px rgba(0, 188, 212, 0.4)
```

**Active/Pressed:**
```css
transform: translateY(0)
box-shadow: 0 2px 8px rgba(0, 188, 212, 0.3)
```

### Icon Hover States
```css
Social Icon:
  Normal: transform: scale(1.0)
  Hover:  transform: scale(1.1)
  Duration: 0.2s
```

---

## 🖨️ Print Specifications

### Print Styles
```
@media print {
  body:
    background: white
    padding: 0
  
  .card-container:
    gap: 20px (tighter spacing)
  
  .business-card:
    box-shadow: none
    border: 1px solid #ccc
    -webkit-print-color-adjust: exact
    print-color-adjust: exact
  
  Header & Controls: display: none
}
```

### Print Recommendations
```
Paper Size:    3.5" × 2" (or custom business card stock)
Margins:       None or minimal (0.25")
Scale:         100% (no scaling)
Color Mode:    Color (CMYK preferred)
Quality:       High or Best
Orientation:   Landscape (default)
```

---

## 📱 Responsive Breakpoints

### Desktop (1024px and above)
```css
.card-container:
  gap: 40px
  flex-wrap: wrap

.business-card:
  width: 3.5in
  height: 2in
```

### Tablet (768px - 1023px)
```css
.card-container:
  gap: 30px

.business-card:
  width: 90vw
  height: calc(90vw * 0.571)
  max-width: 3.5in
  max-height: 2in
```

### Mobile (below 768px)
```css
.card-container:
  gap: 30px

.business-card:
  width: 90vw
  height: calc(90vw * 0.571)
  max-width: 3.5in
  max-height: 2in

.btn:
  font-size: 12px
  padding: 8px 16px
```

---

## 🎯 Visual Hierarchy

### Primary Focus
1. **Name** (largest, white, bold)
2. **QR Code** (prominent on back)

### Secondary Focus
3. **Title** (cyan color, stands out)
4. **Contact Information** (organized with icons)
5. **Social Icons** (small but visible)

### Tertiary Elements
6. **Decorations** (neural elements, network nodes)
7. **Background patterns** (subtle, non-intrusive)

---

## ✨ Visual Effects & Transitions

### CSS Transitions
```
Social Icons:   0.2s transform
Button Hover:   0.2s transform, 0.2s box-shadow
Navigation:     0.3s all ease
Hover Effects:  Smooth color gradients
```

### Visual Glows
```
Node Glow:
  Primary:   0 0 10px #00e5ff
  Secondary: 0 0 20px #00e5ff
  Combined:  Creates depth effect

QR Shadow:
  Outer:     0 0 20px rgba(0, 229, 255, 0.5)
  Inner:     inset 0 0 20px rgba(0, 229, 255, 0.1)
  Effect:    Professional glow frame
```

### Opacity Layers
```
Background Patterns: 0.15-0.4 (subtle)
Decorations:        0.3-0.6 (visible but not dominant)
Nodes:              0.5-0.8 (varying)
Glows:              0.1-0.5 (transparent overlays)
Text:               1.0 (full opacity)
```

---

## 🎓 Design Principles Applied

### 1. **Visual Balance**
- Symmetrical distribution of elements
- Even spacing and alignment
- Balanced color application

### 2. **Hierarchy**
- Clear primary, secondary, tertiary focus
- Size and color differentiation
- Logical information flow

### 3. **Consistency**
- Unified color palette
- Consistent spacing grid
- Matching typography scales

### 4. **Modern Aesthetics**
- Neural network theme
- Minimalist approach
- Tech-forward design

### 5. **Usability**
- Clear, readable text
- Obvious interactive elements
- Professional appearance

### 6. **Responsiveness**
- Flexible layout
- Mobile-first approach
- Print-optimized output

---

## 📏 Quick Reference Matrix

| Aspect | Value | Reference |
|--------|-------|-----------|
| Card Width | 3.5" | Standard |
| Card Height | 2" | Standard |
| Padding | 20px 25px | Content area |
| Name Size | 16px | Largest text |
| Title Size | 9px | Accent size |
| Contact Size | 8px | Body text |
| Icon Size | 14-18px | Interactive |
| Primary Color | #00e5ff | Cyan |
| Dark Color | #0a1628 | Background |
| White Color | #ffffff | Text |
| Grid Unit | 8px | All spacing |
| Breakpoint | 768px | Mobile cutoff |

---

## 🎨 Color Swatch HTML Reference

```html
<!-- Primary Cyan -->
<div style="background: #00e5ff; width: 50px; height: 50px;"></div>

<!-- Secondary Cyan -->
<div style="background: #00bcd4; width: 50px; height: 50px;"></div>

<!-- Dark Navy -->
<div style="background: #0a1628; width: 50px; height: 50px;"></div>

<!-- Secondary Dark -->
<div style="background: #0d2847; width: 50px; height: 50px;"></div>

<!-- White Text -->
<div style="background: #ffffff; width: 50px; height: 50px; border: 1px solid #ccc;"></div>

<!-- Gradient -->
<div style="background: linear-gradient(135deg, #0a1628 0%, #0d2847 50%, #0a1628 100%); width: 100px; height: 50px;"></div>
```

---

## 📖 This Document

**Created:** December 16, 2025
**Version:** V1
**Purpose:** Complete visual and design specification reference
**Status:** Production Reference
**Audience:** Designers, Developers, Stakeholders

---

*Visual Design Specification | Business Card V2 Neural Theme*
*github.com/renbran/SGC-IT | Branch: main*
