import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  static const premiumKey = 'PREMIUM';
  static const favorites1Key = "FAVORITES1";
  static const favorites2Key = "FAVORITES2";
  static const favorites3Key = "FAVORITES3";

  Future<void> setPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() {
    return _preferences.getBool(premiumKey) ?? false;
  }

  Future<void> setFavorites1(List<String> favorites) async {
    await _preferences.setStringList(favorites1Key, favorites);
  }

  List<String> getFavorites1() {
    return _preferences.getStringList(favorites1Key) ?? [];
  }

  Future<void> setFavorites2(List<String> favorites) async {
    await _preferences.setStringList(favorites2Key, favorites);
  }

  List<String> getFavorites2() {
    return _preferences.getStringList(favorites2Key) ?? [];
  }

  Future<void> setFavorites3(List<String> favorites) async {
    await _preferences.setStringList(favorites3Key, favorites);
  }

  List<String> getFavorites3() {
    return _preferences.getStringList(favorites3Key) ?? [];
  }
}
