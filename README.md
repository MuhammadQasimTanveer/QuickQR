# QuickQR

[![Flutter](https://img.shields.io/badge/Flutter-3.13+-blue?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.2+-blue?logo=dart)](https://dart.dev/)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web-green)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Maintained-Yes-brightgreen)

---

## 🧾 Description

**QuickQR** is a modern Flutter-based QR code generator and scanner application built for Android and Web platforms.  
It allows users to **create, customize, scan, and save QR codes effortlessly**, all with a smooth and responsive interface.

---

## ✨ Features
- **Generate QR Codes** for text, links, or custom input  
- **Scan QR Codes** in real-time using the camera  
- **Save Generated QR Codes** directly to your device gallery  
- **Cross-Platform Support** – Android and Web  
- **Minimal & Elegant UI** built with Flutter’s Material & Cupertino design  

---

## 🧰 Tech Stack

| Category              | Tools / Packages Used |
|----------------------|------------------------|
| **Framework**        | Flutter 3.13+ |
| **Language**         | Dart 3.2+ |
| **QR Generation**    | [`qr_flutter`](https://pub.dev/packages/qr_flutter) |
| **QR Scanning**      | [`mobile_scanner`](https://pub.dev/packages/mobile_scanner) |
| **File Storage**     | [`path_provider`](https://pub.dev/packages/path_provider) |
| **Gallery Save**     | [`gallery_saver_plus`](https://pub.dev/packages/gallery_saver_plus) |
| **Web Image Download** | [`image_downloader_web`](https://pub.dev/packages/image_downloader_web) |
| **UI Enhancements**  | [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) |

---

## 📁 Project Structure

```bash
lib/
├── main.dart                    # Application entry point
├── home.dart                    # Home screen with navigation
├── screens/
│   ├── splash_screen.dart       # Splash screen
│   ├── generateQRpage.dart      # QR generation screen
│   └── scanQRpage.dart          # QR scanning screen
