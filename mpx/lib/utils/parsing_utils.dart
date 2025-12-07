
import 'package:mpx/l10n/app_localizations.dart';

DateTime? safeParseDate(String? value) {
  if (value == null) return null;
  try {
    return DateTime.parse(value);
  } catch (_) {
    return null;
  }
}

String getLocalizedStatus(String? status, AppLocalizations t) {
  if (status == null) return t.unknown;
  switch (status.toLowerCase()) {
    case 'scheduled':
      return t.scheduled;
    case 'active':
      return t.active;
    case 'landed':
      return t.landed;
    case 'cancelled':
      return t.cancelled;
    case 'incident':
      return t.incident;
    case 'diverted':
      return t.diverted;
    default:
      return t.unknown;
  }
}

extension StringExtensions on String {
  String capitalize() {
    if (this.isEmpty) {
      return this; // Return empty string if input is empty
    }
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}