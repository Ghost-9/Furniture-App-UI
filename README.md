# Furniture App UI

<p align="center">
  <strong>A gesture-driven interior catalog inspired by high-end spatial aesthetics.</strong><br />
  <em>Engineered with Flutter for fluid, 60fps mobile exploration across all modern device viewports.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x%20%7C%20Dart%203.x-02569B?logo=flutter&logoColor=white" alt="Flutter 3.x" />
  <img src="https://img.shields.io/badge/Platforms-iOS%20%7C%20Android-4E525A" alt="Platforms" />
  <img src="https://img.shields.io/badge/License-MIT-black.svg" alt="MIT License" />
  <img src="https://img.shields.io/badge/Design-Dribbble-EA4C89?logo=dribbble&logoColor=white" alt="Dribbble" />
</p>

---

<p align="center">
  <img width="100%" alt="Furniture Catalog Hero" src="https://user-images.githubusercontent.com/53341343/212306210-ab7f488e-7171-4a80-9f04-a21269938744.png" />
</p>

---

## Overview

**Furniture App UI** is a tactile, concept-driven mobile experience built around editorial luxury furniture collections. Inspired by contemporary architectural monographs, the interface pairs bespoke typography (`Monologue` & `SF Pro Display`) with an offset staggered grid, gesture-driven story cards, and seamless product inspection sheets.

---

## Visual Walkthrough

<div align="center">
  <table>
    <tr>
      <td width="50%" align="center">
        <strong>Dynamic Story Browse</strong><br /><br />
        <img width="100%" alt="Collection Swipe Transition" src="https://user-images.githubusercontent.com/53341343/212306305-a9d5fa91-a6ce-4374-a49e-6b0b0d005a8b.png" />
      </td>
      <td width="50%" align="center">
        <strong>Architectural Detail Sheet</strong><br /><br />
        <img width="100%" alt="Product Details View" src="https://user-images.githubusercontent.com/53341343/212306320-63fb1af8-fb24-42a4-a481-744800794c25.png" />
      </td>
    </tr>
  </table>
</div>

---

## Craft & Architecture

* **Multi-Viewport Elasticity:** Responsive grid geometry tested across Compact (iPhone SE), Standard (iPhone 15), and Max display viewports without overflow.
* **Story-Style Spatial Swiping:** Horizontal `PageView` transitions simulating full-screen editorial lookbooks.
* **Declarative Motion:** Custom quadratic bezier clippers (`CurvePath`) delivering soft organic contours to imagery.
* **Safe-Area Intelligence:** Floating dynamic navigation elements respecting hardware home indicators and gesture pills.

---

## Getting Started

### Prerequisites
* Flutter SDK (3.24+ recommended)
* Dart SDK (3.5+)
* Xcode or Android Studio

### Installation

```bash
# Clone repository
git clone https://github.com/Ghost-9/Furniture-App-UI.git

# Navigate into project directory
cd Furniture-App-UI

# Install dependencies
flutter pub get

# Run test suite
flutter test

# Launch on connected device or simulator
flutter run
```

---

## Design Attribution

Design concept inspired by [Furniture iOS Mobile App](https://dribbble.com/shots/17392232-Furniture-iOS-mobile-app) on Dribbble.

---

## License

This project is licensed under the [MIT License](LICENSE.md).

<div align="center">
  <sub>Crafted with precision by <a href="https://github.com/Ghost-9">Mayank Batra</a></sub>
</div>
