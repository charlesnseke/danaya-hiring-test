
class AppException implements Exception {
  AppException({required this.message});

  final String message ;

  @override
  String toString(){
    return message;
  }
}