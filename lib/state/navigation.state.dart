import 'package:mobx/mobx.dart';

part 'navigation.state.g.dart';

class NavigationState = _NavigationState with _$NavigationState;

//final Function onMenuTap;
//this is the store class
abstract class _NavigationState with Store {
  @observable
  bool isClicked = false;
}
