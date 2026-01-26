from fastapi import APIRouter
from app.api.v1.endpoints import auth, users, medications, schedules, reminders, caregivers

api_router = APIRouter()
api_router.include_router(auth.router, prefix="/auth", tags=["auth"])
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(medications.router, prefix="/medications", tags=["medications"])
api_router.include_router(schedules.router, prefix="/schedules", tags=["schedules"])
api_router.include_router(reminders.router, prefix="/reminders", tags=["reminders"])
api_router.include_router(caregivers.router, prefix="/caregivers", tags=["caregivers"])
