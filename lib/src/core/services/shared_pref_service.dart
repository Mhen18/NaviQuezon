import 'dart:convert';

import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

///{@template SharedPrefService}
/// Service for handling shared preferences
///{@endtemplate}
class SharedPrefService {
  /// *************** REMOVE SharedPref

  /// Method to remove the value in sharedPref
  ///
  Future<void> removeSharedPref(String key) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Remove data for the key.
    await prefs.remove(key);
    printInfo(key, title: 'SharedPref Removed');
  }

  /// *************** SET SharedPref

  /// Method to set integer value in sharedPref.
  ///
  Future<void> setIntSharedPref(
    String key, {
    required int value,
  }) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Save an integer value to key.
    await prefs.setInt(key, value);
    printInfo(value, title: 'SharedPrefInt Set $key');
  }

  /// Method to set boolean value in sharedPref.
  ///
  Future<void> setBoolSharedPref(
    String key, {
    required bool value,
  }) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Save an boolean value to key.
    await prefs.setBool(key, value);
    printInfo(value, title: 'SharedPrefBool Set $key');
  }

  /// Method to set double integer value in sharedPref.
  ///
  Future<void> setDoubleSharedPref(
    String key, {
    required double value,
  }) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Save an double value to key.
    await prefs.setDouble(key, value);
    printInfo(value, title: 'SharedPrefDouble Set $key');
  }

  /// Method to set string value in sharedPref.
  ///
  Future<void> setStringSharedPref(String key, String value) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Save an String value to key.
    await prefs.setString(key, value);
    printInfo(value, title: 'SharedPrefString Set $key');
  }

  /// Method to set list of string value in sharedPref.
  ///
  Future<void> setStringListSharedPref(String key, List<String> value) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Save an list of strings to key.
    await prefs.setStringList(key, value);
    printInfo(value, title: 'SharedPrefStringList Set $key');
  }

  /// Method to set json value in sharedPref.
  ///
  Future<void> setJsonSharedPref(
    String key,
    Map<String, dynamic> value,
  ) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Convert map to jsonEncode
    final json = jsonEncode(value);

    //  Save an list of strings to key.
    await prefs.setString(key, json);
    printInfo(value, title: 'SharedPrefJson Set $key');
  }

  /// *************** READ SharedPref

  /// Method to get integer value in sharedPref.
  ///
  Future<int?> readIntSharedPref(String key) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Try reading data from the 'counter' key. If
    //  it doesn't exist, returns null.
    final value = prefs.getInt(key);

    //  Return value of key.
    printInfo(value, title: 'SharedPrefInt Read $key');
    return value;
  }

  /// Method to get boolean value in sharedPref.
  ///
  Future<bool?> readBoolSharedPref(String key) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Try reading data from the 'repeat' key. If
    //  it doesn't exist, returns null.
    final value = prefs.getBool(key);

    //  Return value of key.
    printInfo(value, title: 'SharedPrefBool Read $key');
    return value;
  }

  /// Method to get double value in sharedPref.
  ///
  Future<double?> readDoubleSharedPref(String key) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Try reading data from the 'decimal' key.
    //  If it doesn't exist, returns null.
    final value = prefs.getDouble(key);

    //  return value of key.
    printInfo(value, title: 'SharedPrefDouble Read $key');
    return value;
  }

  /// Method to get string value in sharedPref.
  ///
  Future<String?> readStringSharedPref(String key) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Try reading data from the 'action' key.
    //  If it doesn't exist, returns null.
    final value = prefs.getString(key);

    //  Return value of key.
    printInfo(value, title: 'SharedPrefString Read $key');
    return value;
  }

  /// Method to get list of strings value in sharedPref.
  ///
  Future<List<String>?> readStringListSharedPref(String key) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Try reading data from the 'items' key.
    //  If it doesn't exist, returns null.
    final value = prefs.getStringList(key);

    //  Return value of key.
    printInfo(value, title: 'SharedPrefStringList Read $key');
    return value;
  }

  /// Method to get json value in sharedPref.
  ///
  Future<Map<String, dynamic>?> readJsonSharedPref(String key) async {
    //  Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    //  Try reading data from the 'items' key.
    //  If it doesn't exist, returns null.
    final value = prefs.getString(key);

    /// Check if value is not null.
    if (value != null) {
      //  Decode the string to json.
      final json = jsonDecode(value) as Map<String, dynamic>;

      printInfo(json, title: 'SharedPrefJson Read $key');
      return json;
    }

    //  return value of key.
    printInfo(value, title: 'SharedPrefJson Read $key');
    return null;
  }
}
