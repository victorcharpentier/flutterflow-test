import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "review_user" field.
  DocumentReference? _reviewUser;
  DocumentReference? get reviewUser => _reviewUser;
  bool hasReviewUser() => _reviewUser != null;

  // "review_message" field.
  String? _reviewMessage;
  String get reviewMessage => _reviewMessage ?? '';
  bool hasReviewMessage() => _reviewMessage != null;

  // "review_evaluation" field.
  EvaluationStruct? _reviewEvaluation;
  EvaluationStruct get reviewEvaluation =>
      _reviewEvaluation ?? EvaluationStruct();
  bool hasReviewEvaluation() => _reviewEvaluation != null;

  // "review_created_date" field.
  DateTime? _reviewCreatedDate;
  DateTime? get reviewCreatedDate => _reviewCreatedDate;
  bool hasReviewCreatedDate() => _reviewCreatedDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reviewUser = snapshotData['review_user'] as DocumentReference?;
    _reviewMessage = snapshotData['review_message'] as String?;
    _reviewEvaluation =
        EvaluationStruct.maybeFromMap(snapshotData['review_evaluation']);
    _reviewCreatedDate = snapshotData['review_created_date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reviews')
          : FirebaseFirestore.instance.collectionGroup('reviews');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('reviews').doc();

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? reviewUser,
  String? reviewMessage,
  EvaluationStruct? reviewEvaluation,
  DateTime? reviewCreatedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'review_user': reviewUser,
      'review_message': reviewMessage,
      'review_evaluation': EvaluationStruct().toMap(),
      'review_created_date': reviewCreatedDate,
    }.withoutNulls,
  );

  // Handle nested data for "review_evaluation" field.
  addEvaluationStructData(firestoreData, reviewEvaluation, 'review_evaluation');

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.reviewUser == e2?.reviewUser &&
        e1?.reviewMessage == e2?.reviewMessage &&
        e1?.reviewEvaluation == e2?.reviewEvaluation &&
        e1?.reviewCreatedDate == e2?.reviewCreatedDate;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.reviewUser,
        e?.reviewMessage,
        e?.reviewEvaluation,
        e?.reviewCreatedDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
