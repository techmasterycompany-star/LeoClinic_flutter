# LeoClinic Flutter

LeoClinic is a Flutter-based medical application developed with a scalable feature-based architecture and a clear separation of responsibilities between the presentation, business logic, and data layers.

The project focuses on providing a structured foundation for healthcare-related features while maintaining clean and maintainable Flutter code.

## Features

* Authentication
* User registration and login
* Email verification
* Forgot password
* Password reset
* Appointment management
* Doctor features
* Patient features
* Profile management
* Admin features
* REST API integration
* Responsive UI

## Architecture

The project follows a feature-based architecture with separation between the main application layers.

```text
lib/
├── core/
├── features/
│   ├── admin/
│   ├── appointments/
│   ├── authentication/
│   ├── doctor/
│   ├── patient/
│   └── profile/
├── home.dart
└── main.dart
```

The features are organized according to their responsibilities, helping keep the project maintainable and scalable as new functionality is added.

## Authentication Architecture

The authentication feature is separated into:

```text
authentication/
├── business_logic/
│   └── cubit/
├── data/
│   ├── datasource/
│   ├── models/
│   └── repositories/
└── presentation/
    ├── pages/
    └── widgets/
```

The authentication flow follows:

```text
UI
 ↓
Cubit
 ↓
Repository
 ↓
API Service
 ↓
Backend
```

### Authentication Features

* Login
* Sign up
* Email verification
* Forgot password
* Reset password
* Password change
* User data handling
* Authentication API integration
* Request and response models
* Repository pattern
* Cubit state management
* Reusable authentication widgets

## My Contributions

My main contributions to LeoClinic include the following:

### Project Architecture

* Designed and implemented the overall project architecture.
* Organized the application using a feature-based structure.
* Separated presentation, business logic, and data responsibilities.
* Structured the core project infrastructure.

### Core

Worked on the core application setup, including:

* Application colors
* Application constants
* API/networking setup
* API client
* API error handling
* API exception handling

### Authentication

Implemented the authentication feature, including:

* Login
* Sign up
* Email verification
* Forgot password
* Reset password
* Authentication API integration
* Request and response models
* Repository layer
* Cubit and state management
* Authentication screens
* Reusable authentication widgets

### Intro

Implemented the application's intro experience.

## Tech Stack

* Flutter
* Dart
* Flutter BLoC / Cubit
* Dio
* REST API
* GoRouter
* SharedPreferences
* Flutter ScreenUtil
* Flutter SVG
* Font Awesome
* Git / GitHub

## Authentication Flow

A typical login request follows this flow:

```text
Login Screen
     ↓
AuthCubit
     ↓
Login Repository
     ↓
Auth API Service
     ↓
Backend API
     ↓
Response
     ↓
Repository
     ↓
AuthCubit
     ↓
Success / Error State
     ↓
UI
```

Request data is represented using request models and converted to JSON before being sent to the API.

API responses are converted into response models before being passed through the application layers.

## Project Status

The Flutter frontend is functional from the implemented features.

The authentication flow is implemented. The OTP verification flow is currently dependent on a backend API update to return an OTP instead of the current token-based response.

## Main Packages

* `flutter_bloc`
* `equatable`
* `dio`
* `flutter_screenutil`
* `flutter_svg`
* `go_router`
* `font_awesome_flutter`
* `shared_preferences`

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/techmasterycompany-star/LeoClinic_flutter.git
```

### 2. Navigate to the project

```bash
cd LeoClinic_flutter
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

## Project Structure

The project is organized around independent features to make the application easier to maintain and extend.

Each feature can contain its own presentation, business logic, and data layers depending on its requirements.

## Team Project

LeoClinic is a team project. The contributions described above represent the areas I personally worked on within the project.

## License

This project is developed as part of a team project.
