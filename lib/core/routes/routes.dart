abstract class Routes {
  static String auth = '/auth';
  static String login = 'login';
  static String studentSignup = 'student_signup';
  static String adminSignup = 'admin_signup';

  static String home = '/home';
  static String transaction = '/transaction';
  static String article = '/article';
  static String settings = '/settings';
}

extension Name on String {
  String get name {
    if (startsWith('/')) {
      return split('/').last;
    }
    return this;
  }
}
