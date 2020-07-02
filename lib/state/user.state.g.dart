// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserState on _UserState, Store {
  final _$googleAccountAtom = Atom(name: '_UserState.googleAccount');

  @override
  GoogleSignInAccount get googleAccount {
    _$googleAccountAtom.reportRead();
    return super.googleAccount;
  }

  @override
  set googleAccount(GoogleSignInAccount value) {
    _$googleAccountAtom.reportWrite(value, super.googleAccount, () {
      super.googleAccount = value;
    });
  }

  final _$loadingUserAtom = Atom(name: '_UserState.loadingUser');

  @override
  bool get loadingUser {
    _$loadingUserAtom.reportRead();
    return super.loadingUser;
  }

  @override
  set loadingUser(bool value) {
    _$loadingUserAtom.reportWrite(value, super.loadingUser, () {
      super.loadingUser = value;
    });
  }

  final _$initUserCalledAtom = Atom(name: '_UserState.initUserCalled');

  @override
  bool get initUserCalled {
    _$initUserCalledAtom.reportRead();
    return super.initUserCalled;
  }

  @override
  set initUserCalled(bool value) {
    _$initUserCalledAtom.reportWrite(value, super.initUserCalled, () {
      super.initUserCalled = value;
    });
  }

  final _$firebaseUserAtom = Atom(name: '_UserState.firebaseUser');

  @override
  FirebaseUser get firebaseUser {
    _$firebaseUserAtom.reportRead();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(FirebaseUser value) {
    _$firebaseUserAtom.reportWrite(value, super.firebaseUser, () {
      super.firebaseUser = value;
    });
  }

  final _$iconAtom = Atom(name: '_UserState.icon');

  @override
  Icon get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(Icon value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  final _$userAtom = Atom(name: '_UserState.user');

  @override
  FirebaseUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$contactTextAtom = Atom(name: '_UserState.contactText');

  @override
  String get contactText {
    _$contactTextAtom.reportRead();
    return super.contactText;
  }

  @override
  set contactText(String value) {
    _$contactTextAtom.reportWrite(value, super.contactText, () {
      super.contactText = value;
    });
  }

  final _$initUserAsyncAction = AsyncAction('_UserState.initUser');

  @override
  Future initUser() {
    return _$initUserAsyncAction.run(() => super.initUser());
  }

  final _$handleSignInAsyncAction = AsyncAction('_UserState.handleSignIn');

  @override
  Future<void> handleSignIn() {
    return _$handleSignInAsyncAction.run(() => super.handleSignIn());
  }

  final _$signIntoFirebaseAsyncAction =
      AsyncAction('_UserState.signIntoFirebase');

  @override
  Future signIntoFirebase() {
    return _$signIntoFirebaseAsyncAction.run(() => super.signIntoFirebase());
  }

  final _$handleGetContactAsyncAction =
      AsyncAction('_UserState.handleGetContact');

  @override
  Future handleGetContact() {
    return _$handleGetContactAsyncAction.run(() => super.handleGetContact());
  }

  final _$_UserStateActionController = ActionController(name: '_UserState');

  @override
  Future<void> handleSignOut() {
    final _$actionInfo = _$_UserStateActionController.startAction(
        name: '_UserState.handleSignOut');
    try {
      return super.handleSignOut();
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic uploadFirestoreData() {
    final _$actionInfo = _$_UserStateActionController.startAction(
        name: '_UserState.uploadFirestoreData');
    try {
      return super.uploadFirestoreData();
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final _$actionInfo = _$_UserStateActionController.startAction(
        name: '_UserState._pickFirstNamedContact');
    try {
      return super._pickFirstNamedContact(data);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
googleAccount: ${googleAccount},
loadingUser: ${loadingUser},
initUserCalled: ${initUserCalled},
firebaseUser: ${firebaseUser},
icon: ${icon},
user: ${user},
contactText: ${contactText}
    ''';
  }
}
