\# QuickQR



\[!\[Flutter](https://img.shields.io/badge/Flutter-3.13+-blue?logo=flutter)](https://flutter.dev/)

\[!\[Dart](https://img.shields.io/badge/Dart-3.2+-blue?logo=dart)](https://dart.dev/)

!\[Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web-green)

!\[License](https://img.shields.io/badge/License-MIT-green)

!\[Status](https://img.shields.io/badge/Maintained-Yes-brightgreen)



---



\## 🧾 Description



\*\*QuickQR\*\* is a modern Flutter-based QR code generator and scanner application built for Android and Web platforms.  It allows users to \*\*create, customize, scan, and save QR codes effortlessly\*\*, all with a smooth and responsive interface.



---



\## ✨ Features

&nbsp;  - \*\*Generate QR Codes\*\* for text, links, or custom input  

&nbsp;  - \*\*Scan QR Codes\*\* in real-time using the camera  

&nbsp;  - \*\*Save Generated QR Codes\*\* directly to your device gallery  

&nbsp;  - \*\*Cross-Platform Support\*\* - Android, and Web  

&nbsp;  - \*\*Minimal \& Elegant UI\*\* built with Flutter’s Material \& Cupertino design   



---



\## 🧰 Tech Stack



| Category        | Tools / Packages Used |

|-----------------|------------------------|

| \*\*Framework\*\*   | Flutter 3.13+ |

| \*\*Language\*\*    | Dart 3.2+ |

| \*\*QR Generation\*\* | \[`qr\_flutter`](https://pub.dev/packages/qr\_flutter) |

| \*\*QR Scanning\*\* | \[`mobile\_scanner`](https://pub.dev/packages/mobile\_scanner) |

| \*\*File Storage\*\* | \[`path\_provider`](https://pub.dev/packages/path\_provider) |

| \*\*Gallery Save\*\* | \[`gallery\_saver\_plus`](https://pub.dev/packages/gallery\_saver\_plus) |

| \*\*Web Image Download\*\* | \[`image\_downloader\_web`](https://pub.dev/packages/image\_downloader\_web) |

| \*\*UI Enhancements\*\* | \[`cupertino\_icons`](https://pub.dev/packages/cupertino\_icons) |



---



\## 📁 Project Structure

```bash

lib/

├── main.dart                    # Application entry point

├── home.dart                    # Home screen with navigation

├── screens/

│ ├── splash\_screen.dart         # Splash screen

│ ├── generateQRpage.dart        # QR generation screen

│ └── scanQRpage.dart            # QR scanning screen

```

---



\## 🧩 Getting Started



\### 🔧 Prerequisites



&nbsp; - \*\*Flutter SDK\*\*: v3.10 or later  

&nbsp; - \*\*Dart SDK\*\*: v3.0 or later  

&nbsp; - \*\*Android Studio / VS Code\*\*  

&nbsp; - \*\*Emulator or Physical Device\*\*



---



\### ⚙️ Installation



1\. \*\*Clone the repository\*\*

&nbsp;  ```bash

&nbsp;  git clone https://github.com/MuhammadQasimTanveer/QuickQR.git

&nbsp;  cd QuickQR

&nbsp;  ```

2\. \*\*Install dependencies\*\*

&nbsp;  ```bash

&nbsp;  flutter pub get

&nbsp;  ```

3\. \*\*Run the application\*\*

&nbsp;  

&nbsp;  ```bash

&nbsp;  Make sure your Android Emulator is running in \*\*Android Studio\*\*, then execute:

&nbsp;  # For Android

&nbsp;  flutter run -d emulator-5554



&nbsp;  # For Web

&nbsp;  flutter run -d chrome

&nbsp;  ```

