# Flutter Status Notification Alert 🔔

A lightweight and customizable **status notification alert** package for Flutter.
Show beautiful alert messages like **success, error, warning, and info** with smooth animations.

---

## ✨ Features

* 🚀 Queue system (no overlapping alerts)
* 🎬 Smooth slide animation (top / bottom)
* 👉 Swipe to dismiss
* ⏱ Custom duration
* 📍 Custom position (top / bottom)
* 🎨 Predefined alert types (success, error, warning, info)
* 💡 Lightweight & easy to use

---

# demo 


https://github.com/user-attachments/assets/3c5f925b-43d9-4f28-9478-bc524e6bdfe5



## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_status_notification_alert:
   path: ../
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

### Import

```dart
import 'package:flutter_status_notification_alert/flutter_status_notification_alert.dart';
```

---

### 🔔 Show Alert

```dart
StatusAlert.show(
  context,
  text: "Login Successful!",
  type: StatusType.success,
);
```

---

### ⚙️ Advanced Usage

```dart
StatusAlert.show(
  context,
  text: "Something went wrong",
  type: StatusType.error,
  duration: Duration(seconds: 3),
  position: StatusPosition.bottom,
);
```

---

## 🎨 Alert Types

* `StatusType.success`
* `StatusType.error`
* `StatusType.warning`
* `StatusType.info`

---

## 📍 Positions

* `StatusPosition.top`
* `StatusPosition.bottom`

---

## 🎬 Behavior

* Alerts appear with smooth slide animation
* Multiple alerts are queued automatically
* Swipe left/right to dismiss manually
* Alerts auto-dismiss after the given duration

---

## 📁 Example

```dart
ElevatedButton(
  onPressed: () {
    StatusAlert.show(
      context,
      text: "Success Alert",
      type: StatusType.success,
    );

    StatusAlert.show(
      context,
      text: "Error Alert",
      type: StatusType.error,
      position: StatusPosition.bottom,
    );
  },
  child: Text("Show Alerts"),
);
```

---

## 🧠 How It Works

* Uses Flutter `Overlay` to display alerts above UI
* Queue system ensures one alert at a time
* Built with animation + gesture support

---

## 📄 License

MIT License

Copyright (c) 2026 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


---


