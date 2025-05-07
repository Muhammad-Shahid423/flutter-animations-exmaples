# Flutter Animated Examples

A clean architecture Flutter project demonstrating various animation examples with custom navigation, transitions, and modular architecture.

<img src="assets/animations/example1.gif" alt="Example 1 Demo" width="400", height="400"/>
<img src="assets/animations/example2.gif" alt="Example 2 Demo" width="400", height="400"/>
<img src="assets/animations/example3.gif" alt="Example 3 Demo" width="400", height="400"/>

---

## 🚀 Features

- Animation Examples with smooth transitions
- Custom 3D rotation
- Smooth animation using `AnimationController`
- Clean architecture ready for expansion
- Custom Router/Navigation integration ready

---

## 🚀 Getting Started

Clone the repo and run:

```bash
flutter pub get
flutter run
```

---

## 🧠 Concepts Used

- `AnimationController`
- `Tween<double>`
- `Matrix4.rotationY`, `rotationX`, `rotationZ`
- `AnimatedBuilder`
- `ClipPath` with `CustomClipper`

---

## 📁 Folder Structure

```
lib/
├── core/
│   ├── router/         # Custom route config and transition pages
│   ├── enums/          # Reusable enums like CircleSide
│   └── widgets/        # Shared widgets like HalfCircleClipper
├── features/
│   └── animations/
│       ├── presentation/
│       │   ├── pages/   # Home page
│       │   └── examples/ # Each animation example (Example1, Example2, ...)
assets/
└── animations/
    ├── example1.gif
    ├── example2.gif
    └── example3.gif
main.dart
```

---

## 📸 Example 1 – Rotating 3D Box

A 3D Y-axis rotating animated box using `Matrix4` and `AnimationController`.

### 🔁 Preview:

<img src="assets/animations/example1.gif" alt="Example 1" width="400", height="400"/>

---

## 📸 Example 2 – Half-Circle Flip & Rotate

A combined animation of flipping two half-circles and rotating them counter-clockwise in sequence using chained `AnimationController`s and a custom `HalfCircleClipper`.

### 🔁 Preview:

<img src="assets/animations/example2.gif" alt="Example 2" width="400", height="400"/>

---

## 📸 Example 3 – 3D Cube Rotation

A rotating cube animation with continuous X, Y, and Z-axis spins using separate animation controllers and `Matrix4` transforms.

### 🔁 Preview:

<img src="assets/animations/example3.gif" alt="Example 3" width="400", height="400"/>

---

## ✨ Contributing

Pull requests are welcome! Feel free to fork and suggest improvements or submit your own animation example.

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
