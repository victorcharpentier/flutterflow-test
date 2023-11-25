import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PropertiesRecord extends FirestoreRecord {
  PropertiesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "property_name" field.
  String? _propertyName;
  String get propertyName => _propertyName ?? '';
  bool hasPropertyName() => _propertyName != null;

  // "property_description" field.
  String? _propertyDescription;
  String get propertyDescription => _propertyDescription ?? '';
  bool hasPropertyDescription() => _propertyDescription != null;

  // "property_location" field.
  LatLng? _propertyLocation;
  LatLng? get propertyLocation => _propertyLocation;
  bool hasPropertyLocation() => _propertyLocation != null;

  // "host" field.
  DocumentReference? _host;
  DocumentReference? get host => _host;
  bool hasHost() => _host != null;

  // "property_rating" field.
  double? _propertyRating;
  double get propertyRating => _propertyRating ?? 0.0;
  bool hasPropertyRating() => _propertyRating != null;

  // "property_region" field.
  String? _propertyRegion;
  String get propertyRegion => _propertyRegion ?? '';
  bool hasPropertyRegion() => _propertyRegion != null;

  // "nightly_price" field.
  double? _nightlyPrice;
  double get nightlyPrice => _nightlyPrice ?? 0.0;
  bool hasNightlyPrice() => _nightlyPrice != null;

  // "property_types" field.
  List<String>? _propertyTypes;
  List<String> get propertyTypes => _propertyTypes ?? const [];
  bool hasPropertyTypes() => _propertyTypes != null;

  // "property_created_time" field.
  DateTime? _propertyCreatedTime;
  DateTime? get propertyCreatedTime => _propertyCreatedTime;
  bool hasPropertyCreatedTime() => _propertyCreatedTime != null;

  // "property_activities" field.
  List<String>? _propertyActivities;
  List<String> get propertyActivities => _propertyActivities ?? const [];
  bool hasPropertyActivities() => _propertyActivities != null;

  // "property_restauration" field.
  List<String>? _propertyRestauration;
  List<String> get propertyRestauration => _propertyRestauration ?? const [];
  bool hasPropertyRestauration() => _propertyRestauration != null;

  // "property_beds_number" field.
  double? _propertyBedsNumber;
  double get propertyBedsNumber => _propertyBedsNumber ?? 0.0;
  bool hasPropertyBedsNumber() => _propertyBedsNumber != null;

  // "property_bathrooms_number" field.
  double? _propertyBathroomsNumber;
  double get propertyBathroomsNumber => _propertyBathroomsNumber ?? 0.0;
  bool hasPropertyBathroomsNumber() => _propertyBathroomsNumber != null;

  // "property_amenities" field.
  List<String>? _propertyAmenities;
  List<String> get propertyAmenities => _propertyAmenities ?? const [];
  bool hasPropertyAmenities() => _propertyAmenities != null;

  // "stay" field.
  bool? _stay;
  bool get stay => _stay ?? false;
  bool hasStay() => _stay != null;

  // "filming_location" field.
  bool? _filmingLocation;
  bool get filmingLocation => _filmingLocation ?? false;
  bool hasFilmingLocation() => _filmingLocation != null;

  // "event" field.
  bool? _event;
  bool get event => _event ?? false;
  bool hasEvent() => _event != null;

  // "property_bedrooms_number" field.
  double? _propertyBedroomsNumber;
  double get propertyBedroomsNumber => _propertyBedroomsNumber ?? 0.0;
  bool hasPropertyBedroomsNumber() => _propertyBedroomsNumber != null;

  // "property_outside_amenities" field.
  List<String>? _propertyOutsideAmenities;
  List<String> get propertyOutsideAmenities =>
      _propertyOutsideAmenities ?? const [];
  bool hasPropertyOutsideAmenities() => _propertyOutsideAmenities != null;

  // "property_security_items" field.
  List<String>? _propertySecurityItems;
  List<String> get propertySecurityItems => _propertySecurityItems ?? const [];
  bool hasPropertySecurityItems() => _propertySecurityItems != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "draft" field.
  bool? _draft;
  bool get draft => _draft ?? false;
  bool hasDraft() => _draft != null;

  // "property_capacity" field.
  double? _propertyCapacity;
  double get propertyCapacity => _propertyCapacity ?? 0.0;
  bool hasPropertyCapacity() => _propertyCapacity != null;

  // "property_surface_area" field.
  double? _propertySurfaceArea;
  double get propertySurfaceArea => _propertySurfaceArea ?? 0.0;
  bool hasPropertySurfaceArea() => _propertySurfaceArea != null;

  // "property_location_description" field.
  String? _propertyLocationDescription;
  String get propertyLocationDescription => _propertyLocationDescription ?? '';
  bool hasPropertyLocationDescription() => _propertyLocationDescription != null;

  // "property_check_in" field.
  String? _propertyCheckIn;
  String get propertyCheckIn => _propertyCheckIn ?? '';
  bool hasPropertyCheckIn() => _propertyCheckIn != null;

  // "property_check_out" field.
  String? _propertyCheckOut;
  String get propertyCheckOut => _propertyCheckOut ?? '';
  bool hasPropertyCheckOut() => _propertyCheckOut != null;

  // "property_restrictions" field.
  List<String>? _propertyRestrictions;
  List<String> get propertyRestrictions => _propertyRestrictions ?? const [];
  bool hasPropertyRestrictions() => _propertyRestrictions != null;

  // "property_housekeeping" field.
  bool? _propertyHousekeeping;
  bool get propertyHousekeeping => _propertyHousekeeping ?? false;
  bool hasPropertyHousekeeping() => _propertyHousekeeping != null;

  // "property_sheets_and_towels" field.
  bool? _propertySheetsAndTowels;
  bool get propertySheetsAndTowels => _propertySheetsAndTowels ?? false;
  bool hasPropertySheetsAndTowels() => _propertySheetsAndTowels != null;

  // "property_additional_rules" field.
  String? _propertyAdditionalRules;
  String get propertyAdditionalRules => _propertyAdditionalRules ?? '';
  bool hasPropertyAdditionalRules() => _propertyAdditionalRules != null;

  // "property_liked_by" field.
  List<DocumentReference>? _propertyLikedBy;
  List<DocumentReference> get propertyLikedBy => _propertyLikedBy ?? const [];
  bool hasPropertyLikedBy() => _propertyLikedBy != null;

  // "property_evaluation" field.
  EvaluationStruct? _propertyEvaluation;
  EvaluationStruct get propertyEvaluation =>
      _propertyEvaluation ?? EvaluationStruct();
  bool hasPropertyEvaluation() => _propertyEvaluation != null;

  // "property_reviews" field.
  List<DocumentReference>? _propertyReviews;
  List<DocumentReference> get propertyReviews => _propertyReviews ?? const [];
  bool hasPropertyReviews() => _propertyReviews != null;

  void _initializeFields() {
    _propertyName = snapshotData['property_name'] as String?;
    _propertyDescription = snapshotData['property_description'] as String?;
    _propertyLocation = snapshotData['property_location'] as LatLng?;
    _host = snapshotData['host'] as DocumentReference?;
    _propertyRating = castToType<double>(snapshotData['property_rating']);
    _propertyRegion = snapshotData['property_region'] as String?;
    _nightlyPrice = castToType<double>(snapshotData['nightly_price']);
    _propertyTypes = getDataList(snapshotData['property_types']);
    _propertyCreatedTime = snapshotData['property_created_time'] as DateTime?;
    _propertyActivities = getDataList(snapshotData['property_activities']);
    _propertyRestauration = getDataList(snapshotData['property_restauration']);
    _propertyBedsNumber =
        castToType<double>(snapshotData['property_beds_number']);
    _propertyBathroomsNumber =
        castToType<double>(snapshotData['property_bathrooms_number']);
    _propertyAmenities = getDataList(snapshotData['property_amenities']);
    _stay = snapshotData['stay'] as bool?;
    _filmingLocation = snapshotData['filming_location'] as bool?;
    _event = snapshotData['event'] as bool?;
    _propertyBedroomsNumber =
        castToType<double>(snapshotData['property_bedrooms_number']);
    _propertyOutsideAmenities =
        getDataList(snapshotData['property_outside_amenities']);
    _propertySecurityItems =
        getDataList(snapshotData['property_security_items']);
    _photos = getDataList(snapshotData['photos']);
    _draft = snapshotData['draft'] as bool?;
    _propertyCapacity = castToType<double>(snapshotData['property_capacity']);
    _propertySurfaceArea =
        castToType<double>(snapshotData['property_surface_area']);
    _propertyLocationDescription =
        snapshotData['property_location_description'] as String?;
    _propertyCheckIn = snapshotData['property_check_in'] as String?;
    _propertyCheckOut = snapshotData['property_check_out'] as String?;
    _propertyRestrictions = getDataList(snapshotData['property_restrictions']);
    _propertyHousekeeping = snapshotData['property_housekeeping'] as bool?;
    _propertySheetsAndTowels =
        snapshotData['property_sheets_and_towels'] as bool?;
    _propertyAdditionalRules =
        snapshotData['property_additional_rules'] as String?;
    _propertyLikedBy = getDataList(snapshotData['property_liked_by']);
    _propertyEvaluation =
        EvaluationStruct.maybeFromMap(snapshotData['property_evaluation']);
    _propertyReviews = getDataList(snapshotData['property_reviews']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('properties');

  static Stream<PropertiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PropertiesRecord.fromSnapshot(s));

  static Future<PropertiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PropertiesRecord.fromSnapshot(s));

  static PropertiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PropertiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PropertiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PropertiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PropertiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PropertiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPropertiesRecordData({
  String? propertyName,
  String? propertyDescription,
  LatLng? propertyLocation,
  DocumentReference? host,
  double? propertyRating,
  String? propertyRegion,
  double? nightlyPrice,
  DateTime? propertyCreatedTime,
  double? propertyBedsNumber,
  double? propertyBathroomsNumber,
  bool? stay,
  bool? filmingLocation,
  bool? event,
  double? propertyBedroomsNumber,
  bool? draft,
  double? propertyCapacity,
  double? propertySurfaceArea,
  String? propertyLocationDescription,
  String? propertyCheckIn,
  String? propertyCheckOut,
  bool? propertyHousekeeping,
  bool? propertySheetsAndTowels,
  String? propertyAdditionalRules,
  EvaluationStruct? propertyEvaluation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'property_name': propertyName,
      'property_description': propertyDescription,
      'property_location': propertyLocation,
      'host': host,
      'property_rating': propertyRating,
      'property_region': propertyRegion,
      'nightly_price': nightlyPrice,
      'property_created_time': propertyCreatedTime,
      'property_beds_number': propertyBedsNumber,
      'property_bathrooms_number': propertyBathroomsNumber,
      'stay': stay,
      'filming_location': filmingLocation,
      'event': event,
      'property_bedrooms_number': propertyBedroomsNumber,
      'draft': draft,
      'property_capacity': propertyCapacity,
      'property_surface_area': propertySurfaceArea,
      'property_location_description': propertyLocationDescription,
      'property_check_in': propertyCheckIn,
      'property_check_out': propertyCheckOut,
      'property_housekeeping': propertyHousekeeping,
      'property_sheets_and_towels': propertySheetsAndTowels,
      'property_additional_rules': propertyAdditionalRules,
      'property_evaluation': EvaluationStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "property_evaluation" field.
  addEvaluationStructData(
      firestoreData, propertyEvaluation, 'property_evaluation');

  return firestoreData;
}

class PropertiesRecordDocumentEquality implements Equality<PropertiesRecord> {
  const PropertiesRecordDocumentEquality();

  @override
  bool equals(PropertiesRecord? e1, PropertiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.propertyName == e2?.propertyName &&
        e1?.propertyDescription == e2?.propertyDescription &&
        e1?.propertyLocation == e2?.propertyLocation &&
        e1?.host == e2?.host &&
        e1?.propertyRating == e2?.propertyRating &&
        e1?.propertyRegion == e2?.propertyRegion &&
        e1?.nightlyPrice == e2?.nightlyPrice &&
        listEquality.equals(e1?.propertyTypes, e2?.propertyTypes) &&
        e1?.propertyCreatedTime == e2?.propertyCreatedTime &&
        listEquality.equals(e1?.propertyActivities, e2?.propertyActivities) &&
        listEquality.equals(
            e1?.propertyRestauration, e2?.propertyRestauration) &&
        e1?.propertyBedsNumber == e2?.propertyBedsNumber &&
        e1?.propertyBathroomsNumber == e2?.propertyBathroomsNumber &&
        listEquality.equals(e1?.propertyAmenities, e2?.propertyAmenities) &&
        e1?.stay == e2?.stay &&
        e1?.filmingLocation == e2?.filmingLocation &&
        e1?.event == e2?.event &&
        e1?.propertyBedroomsNumber == e2?.propertyBedroomsNumber &&
        listEquality.equals(
            e1?.propertyOutsideAmenities, e2?.propertyOutsideAmenities) &&
        listEquality.equals(
            e1?.propertySecurityItems, e2?.propertySecurityItems) &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        e1?.draft == e2?.draft &&
        e1?.propertyCapacity == e2?.propertyCapacity &&
        e1?.propertySurfaceArea == e2?.propertySurfaceArea &&
        e1?.propertyLocationDescription == e2?.propertyLocationDescription &&
        e1?.propertyCheckIn == e2?.propertyCheckIn &&
        e1?.propertyCheckOut == e2?.propertyCheckOut &&
        listEquality.equals(
            e1?.propertyRestrictions, e2?.propertyRestrictions) &&
        e1?.propertyHousekeeping == e2?.propertyHousekeeping &&
        e1?.propertySheetsAndTowels == e2?.propertySheetsAndTowels &&
        e1?.propertyAdditionalRules == e2?.propertyAdditionalRules &&
        listEquality.equals(e1?.propertyLikedBy, e2?.propertyLikedBy) &&
        e1?.propertyEvaluation == e2?.propertyEvaluation &&
        listEquality.equals(e1?.propertyReviews, e2?.propertyReviews);
  }

  @override
  int hash(PropertiesRecord? e) => const ListEquality().hash([
        e?.propertyName,
        e?.propertyDescription,
        e?.propertyLocation,
        e?.host,
        e?.propertyRating,
        e?.propertyRegion,
        e?.nightlyPrice,
        e?.propertyTypes,
        e?.propertyCreatedTime,
        e?.propertyActivities,
        e?.propertyRestauration,
        e?.propertyBedsNumber,
        e?.propertyBathroomsNumber,
        e?.propertyAmenities,
        e?.stay,
        e?.filmingLocation,
        e?.event,
        e?.propertyBedroomsNumber,
        e?.propertyOutsideAmenities,
        e?.propertySecurityItems,
        e?.photos,
        e?.draft,
        e?.propertyCapacity,
        e?.propertySurfaceArea,
        e?.propertyLocationDescription,
        e?.propertyCheckIn,
        e?.propertyCheckOut,
        e?.propertyRestrictions,
        e?.propertyHousekeeping,
        e?.propertySheetsAndTowels,
        e?.propertyAdditionalRules,
        e?.propertyLikedBy,
        e?.propertyEvaluation,
        e?.propertyReviews
      ]);

  @override
  bool isValidKey(Object? o) => o is PropertiesRecord;
}
