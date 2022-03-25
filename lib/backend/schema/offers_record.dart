import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'offers_record.g.dart';

abstract class OffersRecord
    implements Built<OffersRecord, OffersRecordBuilder> {
  static Serializer<OffersRecord> get serializer => _$offersRecordSerializer;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'sent_by')
  DocumentReference get sentBy;

  @nullable
  @BuiltValueField(wireName: 'prod_ref')
  DocumentReference get prodRef;

  @nullable
  DateTime get timestamp;

  @nullable
  String get status;

  @nullable
  String get price;

  @nullable
  @BuiltValueField(wireName: 'received_by')
  DocumentReference get receivedBy;

  @nullable
  @BuiltValueField(wireName: 'sender_name')
  String get senderName;

  @nullable
  @BuiltValueField(wireName: 'receiver_name')
  String get receiverName;

  @nullable
  @BuiltValueField(wireName: 'payment_mode')
  String get paymentMode;

  @nullable
  String get deposit;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OffersRecordBuilder builder) => builder
    ..id = 0
    ..status = ''
    ..price = ''
    ..senderName = ''
    ..receiverName = ''
    ..paymentMode = ''
    ..deposit = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offers');

  static Stream<OffersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OffersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OffersRecord._();
  factory OffersRecord([void Function(OffersRecordBuilder) updates]) =
      _$OffersRecord;

  static OffersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOffersRecordData({
  int id,
  DocumentReference sentBy,
  DocumentReference prodRef,
  DateTime timestamp,
  String status,
  String price,
  DocumentReference receivedBy,
  String senderName,
  String receiverName,
  String paymentMode,
  String deposit,
}) =>
    serializers.toFirestore(
        OffersRecord.serializer,
        OffersRecord((o) => o
          ..id = id
          ..sentBy = sentBy
          ..prodRef = prodRef
          ..timestamp = timestamp
          ..status = status
          ..price = price
          ..receivedBy = receivedBy
          ..senderName = senderName
          ..receiverName = receiverName
          ..paymentMode = paymentMode
          ..deposit = deposit));
