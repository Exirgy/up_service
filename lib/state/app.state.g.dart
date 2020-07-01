// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on _AppState, Store {
  Computed<Future<PackageInfo>> _$appInfoComputed;

  @override
  Future<PackageInfo> get appInfo =>
      (_$appInfoComputed ??= Computed<Future<PackageInfo>>(() => super.appInfo,
              name: '_AppState.appInfo'))
          .value;

  final _$appNameAtom = Atom(name: '_AppState.appName');

  @override
  String get appName {
    _$appNameAtom.reportRead();
    return super.appName;
  }

  @override
  set appName(String value) {
    _$appNameAtom.reportWrite(value, super.appName, () {
      super.appName = value;
    });
  }

  final _$packageNameAtom = Atom(name: '_AppState.packageName');

  @override
  String get packageName {
    _$packageNameAtom.reportRead();
    return super.packageName;
  }

  @override
  set packageName(String value) {
    _$packageNameAtom.reportWrite(value, super.packageName, () {
      super.packageName = value;
    });
  }

  final _$versionAtom = Atom(name: '_AppState.version');

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  final _$buildNumberAtom = Atom(name: '_AppState.buildNumber');

  @override
  String get buildNumber {
    _$buildNumberAtom.reportRead();
    return super.buildNumber;
  }

  @override
  set buildNumber(String value) {
    _$buildNumberAtom.reportWrite(value, super.buildNumber, () {
      super.buildNumber = value;
    });
  }

  final _$numAtom = Atom(name: '_AppState.num');

  @override
  int get num {
    _$numAtom.reportRead();
    return super.num;
  }

  @override
  set num(int value) {
    _$numAtom.reportWrite(value, super.num, () {
      super.num = value;
    });
  }

  final _$deviceWidthAtom = Atom(name: '_AppState.deviceWidth');

  @override
  double get deviceWidth {
    _$deviceWidthAtom.reportRead();
    return super.deviceWidth;
  }

  @override
  set deviceWidth(double value) {
    _$deviceWidthAtom.reportWrite(value, super.deviceWidth, () {
      super.deviceWidth = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AppState.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_AppStateActionController = ActionController(name: '_AppState');

  @override
  void setLoading(bool status) {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.setLoading');
    try {
      return super.setLoading(status);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPackageInfo() {
    final _$actionInfo = _$_AppStateActionController.startAction(
        name: '_AppState.setPackageInfo');
    try {
      return super.setPackageInfo();
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appName: ${appName},
packageName: ${packageName},
version: ${version},
buildNumber: ${buildNumber},
num: ${num},
deviceWidth: ${deviceWidth},
isLoading: ${isLoading},
appInfo: ${appInfo}
    ''';
  }
}
