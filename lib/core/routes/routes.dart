abstract class Routes {
  static String home = '/home';
}

extension Name on String {
  String get name {
    if (startsWith('/')) {
      return split('/').last;
    }
    return this;
  }
}
