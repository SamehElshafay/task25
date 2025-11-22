import 'dart:convert' hide utf8;

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future<void> init() ;

  Future get(String key);

  Future<bool> has(String key);

  Future<bool> put(String key, dynamic value);

  Future<bool> clear(String key);
}

@LazySingleton(as: CacheHelper)
class CacheImplementation extends CacheHelper {
  SharedPreferences _sharedPreferences;

  CacheImplementation(this._sharedPreferences);

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> has(String key) async
  {
    final bool f = await _basicErrorHandling(() async {
      return _sharedPreferences.containsKey(key) && _sharedPreferences.getString(key) != null;
    });
    return f;
  }

  @override
  Future<bool> clear(String key) async {
    final bool f = await _basicErrorHandling(() async {
      return await _sharedPreferences.remove(key);
    });
    return f;
  }

  @override
  Future get(String key) async {
    final f = await _basicErrorHandling(() async {
      if (await has(key)) {
        return await jsonDecode(_sharedPreferences.getString(key)!);
      }
      return null;
    });
    return f;
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    final bool f = await _basicErrorHandling(() async
    {
      return await _sharedPreferences.setString(key, jsonEncode(value));
    });
    return f;
  }
}

extension on CacheHelper {
  Future<T> _basicErrorHandling<T>(Future<T> Function() onSuccess) async {
    try {
      final f = await onSuccess();
      return f;
    } catch (e)
    {
      if (kDebugMode) {
        print(e);
      }
      return await onSuccess();
    }
  }
}