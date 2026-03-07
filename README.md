# Fruits Hub Dashboard ⚙️📊

A comprehensive administrative control panel built with Flutter to manage the Fruits E-Commerce ecosystem. This dashboard empowers store managers to easily control inventory, upload product images, and track customer orders in real-time.

> **Note:** This is the Admin Dashboard. To view the Customer App repository, [Click Here](#) *(Add your main app repo link here)*.

## ✨ Features

* **Product Management:** Add new products seamlessly with all related details (name, price, description, etc.).
* **Advanced Cloud Storage:** Utilizes **Supabase Storage** for highly efficient product image uploading and management.
* **Order Tracking:** Fetch real-time orders from customers, track their statuses, and update them dynamically (e.g., Pending, Processing, Delivered).
* **Real-time Synchronization:** Fully synced with the customer app via Firebase Cloud Firestore.

## 🛠️ Tech Stack & Architecture

Like the main application, this dashboard is built using a **Feature-Driven Architecture** to maintain a standardized and clean codebase across the entire platform.

* **Framework:** Flutter / Dart
* **State Management:** BLoC / Cubit
* **Database:** Firebase Cloud Firestore
* **Storage:** Supabase Storage & Firebase Storage
* **Dependency Injection:** GetIt