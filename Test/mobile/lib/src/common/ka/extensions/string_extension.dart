extension StringExtension on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    
  }

 bool get isValidEmail {
    final emailRegex = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegex.hasMatch(this);
 } 

 String get splitExceptionMsg {
  return split('Exception')[1].trim();
 }
}