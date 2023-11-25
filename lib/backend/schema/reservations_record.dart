import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReservationsRecord extends FirestoreRecord {
  ReservationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reservation_created_time" field.
  DateTime? _reservationCreatedTime;
  DateTime? get reservationCreatedTime => _reservationCreatedTime;
  bool hasReservationCreatedTime() => _reservationCreatedTime != null;

  // "reservation_type" field.
  String? _reservationType;
  String get reservationType => _reservationType ?? '';
  bool hasReservationType() => _reservationType != null;

  // "reservation_start_date" field.
  DateTime? _reservationStartDate;
  DateTime? get reservationStartDate => _reservationStartDate;
  bool hasReservationStartDate() => _reservationStartDate != null;

  // "reservation_end_date" field.
  DateTime? _reservationEndDate;
  DateTime? get reservationEndDate => _reservationEndDate;
  bool hasReservationEndDate() => _reservationEndDate != null;

  // "reservation_adults_count" field.
  double? _reservationAdultsCount;
  double get reservationAdultsCount => _reservationAdultsCount ?? 0.0;
  bool hasReservationAdultsCount() => _reservationAdultsCount != null;

  // "reservation_infants_count" field.
  double? _reservationInfantsCount;
  double get reservationInfantsCount => _reservationInfantsCount ?? 0.0;
  bool hasReservationInfantsCount() => _reservationInfantsCount != null;

  // "reservation_pets_count" field.
  double? _reservationPetsCount;
  double get reservationPetsCount => _reservationPetsCount ?? 0.0;
  bool hasReservationPetsCount() => _reservationPetsCount != null;

  // "reservation_status" field.
  String? _reservationStatus;
  String get reservationStatus => _reservationStatus ?? '';
  bool hasReservationStatus() => _reservationStatus != null;

  // "reservation_influencer" field.
  DocumentReference? _reservationInfluencer;
  DocumentReference? get reservationInfluencer => _reservationInfluencer;
  bool hasReservationInfluencer() => _reservationInfluencer != null;

  // "reservation_host" field.
  DocumentReference? _reservationHost;
  DocumentReference? get reservationHost => _reservationHost;
  bool hasReservationHost() => _reservationHost != null;

  // "reservation_usual_total_price" field.
  double? _reservationUsualTotalPrice;
  double get reservationUsualTotalPrice => _reservationUsualTotalPrice ?? 0.0;
  bool hasReservationUsualTotalPrice() => _reservationUsualTotalPrice != null;

  // "reservation_reel_like" field.
  double? _reservationReelLike;
  double get reservationReelLike => _reservationReelLike ?? 0.0;
  bool hasReservationReelLike() => _reservationReelLike != null;

  // "reservation_story_views" field.
  double? _reservationStoryViews;
  double get reservationStoryViews => _reservationStoryViews ?? 0.0;
  bool hasReservationStoryViews() => _reservationStoryViews != null;

  // "reservation_titktok_like" field.
  double? _reservationTitktokLike;
  double get reservationTitktokLike => _reservationTitktokLike ?? 0.0;
  bool hasReservationTitktokLike() => _reservationTitktokLike != null;

  // "reservation_youtube_views" field.
  double? _reservationYoutubeViews;
  double get reservationYoutubeViews => _reservationYoutubeViews ?? 0.0;
  bool hasReservationYoutubeViews() => _reservationYoutubeViews != null;

  void _initializeFields() {
    _reservationCreatedTime =
        snapshotData['reservation_created_time'] as DateTime?;
    _reservationType = snapshotData['reservation_type'] as String?;
    _reservationStartDate = snapshotData['reservation_start_date'] as DateTime?;
    _reservationEndDate = snapshotData['reservation_end_date'] as DateTime?;
    _reservationAdultsCount =
        castToType<double>(snapshotData['reservation_adults_count']);
    _reservationInfantsCount =
        castToType<double>(snapshotData['reservation_infants_count']);
    _reservationPetsCount =
        castToType<double>(snapshotData['reservation_pets_count']);
    _reservationStatus = snapshotData['reservation_status'] as String?;
    _reservationInfluencer =
        snapshotData['reservation_influencer'] as DocumentReference?;
    _reservationHost = snapshotData['reservation_host'] as DocumentReference?;
    _reservationUsualTotalPrice =
        castToType<double>(snapshotData['reservation_usual_total_price']);
    _reservationReelLike =
        castToType<double>(snapshotData['reservation_reel_like']);
    _reservationStoryViews =
        castToType<double>(snapshotData['reservation_story_views']);
    _reservationTitktokLike =
        castToType<double>(snapshotData['reservation_titktok_like']);
    _reservationYoutubeViews =
        castToType<double>(snapshotData['reservation_youtube_views']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reservations');

  static Stream<ReservationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservationsRecord.fromSnapshot(s));

  static Future<ReservationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservationsRecord.fromSnapshot(s));

  static ReservationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservationsRecordData({
  DateTime? reservationCreatedTime,
  String? reservationType,
  DateTime? reservationStartDate,
  DateTime? reservationEndDate,
  double? reservationAdultsCount,
  double? reservationInfantsCount,
  double? reservationPetsCount,
  String? reservationStatus,
  DocumentReference? reservationInfluencer,
  DocumentReference? reservationHost,
  double? reservationUsualTotalPrice,
  double? reservationReelLike,
  double? reservationStoryViews,
  double? reservationTitktokLike,
  double? reservationYoutubeViews,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reservation_created_time': reservationCreatedTime,
      'reservation_type': reservationType,
      'reservation_start_date': reservationStartDate,
      'reservation_end_date': reservationEndDate,
      'reservation_adults_count': reservationAdultsCount,
      'reservation_infants_count': reservationInfantsCount,
      'reservation_pets_count': reservationPetsCount,
      'reservation_status': reservationStatus,
      'reservation_influencer': reservationInfluencer,
      'reservation_host': reservationHost,
      'reservation_usual_total_price': reservationUsualTotalPrice,
      'reservation_reel_like': reservationReelLike,
      'reservation_story_views': reservationStoryViews,
      'reservation_titktok_like': reservationTitktokLike,
      'reservation_youtube_views': reservationYoutubeViews,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservationsRecordDocumentEquality
    implements Equality<ReservationsRecord> {
  const ReservationsRecordDocumentEquality();

  @override
  bool equals(ReservationsRecord? e1, ReservationsRecord? e2) {
    return e1?.reservationCreatedTime == e2?.reservationCreatedTime &&
        e1?.reservationType == e2?.reservationType &&
        e1?.reservationStartDate == e2?.reservationStartDate &&
        e1?.reservationEndDate == e2?.reservationEndDate &&
        e1?.reservationAdultsCount == e2?.reservationAdultsCount &&
        e1?.reservationInfantsCount == e2?.reservationInfantsCount &&
        e1?.reservationPetsCount == e2?.reservationPetsCount &&
        e1?.reservationStatus == e2?.reservationStatus &&
        e1?.reservationInfluencer == e2?.reservationInfluencer &&
        e1?.reservationHost == e2?.reservationHost &&
        e1?.reservationUsualTotalPrice == e2?.reservationUsualTotalPrice &&
        e1?.reservationReelLike == e2?.reservationReelLike &&
        e1?.reservationStoryViews == e2?.reservationStoryViews &&
        e1?.reservationTitktokLike == e2?.reservationTitktokLike &&
        e1?.reservationYoutubeViews == e2?.reservationYoutubeViews;
  }

  @override
  int hash(ReservationsRecord? e) => const ListEquality().hash([
        e?.reservationCreatedTime,
        e?.reservationType,
        e?.reservationStartDate,
        e?.reservationEndDate,
        e?.reservationAdultsCount,
        e?.reservationInfantsCount,
        e?.reservationPetsCount,
        e?.reservationStatus,
        e?.reservationInfluencer,
        e?.reservationHost,
        e?.reservationUsualTotalPrice,
        e?.reservationReelLike,
        e?.reservationStoryViews,
        e?.reservationTitktokLike,
        e?.reservationYoutubeViews
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservationsRecord;
}
