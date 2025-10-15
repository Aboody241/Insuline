# insulin-95

# 🩸 Insulin95 — Smart Diabetes Management App

**Insulin95** is a modern Flutter-based mobile application designed to help diabetic patients manage their daily routines effectively.
The app provides tools to track blood sugar levels, manage medications, calculate BMI, plan meals, and receive AI-driven health insights.

---

## 🚀 Features

* 🔐 **Authentication System** – Firebase-powered login and registration.
* 💊 **Medication Schedule** – Add, edit, and delete medicine reminders with time and end-date.
* 🤖 **AI Health Chatbot** – Get instant answers, tips, and diabetes care support powered by AI.
* 🍎 **Meal Recipes** – Browse healthy meal recipes with nutritional details and modern UI.
* 🧠 **BMI Calculator** – Calculate Body Mass Index and receive instant feedback.
* 💾 **Local Storage (Hive)** – Saves user data (like medication schedules) even when offline.
* 🧑‍💻 **User Profile** – Upload a profile picture and add personal information.
* 💬 **Interactive UI** – Smooth and minimal user experience using Material 3 and Google Fonts.

---

## 🛠️ Tech Stack

| Technology        | Purpose                    |
| ----------------- | -------------------------- |
| **Flutter**       | Frontend UI development    |
| **Dart**          | Main programming language  |
| **Firebase Auth** | User authentication        |
| **Firebase Core** | Cloud integration          |
| **Hive**          | Local offline data storage |
| **Google Fonts**  | Custom typography          |
| **Bloc / Cubit**  | State management           |

---

## 📱 App Structure

```
lib/
├── core/
│   ├── assets/
│   ├── widgets/
│   └── utils/
├── controllers/
│   └── cubit/
├── data/
│   └── services/
├── features/
│   ├── Authentication/
│   ├── User Welcome/
│   ├── BMI/
│   ├── Medication/
│   ├── Recipes/
│   └── Splash/
└── main.dart
```

---

## ⚙️ Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/Insulin95.git
   cd Insulin95
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

4. **(Optional)** If using Firebase, make sure you have your own `google-services.json` file inside
   `android/app/` and initialize Firebase properly.

---

## 📸 Screenshots

*Add screenshots or GIFs of your app here once available.*

---

## 💡 Future Enhancements

* Integration with wearable health devices.
* AI-based glucose prediction and diet recommendations.
* Push notifications for medication reminders.

---

## 👨‍💻 Developed by

**Abdullah Essam**
AI & Flutter Developer
📍 Ahmed Deifallah Applied Technology School| Egypt

---

## 🧾 License

This project is licensed under the **MIT License** — you are free to use and modify it.

---

### ⭐ If you like this project, don't forget to star the repo!
