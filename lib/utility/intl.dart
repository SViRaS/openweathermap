import 'package:intl/intl.dart';
class NoBody {
static String getFormattedDate(DateTime dateTime) {
  return DateFormat('EEEE, MMMM d, y').format(dateTime);
}
}