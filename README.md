# shobra_store_app

A new Flutter project.

## Getting Started

# 🛍️ Shobra Store - Flutter Mobile App

تطبيق متجر إلكتروني متكامل مبني بتقنية Flutter مع واجهة مستخدم عصرية ودعم كامل للغة العربية.
https://drive.google.com/file/d/10PXq3PtRzwahNshtSBqIa62zTgY3qEzi/view?usp=drivesdk

## ✨ المميزات

- 🏠 شاشة رئيسية مع عرض المنتجات
- 🔍 بحث وتصفية المنتجات حسب الفئات
- 🛒 سلة تسوق كاملة
- 📱 واجهة مستخدم سلسة وجذابة
- 🌐 دعم RTL للغة العربية
- 🎨 تصميم Material Design

## 🛠️ التقنيات المستخدمة

- **Flutter** - Framework للتطوير
- **Bloc/Cubit** - إدارة الحالة
- **Dio** - للاتصال بـ API
- **Dartz** - Functional Programming
- **Cached Network Image** - تحميل الصور
- **Flutter ScreenUtil** - Responsive Design
- **FakeStore API** - مصدر البيانات


## 📁 البنية المعمارية
lib/
├── core/
│   ├── theme/         # الألوان والتصاميم
│   └── repo/          # Repository Pattern
├── features/
│   └── products/
│       ├── data/      # Models & Services
│       └── presentation/
│           ├── cubits/     # State Management
│           ├── pages/      # الشاشات
│           └── widgets/    # المكونات القابلة لإعادة الاستخدام
└── main.dart

## 🚀 طريقة التشغيل

### المتطلبات الأساسية
- Flutter SDK (3.0.0 أو أحدث)
- Dart SDK
- Android Studio / VS Code
- محاكي Android/iOS أو جهاز حقيقي

### خطوات التشغيل

1. **استنساخ المشروع**
```bash
git clone https://github.com/YOUR_USERNAME/shobra-store-flutter-app.git
cd shobra-store-flutter-app
```

2. **تثبيت الحزم**
```bash
flutter pub get
```

3. **تشغيل التطبيق**
```bash
flutter run
```

4. **بناء APK للأندرويد**
```bash
flutter build apk --release
```

5. **بناء للـ iOS**
```bash
flutter build ios --release
```

## 📱 الشاشات

- **Home Screen**: عرض المنتجات مع فلتر الفئات
- **Product Details**: تفاصيل المنتج الكاملة
- **Cart Screen**: سلة التسوق مع إدارة الكميات
- **Receipt Screen**: سجل الطلبات
- **Settings Screen**: الإعدادات

## 🎨 الألوان

- اللون الأساسي: `#2B50D2`
- اللون الثانوي: `#FFFFFF`

## 📦 الحزم المستخدمة
```yaml
dependencies:
  flutter_bloc: ^8.1.3
  dio: ^5.3.3
  dartz: ^0.10.1
  cached_network_image: ^3.3.0
  flutter_screenutil: ^5.9.0
  carousel_slider: ^4.2.1
  shimmer_animation: ^2.1.0+1
```

## 👨‍💻 المطور

تم تطوير المشروع كجزء من تكليف Shobra Store


+20 1069727438 📞 التواصل

للاستفسارات والدعم، يرجى فتح Issue على GitHub
