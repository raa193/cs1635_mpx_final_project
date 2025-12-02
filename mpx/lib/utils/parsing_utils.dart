DateTime? safeParseDate(String? value) {
  if (value == null) return null;
  try {
    return DateTime.parse(value);
  } catch (_) {
    return null;
  }
}