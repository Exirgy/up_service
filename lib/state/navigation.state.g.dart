// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationState on _NavigationState, Store {
  final _$isClickedAtom = Atom(name: '_NavigationState.isClicked');

  @override
  bool get isClicked {
    _$isClickedAtom.reportRead();
    return super.isClicked;
  }

  @override
  set isClicked(bool value) {
    _$isClickedAtom.reportWrite(value, super.isClicked, () {
      super.isClicked = value;
    });
  }

  final _$currentPageAtom = Atom(name: '_NavigationState.currentPage');

  @override
  NavigationScreen get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(NavigationScreen value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$showMenuAtom = Atom(name: '_NavigationState.showMenu');

  @override
  bool get showMenu {
    _$showMenuAtom.reportRead();
    return super.showMenu;
  }

  @override
  set showMenu(bool value) {
    _$showMenuAtom.reportWrite(value, super.showMenu, () {
      super.showMenu = value;
    });
  }

  @override
  String toString() {
    return '''
isClicked: ${isClicked},
currentPage: ${currentPage},
showMenu: ${showMenu}
    ''';
  }
}
