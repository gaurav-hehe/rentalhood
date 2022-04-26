import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  LatLng get location;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'favourite_prod')
  BuiltList<DocumentReference> get favouriteProd;

  @nullable
  @BuiltValueField(wireName: 'my_orders')
  BuiltList<DocumentReference> get myOrders;

  @nullable
  @BuiltValueField(wireName: 'my_ads')
  BuiltList<DocumentReference> get myAds;

  @nullable
  @BuiltValueField(wireName: 'offers_sent')
  BuiltList<DocumentReference> get offersSent;

  @nullable
  @BuiltValueField(wireName: 'offers_received')
  BuiltList<DocumentReference> get offersReceived;

  @nullable
  String get address;

  @nullable
  String get sample;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..uid = ''
    ..favouriteProd = ListBuilder()
    ..myOrders = ListBuilder()
    ..myAds = ListBuilder()
    ..offersSent = ListBuilder()
    ..offersReceived = ListBuilder()
    ..address = ''
    ..sample = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  LatLng location,
  String email,
  String displayName,
  String photoUrl,
  DateTime createdTime,
  String phoneNumber,
  String uid,
  String address,
  String sample,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..location = location
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..uid = uid
          ..favouriteProd = null
          ..myOrders = null
          ..myAds = null
          ..offersSent = null
          ..offersReceived = null
          ..address = address
          ..sample = sample));
