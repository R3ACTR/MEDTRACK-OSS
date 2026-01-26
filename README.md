# MedTrack OSS 🏥 – Open Medication & Health Reminder System

MedTrack OSS is a production-ready, open-source medication management and adherence tracking system. Designed for individuals and caregivers, it provides a reliable way to manage medication schedules, receive timely reminders, and monitor adherence with privacy-first principles.

---

## 🚀 Key Features

- **Multi-User Support**: Individual profiles for multiple patients.
- **Dynamic Scheduling**: Support for daily, weekly, and custom medication intervals.
- **Caregiver Monitoring**: Real-time adherence tracking for caregivers (opt-in).
- **Notification Engine**: Pluggable system for Email, SMS, and Push notifications.
- **ML Privacy**: Localized AI for pill recognition (Optional Module).
- **Cross-Platform**: Modern Astro/React web interface + Vanilla JS fallback.

## 🛠️ Technology Stack

- **Backend**: Python 3.10+, FastAPI, PostgreSQL/MongoDB, Celery/APScheduler.
- **Frontend**: Astro + React Islands (Primary), Vanilla JS (Legacy/Lite).
- **Infrastructure**: Docker, Nginx.
- **Monitoring**: Prometheus & Grafana ready.

## 📂 Project Structure

```text
medtrack-oss/
 ├── backend/      # FastAPI Python API
 ├── frontend/     # Astro & React + Vanilla JS fallback
 ├── ml/           # Machine Learning modules
 ├── docs/         # Documentation (User, Caregiver, API)
 ├── docker/       # Containerization config
```

## 🚥 Quick Start

### 1. Prerequisite
- Docker & Docker Compose
- Python 3.10+
- Node.js 18+

### 2. Local Setup
```bash
# Clone the repository
git clone https://github.com/your-org/medtrack-oss.git
cd medtrack-oss

# Setup Backend
cd backend
cp .env.example .env
pip install -r requirements.txt
python app/main.py

# Setup Frontend (Astro)
cd ../frontend/astro
npm install
npm run dev
```

## 🤝 Contributing

We welcome contributions! Please read our [CONTRIBUTING.md](./CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) for details.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## ⚠️ Disclaimer

**Not a Medical Device.** MedTrack OSS is a reminder tool and should not be used for life-critical medication management without professional medical supervision.
