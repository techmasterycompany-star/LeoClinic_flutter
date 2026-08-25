class ApiError {
  String message;
  int? statuscode;
  ApiError({required this.message, this.statuscode});
  String tostring() {
    return "error is $message and statuscode is $statuscode";
  }
}
