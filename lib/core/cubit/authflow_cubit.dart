import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authflow_state.dart';

class AuthflowCubit extends Cubit<AuthflowState> {
  AuthflowCubit()
      : super(
          (const AuthflowState(status: Status.initial)),
        ) {
    authCheck();
    // authFw();
  }

  authCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var status = prefs.getBool("accountStatus");
    if (status != null && status == true) {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          emit(const AuthflowState(status: Status.login));
        } else {
          emit(const AuthflowState(status: Status.logout));
        }
      });
    } else {
      emit(const AuthflowState(status: Status.logout));
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut().then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("accountStatus");
      emit(const AuthflowState(status: Status.logout));

    });
  }

  authFw() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        emit(const AuthflowState(status: Status.login));
      } else {
        emit(const AuthflowState(status: Status.logout));
      }
    });
  }

  signin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("accountStatus", true);
    emit(const AuthflowState(status: Status.login));
  }
}
