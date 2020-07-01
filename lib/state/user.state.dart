import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import "package:http/http.dart" as http;

part 'user.state.g.dart';

//This is the class used by the rest of your codebase
class UserState = _UserState with _$UserState;
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
final FirebaseAuth _auth = FirebaseAuth.instance;

abstract class _UserState with Store {
  @observable
  GoogleSignInAccount googleAccount;

  @observable
  FirebaseUser firebaseUser;

  @observable
  bool loadingUser = false;

  @observable
  bool initUserCalled = false;

  @observable
  Icon icon;

  @observable
  FirebaseUser user;

  @observable
  String contactText;

  @action
  void setUser(u) {
    firebaseUser = u;
  }

  @action
  initUser() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      googleAccount = account;
      // update mobx
      signIntoFirebase();
      if (googleAccount != null) {
        handleGetContact();
        signIntoFirebase();
      }
    });
    _googleSignIn.signInSilently();
  }

  @action
  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @action
  Future<void> handleSignOut() => _googleSignIn.disconnect();

  @action
  signIntoFirebase() async {
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential).then((value) {
      user = value.user;
    }).catchError((e) {
      log(e.toString());
      if (e is PlatformException) {
        PlatformException err = e;
        log('is platform exception');
        log(err.code.toString());
        log(err.details.toString());
        log(err.message.toString());
        if (err.code == 'ERROR_NETWORK_REQUEST_FAILED') {
        } else {}
      }
    });
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    uploadFirestoreData();
    debugPrint(user.toString());
    log('user final: ${user.displayName}');
  }

  @action
  uploadFirestoreData() {
    Map userData = {
      'email': user.email,
      'displayName': user.displayName,
      'uid': user.uid,
      'isEmailVerified': user.isEmailVerified,
      'phone': user.phoneNumber,
      'photoUrl': user.photoUrl,
      'created': Timestamp.fromDate(user.metadata.creationTime),
      'lastSignIn': Timestamp.fromDate(user.metadata.lastSignInTime),
    };

    Firestore.instance
        .collection('users')
        .document(user.uid)
        .setData({...userData}, merge: true).then((_) async {
      log('updated Firestore');
    }).catchError((e) => log('firestore update e: $e'));
  }

  @action
  handleGetContact() async {
    contactText = "Loading contact info...";
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await googleAccount.authHeaders,
    );
    if (response.statusCode != 200) {
      contactText = "People API gave a ${response.statusCode} "
          "response. Check logs for details.";
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    if (namedContact != null) {
      contactText = "I see you know $namedContact!";
    } else {
      contactText = "No contacts to display.";
    }
  }

  @action
  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }
}
