
DateTime? safeParseDate(String? value) {
  if (value == null) return null;
  try {
    return DateTime.parse(value);
  } catch (_) {
    return null;
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