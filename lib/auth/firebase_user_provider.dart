import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RentalHoodFirebaseUser {
  RentalHoodFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RentalHoodFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RentalHoodFirebaseUser> rentalHoodFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RentalHoodFirebaseUser>(
            (user) => currentUser = RentalHoodFirebaseUser(user));
