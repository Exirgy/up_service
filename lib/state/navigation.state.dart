import 'package:mobx/mobx.dart';

part 'navigation.state.g.dart';

class NavigationState = _NavigationState with _$NavigationState;
final OnMenuTap _onMenuTap = OnMenuTap.instance;

abstract class _NavigationState with Store {}
