// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

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

  @override
  String toString() {
    return '''
isClicked: ${isClicked}
    ''';
  }
}
