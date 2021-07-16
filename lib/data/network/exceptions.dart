class AppError implements Exception {
  String errorMessgae;
  AppError(this.errorMessgae);
}

class BadInput extends AppError {
  BadInput(String errorMessgae) : super(errorMessgae);
}

class NotFound extends AppError {
  NotFound(String errorMessgae) : super(errorMessgae);
}
