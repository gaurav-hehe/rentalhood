import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int randomNum(String uid) {
  // return 5 digit unique integer
  var rng = math.Random();
  var randomInt = rng.nextInt(999999);
  return int.parse(uid) + randomInt;
}

double totalPriceCalc(
  double avail,
  double price,
) {
  // multiply two numbers
  return avail * price;
}
