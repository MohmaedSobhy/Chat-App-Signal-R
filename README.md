# 💬 Real-Time Chat App Frontend (Flutter)

This is a **Flutter mobile application** that serves as the frontend for a real-time chat system. It connects to a **C# ASP.NET Core Web API** backend and enables secure messaging between users with features like real-time messaging, typing indicators, and online/last seen status.

## ✨ Features

- 🔐 **User Authentication**
  - Register and login securely using JWT tokens
- 💬 **Real-Time Messaging**
  - Chat instantly with other users via SignalR WebSocket connection
- 📜 **Chat History**
  - View and load past messages with individual users
- 🧑‍💻 **Typing Indicators**
  - See when another user is typing in real-time
- 🟢 **User Presence**
  - Check if a user is online or see their last seen time
- 🧭 **Navigation**
  - Smooth navigation between login, chat list, chat screen, and profile

## 🛠️ Technologies Used

- **Flutter** – Cross-platform mobile development
- **Dart** – Programming language for Flutter
- **SignalR Client** – For real-time WebSocket communication
- **Provider / Riverpod** – State management
- **Dio / http** – REST API integration for login, registration, and chat history
- **JWT Storage** – Token management using `shared_preferences` or `flutter_secure_storage`

## 📂 Project Structure


