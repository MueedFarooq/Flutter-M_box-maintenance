# Maintenance Box - Car Service App

A Flutter mobile app for car repair, sale, and purchase with role-based login and persistent sessions.

## 📱 Screenshots
<img width="444" height="933" alt="image" src="https://github.com/user-attachments/assets/ff4f07d9-aabe-4124-8377-79f26a58634b" />
<img width="443" height="877" alt="image" src="https://github.com/user-attachments/assets/b647f867-ff14-4764-8c38-d29588a80337" />
<img width="443" height="877" alt="image" src="https://github.com/user-attachments/assets/64b165ae-4c49-4c7b-a9d8-ee81b1de84ed" />
<img width="440" height="875" alt="image" src="https://github.com/user-attachments/assets/701c9a27-81f7-4ee2-b11b-11022f22d7f5" />


## ✨ Features

- **Role-based Login**: Car Repairer, Seller, or Buyer options
- **Persistent Sessions**: Stay logged in using SharedPreferences  
- **Animated Splash Screen**: Rotating text animation
- **Form Validation**: Signup with password matching
- **Custom Widgets**: Reusable UI components
- **Secure Logout**: Clear sessions and redirect

## 🛠️ Built With

- **Flutter** - Mobile framework
- **Dart** - Programming language
- **SharedPreferences** - Local storage
- **Animated Text Kit** - Splash animations

## 🚀 Getting Started

```bash
# Clone and run
git clone https://github.com/yourusername/maintenance-box-app.git
cd maintenance-box-app
flutter pub get
flutter run
```

## 💡 How It Works

### Authentication Flow
```dart
// Store user session
SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString('role', selectedRole);
await prefs.setBool('isLogin', true);
```

### App Flow
```
Splash Screen → Check Login → Role Dashboard
```

## 🎯 User Roles

- **🔧 Car Repairer**: Service management dashboard
- **🏪 Seller**: Car listing and sales interface  
- **🛒 Buyer**: Browse and purchase cars

## 📚 What I Learned

- Role-based authentication in Flutter
- SharedPreferences for data persistence
- Custom reusable widgets
- Navigation routing based on user roles
- Form validation and error handling

---

**Flutter car service app with authentication 🚗**
