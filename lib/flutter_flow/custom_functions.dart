import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double totalPriceCalc(
  double avail,
  double price,
) {
  // multiply two numbers
  return avail * price;
}

DateTime returnDate(
  DateTime pickupDate,
  int availability,
) {
  var returnDate = pickupDate.add(new Duration(days: availability));
  return returnDate;
}

bool prodDist(
  LatLng userLoc,
  LatLng prodLoc,
  double diff,
) {
  var lat1 = userLoc.latitude;
  var lat2 = prodLoc.latitude;
  var lon1 = userLoc.longitude;
  var lon2 = prodLoc.longitude;
  var p = 0.017453292519943295;
  var c = math.cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;

  var inM = (12742 * math.asin(math.sqrt(a))) * 1000;
  return inM <= diff + 50;
}

int daysLeft(DateTime returnDate) {
  int days = returnDate.difference(DateTime.now()).inDays;
  return days; // Add your function code here!
}
