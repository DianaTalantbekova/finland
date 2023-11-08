enum Category {
  popular('Popular'),
  withTheKids('With the kids'),
  romantic('Romantic'),
  fromOnHigh('From on high'),
  eat('Eat'),
  walk('Walk'),
  ;

  const Category(this.value);

  final String value;
}

class Place {
  final String id;
  final String asset;
  final String name;
  final String rating;
  final Category category;
  final bool isPremium;
  final List<String> content;

  int get ratingValue {
    var temp = rating.split(' ')[0];
    return int.parse(temp);
  }

  Place({
    required this.id,
    required this.asset,
    required this.name,
    required this.rating,
    required this.category,
    this.isPremium = false,
    required this.content,
  });
}
