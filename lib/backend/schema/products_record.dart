import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get description;

  @nullable
  String get condition;

  @nullable
  String get identifier;

  @nullable
  String get availability;

  @nullable
  String get price;

  @nullable
  @BuiltValueField(wireName: 'uploaded_at')
  DateTime get uploadedAt;

  @nullable
  @BuiltValueField(wireName: 'uploaded_by')
  DocumentReference get uploadedBy;

  @nullable
  @BuiltValueField(wireName: 'rented_by')
  DocumentReference get rentedBy;

  @nullable
  String get image1;

  @nullable
  String get image2;

  @nullable
  LatLng get location;

  @nullable
  bool get status;

  @nullable
  @BuiltValueField(wireName: 'owner_name')
  String get ownerName;

  @nullable
  @BuiltValueField(wireName: 'transaction_ref')
  DocumentReference get transactionRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..condition = ''
    ..identifier = ''
    ..availability = ''
    ..price = ''
    ..image1 = ''
    ..image2 = ''
    ..status = false
    ..ownerName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;

  static ProductsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductsRecordData({
  String name,
  String description,
  String condition,
  String identifier,
  String availability,
  String price,
  DateTime uploadedAt,
  DocumentReference uploadedBy,
  DocumentReference rentedBy,
  String image1,
  String image2,
  LatLng location,
  bool status,
  String ownerName,
  DocumentReference transactionRef,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..name = name
          ..description = description
          ..condition = condition
          ..identifier = identifier
          ..availability = availability
          ..price = price
          ..uploadedAt = uploadedAt
          ..uploadedBy = uploadedBy
          ..rentedBy = rentedBy
          ..image1 = image1
          ..image2 = image2
          ..location = location
          ..status = status
          ..ownerName = ownerName
          ..transactionRef = transactionRef));
