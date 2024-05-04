import 'package:intl/intl.dart';

extension GetFullDate on DateTime {
  String get formattedDate {
    return DateFormat('dd MMMM yyyy, hh:mm a', 'ar').format(this);
  }
}
