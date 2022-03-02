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
  @BuiltValueField(wireName: 'renter_id')
  DocumentReference get renterId;

  @nullable
  @BuiltValueField(wireName: 'owner_id')
  DocumentReference get ownerId;

  @nullable
  @BuiltValueField(wireName: 'product_ref')
  DocumentReference get productRef;

  @nullable
  @BuiltValueField(wireName: 'pickup_dt')
  DateTime get pickupDt;

  @nullable
  String get id;

  @nullable
  DocumentReference get qrcode;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionsRecordBuilder builder) => builder
    ..renterName = ''
    ..ownerName = ''
    ..paymentMode = ''
    ..price = ''
    ..id = '';

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
  String renterName,
  String ownerName,
  String paymentMode,
  String price,
  LatLng pickupLoc,
  DocumentReference renterId,
  DocumentReference ownerId,
  DocumentReference productRef,
  DateTime pickupDt,
  String id,
  DocumentReference qrcode,
}) =>
    serializers.toFirestore(
        TransactionsRecord.serializer,
        TransactionsRecord((t) => t
          ..renterName = renterName
          ..ownerName = ownerName
          ..paymentMode = paymentMode
          ..price = price
          ..pickupLoc = pickupLoc
          ..renterId = renterId
          ..ownerId = ownerId
          ..productRef = productRef
          ..pickupDt = pickupDt
          ..id = id
          ..qrcode = qrcode));
