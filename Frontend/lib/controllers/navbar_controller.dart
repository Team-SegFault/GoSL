class Navbarcontroller {
  static final Navbarcontroller _singleton = Navbarcontroller._internal();
  factory Navbarcontroller() {
    return _singleton;
  }
  Navbarcontroller._internal();
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setIndex(int index) {
    _currentIndex = index;
  }
}
