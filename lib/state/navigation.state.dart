import 'package:mobx/mobx.dart';

part 'navigation.state.g.dart';

class NavigationState = _NavigationState with _$NavigationState;

enum NavigationScreen {
  Search,
  Categories,
  Messages,
  Reviews,
  Favorites,
  Settings,
}

//final Function onMenuTap;
//this is the store class
abstract class _NavigationState with Store {
  @observable
  bool isClicked = false;

  @observable
  NavigationScreen currentPage = NavigationScreen.Search;

  @observable
  bool showMenu = false;
}
