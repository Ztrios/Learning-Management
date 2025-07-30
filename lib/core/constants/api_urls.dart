class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  static const String _baseURL = "http://192.168.20.253:9090";
  static const String _imageBaseURL = "";

  // auth API endpoints
  static const String signIn = "/api/v1/auth/login";
  static const String signUp = "/api/v1/students";
  static const String resetPassword = "/api/v1/auth/reset-password";
  static const String sections = "/api/v1/sections";

  // Home page API endpoints
  static const String studentSubjects = "/api/v1/subjects";
  static const String studentTasks = "/api/v1/students/upcoming-task";
  static const String todaysClass = "/api/v1/section-day-schedules/section/";
  static const String classRoutines = "/api/v1/section-day-schedules/section/";
  static const String announcement = "/api/v1/announcements";


  // Results Page API endpoints
  static const String studentResults = "/api/v1/students/";


  // Profile Page API endpoints
  static const String studentProfile = "/api/v1/students/";


  // Lessions Page API endpoints
  static const String subjectLessions = "/api/v1/lessons/subjects/";
  static const String subjectExams = "/api/v1/exams/subjects/";


  // Public getter to access the base URL
  static String get baseURL => _baseURL;
  static String get imageBaseURL => _imageBaseURL;

}

