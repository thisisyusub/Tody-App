class GeneralException implements Exception {
  const GeneralException(this.message);

  final String message;

  @override
  String toString() => 'GeneralException: $message';
}
