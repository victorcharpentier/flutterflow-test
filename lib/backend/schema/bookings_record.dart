import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "booking_start_date" field.
  DateTime? _bookingStartDate;
  DateTime? get bookingStartDate => _bookingStartDate;
  bool hasBookingStartDate() => _bookingStartDate != null;

  // "booking_end_date" field.
  DateTime? _bookingEndDate;
  DateTime? get bookingEndDate => _bookingEndDate;
  bool hasBookingEndDate() => _bookingEndDate != null;

  // "booking_capacity" field.
  double? _bookingCapacity;
  double get bookingCapacity => _bookingCapacity ?? 0.0;
  bool hasBookingCapacity() => _bookingCapacity != null;

  // "booking_created_time" field.
  DateTime? _bookingCreatedTime;
  DateTime? get bookingCreatedTime => _bookingCreatedTime;
  bool hasBookingCreatedTime() => _bookingCreatedTime != null;

  // "booking_property_reference" field.
  DocumentReference? _bookingPropertyReference;
  DocumentReference? get bookingPropertyReference => _bookingPropertyReference;
  bool hasBookingPropertyReference() => _bookingPropertyReference != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bookingStartDate = snapshotData['booking_start_date'] as DateTime?;
    _bookingEndDate = snapshotData['booking_end_date'] as DateTime?;
    _bookingCapacity = castToType<double>(snapshotData['booking_capacity']);
    _bookingCreatedTime = snapshotData['booking_created_time'] as DateTime?;
    _bookingPropertyReference =
        snapshotData['booking_property_reference'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookings')
          : FirebaseFirestore.instance.collectionGroup('bookings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('bookings').doc();

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DateTime? bookingStartDate,
  DateTime? bookingEndDate,
  double? bookingCapacity,
  DateTime? bookingCreatedTime,
  DocumentReference? bookingPropertyReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booking_start_date': bookingStartDate,
      'booking_end_date': bookingEndDate,
      'booking_capacity': bookingCapacity,
      'booking_created_time': bookingCreatedTime,
      'booking_property_reference': bookingPropertyReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.bookingStartDate == e2?.bookingStartDate &&
        e1?.bookingEndDate == e2?.bookingEndDate &&
        e1?.bookingCapacity == e2?.bookingCapacity &&
        e1?.bookingCreatedTime == e2?.bookingCreatedTime &&
        e1?.bookingPropertyReference == e2?.bookingPropertyReference;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.bookingStartDate,
        e?.bookingEndDate,
        e?.bookingCapacity,
        e?.bookingCreatedTime,
        e?.bookingPropertyReference
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
