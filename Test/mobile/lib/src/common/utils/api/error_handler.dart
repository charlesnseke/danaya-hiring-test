
import 'package:testtech/src/common/ka/extensions/string_extension.dart';

class ErrorHandler {

  static String handleCaughtError(Object err) {
    if (err is Exception) {
      return err.toString().splitExceptionMsg;
    }
    return err.toString();
  }

}