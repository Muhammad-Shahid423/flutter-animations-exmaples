# Flutter Animated Examples

A clean architecture Flutter project demonstrating various animation examples with custom navigation, transitions, and modular architecture.

![Example 1 Demo](assets/animations/example1.gif)

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
- `Matrix4.rotationY`
- `AnimatedBuilder`

---

## 📁 Folder Structure

```
lib/
├── core/
│   └── router/         # Custom route config and transition pages
├── features/
│   └── animations/
│       ├── presentation/
│       │   ├── pages/   # Home page
│       │   └── examples/ # Each animation example (Example1, Example2, ...)
assets/
└── animations/
    └── example1.gif
main.dart
```

---

## 📸 Example 1 – Rotating 3D Box

A 3D Y-axis rotating animated box using `Matrix4` and `AnimationController`.

### 🔁 Preview:

![Example 1](assets/animations/example1.gif)

---

## ✨ Contributing

Pull requests are welcome! Feel free to fork and suggest improvements or submit your own animation example.

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
