# MedTrack Mobile App (Flutter)

This directory contains the mobile frontend for MEDTRACK-OSS, built with Flutter.

## Purpose
The mobile application serves as a portable interface for caregivers and patients to access the MedTrack system. It connects to the existing Python FastAPI backend.
This project was initialized using `flutter create mobile_app` and restructured to follow a Clean Architecture approach.

## Architecture
The project follows a clean, feature-base modular architecture:

- `lib/main.dart`: Entry point.
- `lib/app.dart`: Application setup and routing.
- `lib/core/`: Shared constants and utilities.
- `lib/features/`: Feature-specific code (UI, Logic).
  - `home/`: Dashboard.
  - `patients/`: Patient management.
  - `medications/`: Medication inventory.
  - `schedules/`: Dosage schedules.
  - `reminders/`: Notification system.
- `lib/models/`: Data models maping to backend schemas.
- `lib/services/`: API communication layer.
- `lib/widgets/`: Reusable UI components.

## Backend Connection
The app connects to the FastAPI backend.
Configuration is located in `lib/core/constants/api_constants.dart`.
Default URL: `http://127.0.0.1:8000` (for local development).

## Getting Started

1.  **Prerequisites**: Ensure you have Flutter SDK installed.
2.  **Dependencies**: Run `flutter pub get` to install dependencies.
3.  **Run**:
    ```bash
    flutter run
    ```

## Contributing
- Keep features modular.
- Use the `lib/core` for shared logic.
- Follow the existing folder structure.
