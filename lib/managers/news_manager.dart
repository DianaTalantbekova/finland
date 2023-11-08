import 'package:flutter/cupertino.dart';

import '../models/news.dart';
import '../services/preferences_services.dart';
import '../utils/news.dart';
import 'finland_route_manager.dart';

class NewsManager extends ChangeNotifier {
  List<News> favorites = [];
  RouteSortType selected = RouteSortType.all;
  final PreferencesService service;

  NewsManager({required this.service}){
    init();
  }

  bool get isEmpty => actualList.isEmpty;

  List<News> get actualList => switch (selected) {
    RouteSortType.all => NewsHelper.news,
    RouteSortType.favorite => favorites,
  };

  void toggleFavorite(News news) {
    if (isFavorite(news)) {
      favorites.remove(news);
    } else {
      favorites.add(news);
    }
    save();
    notifyListeners();
  }

  bool isFavorite(News news) =>
      favorites.contains(news);

  void onChange(RouteSortType value) {
    selected = value;
    notifyListeners();
  }

  void init() {
    final ids = service.getFavorites2();
    favorites = NewsHelper.news
        .where((element) => ids.contains(element.id))
        .toList();
    notifyListeners();
  }

  void save() {
    final ids = favorites.map((e) => e.id).toList();
    service.setFavorites2(ids);
  }
}
