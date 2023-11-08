import 'package:flutter/cupertino.dart';

import '../services/preferences_services.dart';

class PremiumManager extends ChangeNotifier{
  final PreferencesService _preferencesService;

  PremiumManager({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService{
    init();
  }

  bool _isPremium = false;

  bool get isPremium => _isPremium;

  void init() {
    _isPremium = _preferencesService.getPremium();
  }

  void onBuyPremium() async {
    _isPremium = true;
    await _preferencesService.setPremium();
    notifyListeners();
  }
}