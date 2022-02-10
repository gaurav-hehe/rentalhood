import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RentalHood1FirebaseUser {
  RentalHood1FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RentalHood1FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RentalHood1FirebaseUser> rentalHood1FirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<RentalHood1FirebaseUser>(
        (user) => currentUser = RentalHood1FirebaseUser(user));
