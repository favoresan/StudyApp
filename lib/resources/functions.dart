import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/resources/provider.dart';
import 'package:study_app/resources/route_manager.dart';
import 'package:study_app/widgets/dialogs/dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/question_model.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
final drawerController = ZoomDrawerController();
User? user = _auth.currentUser;
toggle() {
  drawerController.toggle?.call();
}

User? getUser() {
  user = _auth.currentUser!;
  return user;
}

void signIn() {}

Future<void> signOut(context, ref) async {
  logger.d('sign out');
  try {
    await _auth.signOut();
    ref.read(nameProvider.notifier).state = _auth.currentUser;

    Navigator.pushNamed(context, Routes.mainRoute);
  } on FirebaseAuthException catch (err) {
    logger.e(err);
  }
}

void website() {
  _launch(Uri(
    host: 'google.com',
    scheme: 'https',
  ));
}

void facebook() {
  _launch(Uri(
    host: 'facebook.com',
    scheme: 'https',
  ));
}

void email() {
  final Uri emailLauncherUri = Uri(
    scheme: 'mailto',
    path: 'info@dbestech.com',
  );
  _launch(emailLauncherUri);
}

//!=open in default browser
Future<void> _launch(Uri url) async {
  if (!await launchUrl(url)) {
    throw 'could not launch $url';
  }
}

var logger = Logger();
signInWithGoogle(BuildContext context, WidgetRef ref) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try {
    GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      final authAcct = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: authAcct.idToken,
        accessToken: authAcct.accessToken,
      );
      await _auth.signInWithCredential(credential);
      await saveUser(account);
      ref.read(nameProvider.notifier).state = _auth.currentUser;
      Navigator.pushNamed(context, Routes.mainRoute);
    }
  } on Exception catch (err) {
    logger.e(err);
  }
}

saveUser(GoogleSignInAccount account) {
  userRef.doc(account.email).set({
    'email': account.email,
    'name': account.displayName,
    'profilePic': account.photoUrl,
  });
}

void showLoginAlertDialogue(BuildContext context) {
  Dialogs.questionStartDialogue(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.loginRoute);
      },
      context: context);
}

bool isLoggedIn() {
  return _auth.currentUser != null;
}

void navigateToQ(
    {bool tryAgain = false,
    required Subject paper,
    required BuildContext context}) {
  if (isLoggedIn()) {
    if (tryAgain) {
      Navigator.pop(context);
    } else {
      print(
        'logged in',
      );
    }
  } else {
    showLoginAlertDialogue(context);
  }
}
