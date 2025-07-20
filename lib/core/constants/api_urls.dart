class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  static const String _baseURL = "https://backend.khabaar.food/api/v1";
  static const String _imageBaseURL = "https://pub-fd7ac8a0bbb44eb78df5ac30521bf4ed.r2.dev/";

  // Authentication API endpoints
  static const String signIn = "/api/v1/auth/login";
  static const String signUp = "/api/v1/students";


  // Public getter to access the base URL
  static String get baseURL => _baseURL;
  static String get imageBaseURL => _imageBaseURL;

}

