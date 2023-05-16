class NotFoundSessionException implements Exception {
  final String message;

  NotFoundSessionException(this.message);

  @override
  String toString() {
    return message;
  }
}