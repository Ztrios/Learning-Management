class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  static const String _baseURL = "http://192.168.20.253:9090";
  static const String _imageBaseURL = "";

  // auth API endpoints
  static const String signIn = "/api/v1/auth/login";
  static const String signUp = "/api/v1/students";
  static const String sections = "/api/v1/sections";

  // Home page API endpoints
  static const String studentSubjects = "/api/v1/subjects";
  static const String studentTasks = "/api/v1/students/upcoming-task";
  static const String todaysClass = "/api/v1/section-day-schedules/section/";
  static const String announcement = "/api/v1/announcements";


  // Public getter to access the base URL
  static String get baseURL => _baseURL;
  static String get imageBaseURL => _imageBaseURL;

}

