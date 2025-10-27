// lib/core/utils/shared_utils.dart
import 'package:intl/intl.dart';

// Placeholder for SharedUtils
class SharedUtils {
  static int calculateNights(DateTime start, DateTime end) {
    return end.difference(start).inDays;
  }

  static String formatDate(DateTime date) {
    // Example: Jan 16
    return '${_months[date.month - 1]} ${date.day}';
  }

  static const List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
}