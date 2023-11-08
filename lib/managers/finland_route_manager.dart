import 'package:finland/models/finland_route.dart';
import 'package:finland/services/preferences_services.dart';
import 'package:finland/utils/finland_routes.dart';
import 'package:flutter/cupertino.dart';

enum RouteSortType {
  all,
  favorite,
}

class FinlandRouteManager extends ChangeNotifier {
  List<FinlandRoute> favorites = [];
  RouteSortType selected = RouteSortType.all;
  final PreferencesService service;

  FinlandRouteManager({required this.service}) {
    init();
  }

  bool get isEmpty => actualList.isEmpty;

  List<FinlandRoute> get actualList => switch (selected) {
        RouteSortType.all => FinlandRouteHelper.finlandRoutes,
        RouteSortType.favorite => favorites,
      };

  void toggleFavorite(FinlandRoute finlandRoute) {
    if (isFavorite(finlandRoute)) {
      favorites.remove(finlandRoute);
    } else {
      favorites.add(finlandRoute);
    }
    save();
    notifyListeners();
  }

  bool isFavorite(FinlandRoute finlandRoute) =>
      favorites.contains(finlandRoute);

  void onChange(RouteSortType value) {
    selected = value;
    notifyListeners();
  }

  void init() {
    final ids = service.getFavorites1();
    favorites = FinlandRouteHelper.finlandRoutes
        .where((element) => ids.contains(element.id))
        .toList();
    notifyListeners();
  }

  void save() {
    final ids = favorites.map((e) => e.id).toList();
    service.setFavorites1(ids);
  }
}
