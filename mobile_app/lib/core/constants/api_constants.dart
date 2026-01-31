class ApiConstants {
  // Base URL for the FastAPI backend
  // Assume running locally on default FastAPI port
  static const String baseUrl = 'http://127.0.0.1:8000';
  
  // Endpoints
  static const String patients = '/patients';
  static const String medications = '/medications';
  static const String schedules = '/schedules';
}
