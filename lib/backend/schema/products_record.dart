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
  @BuiltValueField(wireName: 'owner_name')
  String get ownerName;

  @nullable
  bool get q1;

  @nullable
  bool get q2;

  @nullable
  bool get q3;

  @nullable
  bool get q4;

  @nullable
  bool get q5;

  @nullable
  @BuiltValueField(wireName: 'prod_id')
  int get prodId;

  @nullable
  String get address;

  @nullable
  int get availability;

  @nullable
  @BuiltValueField(wireName: 'product_type')
  String get productType;

  @nullable
  String get status;

  @nullable
  int get price;

  @nullable
  @BuiltValueField(wireName: 'trans_ref')
  DocumentReference get transRef;

  @nullable
  BuiltList<DocumentReference> get allTransactions;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..condition = ''
    ..identifier = ''
    ..image1 = ''
    ..image2 = ''
    ..ownerName = ''
    ..q1 = false
    ..q2 = false
    ..q3 = false
    ..q4 = false
    ..q5 = false
    ..prodId = 0
    ..address = ''
    ..availability = 0
    ..productType = ''
    ..status = ''
    ..price = 0
    ..allTransactions = ListBuilder();

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
  DateTime uploadedAt,
  DocumentReference uploadedBy,
  DocumentReference rentedBy,
  String image1,
  String image2,
  LatLng location,
  String ownerName,
  bool q1,
  bool q2,
  bool q3,
  bool q4,
  bool q5,
  int prodId,
  String address,
  int availability,
  String productType,
  String status,
  int price,
  DocumentReference transRef,
}) =>
    serializers.toFirestore(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..name = name
          ..description = description
          ..condition = condition
          ..identifier = identifier
          ..uploadedAt = uploadedAt
          ..uploadedBy = uploadedBy
          ..rentedBy = rentedBy
          ..image1 = image1
          ..image2 = image2
          ..location = location
          ..ownerName = ownerName
          ..q1 = q1
          ..q2 = q2
          ..q3 = q3
          ..q4 = q4
          ..q5 = q5
          ..prodId = prodId
          ..address = address
          ..availability = availability
          ..productType = productType
          ..status = status
          ..price = price
          ..transRef = transRef
          ..allTransactions = null));
