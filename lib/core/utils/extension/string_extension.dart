import 'package:intl/intl.dart';

extension StringExtension on String {
  String formataData() {
    if (isEmpty) return '';

    if (contains(' ')) {
      DateTime tempDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(this);
      String date = DateFormat("dd/MM/yyyy").format(tempDate);
      return date;
    }
    if (contains('T')) {
      DateTime tempDate = DateFormat('yyyy-MM-ddTHH:mm').parse(this);
      String date = DateFormat("dd/MM/yyyy").format(tempDate);
      return date;
    }

    return this;
  }
}