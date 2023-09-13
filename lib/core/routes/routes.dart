abstract class Routes {
  static String auth = '/auth';
  static String login = 'login';
  static String studentSignup = 'student_signup';
  static String adminSignup = 'admin_signup';

  static String home = '/home';
  static String createBill = 'create_bill';

  static String transaction = '/transaction';
  static String reciept = 'reciept/:id';

  static String article = '/article';

  static String settings = '/settings';
  static String profile = 'profile';
  static String changePassword = 'change_password';

  static String browser = '/broswer';
}

extension Name on String {
  String get name {
    if (startsWith('/')) {
      return split('/').last;
    }
    return this;
  }
}
