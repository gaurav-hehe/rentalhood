import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transactions_record.g.dart';

abstract class TransactionsRecord
    implements Built<TransactionsRecord, TransactionsRecordBuilder> {
  static Serializer<TransactionsRecord> get serializer =>
      _$transactionsRecordSerializer;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'renter_name')
  String get renterName;

  @nullable
  @BuiltValueField(wireName: 'owner_name')
  String get ownerName;

  @nullable
  @BuiltValueField(wireName: 'payment_mode')
  String get paymentMode;

  @nullable
  String get price;

  @nullable
  @BuiltValueField(wireName: 'pickup_loc')
  LatLng get pickupLoc;

  @nullable
  @BuiltValueField(wireName: 'pickup_date')
  String get pickupDate;

  @nullable
  @BuiltValueField(wireName: 'pickup_time')
  String get pickupTime;

  @nullable
  @BuiltValueField(wireName: 'renter_id')
  DocumentReference get renterId;

  @nullable
  @BuiltValueField(wireName: 'owner_id')
  DocumentReference get ownerId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..id = 0
    ..renterName = ''
    ..ownerName = ''
    ..paymentMode = ''
    ..price = ''
    ..pickupDate = ''
    ..pickupTime = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionsRecord._();
  factory TransactionsRecord(
          [void Function(TransactionsRecordBuilder) updates]) =
      _$TransactionsRecord;

  static TransactionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransactionsRecordData({
  int id,
  String renterName,
  String ownerName,
  String paymentMode,
  String price,
  LatLng pickupLoc,
  String pickupDate,
  String pickupTime,
  DocumentReference renterId,
  DocumentReference ownerId,
}) =>
    serializers.toFirestore(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..id = id
          ..renterName = renterName
          ..ownerName = ownerName
          ..paymentMode = paymentMode
          ..price = price
          ..pickupLoc = pickupLoc
          ..pickupDate = pickupDate
          ..pickupTime = pickupTime
          ..renterId = renterId
          ..ownerId = ownerId));
