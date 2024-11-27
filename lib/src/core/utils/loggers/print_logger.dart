import 'package:flutter/foundation.dart';

/// Print logs with default color text
void printDebug(Object? object, {String? title}) {
  if (kDebugMode) {
    if (title != null) {
      print('==============================');
      print('|*| [$title]: $object |*|');
      print('==============================');
    } else {
      print('==============================');
      print('|*| $object |*|');
      print('==============================');
    }
  }
}

/// Print error logs with red color text
void printError(Object? object, {String? title}) {
  if (kDebugMode) {
    if (title != null) {
      print('\x1B[31m==============================\x1B[0m');
      print('\x1B[31m|*| [ERROR -  $title]: $object |*|\x1B[0m');
      print('\x1B[31m==============================\x1B[0m');
    } else {
      print('\x1B[31m==============================\x1B[0m');
      print('\x1B[31m|*| [ERROR]: $object |*|\x1B[0m');
      print('\x1B[31m==============================\x1B[0m');
    }
  }
}

/// Print info logs with blue color text
void printInfo(Object? object, {String? title}) {
  if (kDebugMode) {
    if (title != null) {
      print('\x1B[34m==============================\x1B[0m');
      print('\x1B[34m|*| [INFO - $title]: $object |*|\x1B[0m');
      print('\x1B[34m==============================\x1B[0m');
    } else {
      print('\x1B[34m==============================\x1B[0m');
      print('\x1B[34m|*| [INFO]: $object |*|\x1B[0m');
      print('\x1B[34m==============================\x1B[0m');
    }
  }
}

/// Print success logs with green color text
void printSuccess(Object? object, {String? title}) {
  if (kDebugMode) {
    if (title != null) {
      print('\x1B[32m==============================\x1B[0m');
      print('\x1B[32m|*| [SUCCESS - $title]: $object |*|\x1B[0m');
      print('\x1B[32m==============================\x1B[0m');
    } else {
      print('\x1B[32m==============================\x1B[0m');
      print('\x1B[32m|*| [SUCCESS]: $object |*|\x1B[0m');
      print('\x1B[32m==============================\x1B[0m');
    }
  }
}

/// Print warning logs with yellow color text
void printWarning(Object? object, {String? title}) {
  if (kDebugMode) {
    if (title != null) {
      print('\x1B[33m==============================\x1B[0m');
      print('\x1B[33m|*| [WARNING - $title]: $object |*|\x1B[0m');
      print('\x1B[33m==============================\x1B[0m');
    } else {
      print('\x1B[33m==============================\x1B[0m');
      print('\x1B[33m|*| [WARNING]: $object |*|\x1B[0m');
      print('\x1B[33m==============================\x1B[0m');
    }
  }
}
