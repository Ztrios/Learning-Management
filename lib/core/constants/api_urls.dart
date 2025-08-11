class ApiUrls {
  // Private constructor to prevent instantiation
  ApiUrls._();

  //static const String _baseURL = "https://lms.shaheen.edu.bd";
  static const String _baseURL = "http://192.168.20.244:9090";
  static const String _imageBaseURL = "";

  // auth API endpoints
  static const String signIn = "/api/v1/auth/login";
  static const String signUp = "/api/v1/students";
  static const String resetPassword = "/api/v1/auth/reset-password";
  static const String refreshToken = "/api/v1/auth/refresh";
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
  static const String lessionDetails = "/api/v1/lessons/";
  static const String lessionAssignment = "/api/v1/assignments/lesson/";
  static const String assignmentDetails = "/api/v1/assignments/";
  static const String assignmentSubmit = "/api/v1/assignment-submissions";
  static const String lessionQuiz = "/api/v1/quizzes/lesson/";
  static const String quizQuestions = "/api/v1/quizzes/";
  static const String quizSubmit = "/api/v1/quiz-submissions";
  static const String subjectExams = "/api/v1/exams/subjects/";
  static const String examDetails = "/api/v1/exams/";
  static const String submitExam = "/api/v1/exam-submissions";


  // Payments Page API endpoints
  static const String invoice = "/api/v1/student-payments/payable/student/";
  static const String createPayment = "/api/v1/student-payments/initiate";
  static const String verifyPayment = "/api/v1/student-payments/verify";
  static const String paymentHistory = "/api/v1/student-payments";


  // Public getter to access the base URL
  static String get baseURL => _baseURL;
  static String get imageBaseURL => _imageBaseURL;

}