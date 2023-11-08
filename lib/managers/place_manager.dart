import 'package:finland/models/place.dart';
import 'package:finland/utils/places.dart';
import 'package:flutter/cupertino.dart';

import '../services/preferences_services.dart';
import 'finland_route_manager.dart';

class PlaceManager extends ChangeNotifier {
  late Category category;
  List<Place> places = [];
  List<Place> favoritePlaces = [];
  RouteSortType selected = RouteSortType.all;
  final PreferencesService service;

  bool get isEmpty => actualList.isEmpty;

  List<Place> get actualList => switch (selected) {
        RouteSortType.all => places,
        RouteSortType.favorite => sortedFavorites,
      };

  List<Place> get sortedFavorites {
    if (category == Category.popular) {
      return favoritePlaces
          .where((element) => element.ratingValue > 3000)
          .toList();
    }
    return favoritePlaces
        .where((element) => element.category == category)
        .toList();
  }

  void toggleFavorite(Place place) {
    if (isFavorite(place)) {
      favoritePlaces.remove(place);
    } else {
      favoritePlaces.add(place);
    }
    save();
    notifyListeners();
  }

  bool isFavorite(Place place) => favoritePlaces.contains(place);

  void onChange(RouteSortType value) {
    selected = value;
    notifyListeners();
  }

  PlaceManager(this.service) {
    category = Category.eat;
    selectCategory(Category.popular);
    init();
  }

  void selectCategory(Category category) {
    if (this.category == category) {
      return;
    }
    this.category = category;
    if (category == Category.popular) {
      places = PlacesHelper.places
          .where((element) => element.ratingValue > 3000)
          .toList();

    } else {
      places = PlacesHelper.places
          .where((element) => element.category == category)
          .toList();
    }
    notifyListeners();
  }

  void init() {
    final ids = service.getFavorites3();
    print(ids);
    favoritePlaces = PlacesHelper.places
        .where((element) => ids.contains(element.id))
        .toList();
    notifyListeners();
  }

  void save() {
    final ids = favoritePlaces.map((e) => e.id).toList();
    service.setFavorites3(ids);
  }
}
