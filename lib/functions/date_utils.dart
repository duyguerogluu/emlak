import 'package:intl/intl.dart';

final _trDateFormat = DateFormat('dd/MM/yyyy');

extension DuyguDateFormatter on DateTime {
  String dMMMy() => _trDateFormat.format(this);
}
