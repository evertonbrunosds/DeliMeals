class Settings {
  late bool _isGlutenFree;
  late bool _isLactoseFree;
  late bool _isVegan;
  late bool _isVegetarian;

  Settings({
    bool isGlutenFree = false,
    bool isLactoseFree = false,
    bool isVegan = false,
    bool isVegetarian = false,
  }) {
    _isGlutenFree = isGlutenFree;
    _isLactoseFree = isLactoseFree;
    _isVegan = isVegan;
    _isVegetarian = isVegetarian;
  }

  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(final bool value) {
    _isGlutenFree = value;
  }

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(final bool value) {
    _isLactoseFree = value;
  }

  bool get isVegan => _isVegan;

  set isVegan(final bool value) {
    _isVegan = value;
  }

  bool get isVegetarian => _isVegetarian;

  set isVegetarian(final bool value) {
    _isVegetarian = value;
  }
}
