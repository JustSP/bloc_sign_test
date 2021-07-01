class CustomAppException {
  final String message;

  CustomAppException(this.message);

  @override
  String toString() => message;
}
