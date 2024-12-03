extension StringExtension on String {

  String maskPhoneNumber() {
    if (length == 11) {
      String pre = substring(0, 3);
      String sufix = substring(7);
      return '$pre****$sufix';
    } else {
      return '***********';
    }
  }
}
