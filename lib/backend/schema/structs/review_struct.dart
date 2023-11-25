// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewStruct extends FFFirebaseStruct {
  ReviewStruct({
    String? userImage,
    String? userFirstName,
    String? reviewMessage,
    DateTime? reviewCreatedTime,
    double? reviewRating,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userImage = userImage,
        _userFirstName = userFirstName,
        _reviewMessage = reviewMessage,
        _reviewCreatedTime = reviewCreatedTime,
        _reviewRating = reviewRating,
        super(firestoreUtilData);

  // "user_image" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  set userImage(String? val) => _userImage = val;
  bool hasUserImage() => _userImage != null;

  // "user_first_name" field.
  String? _userFirstName;
  String get userFirstName => _userFirstName ?? '';
  set userFirstName(String? val) => _userFirstName = val;
  bool hasUserFirstName() => _userFirstName != null;

  // "review_message" field.
  String? _reviewMessage;
  String get reviewMessage => _reviewMessage ?? '';
  set reviewMessage(String? val) => _reviewMessage = val;
  bool hasReviewMessage() => _reviewMessage != null;

  // "review_created_time" field.
  DateTime? _reviewCreatedTime;
  DateTime? get reviewCreatedTime => _reviewCreatedTime;
  set reviewCreatedTime(DateTime? val) => _reviewCreatedTime = val;
  bool hasReviewCreatedTime() => _reviewCreatedTime != null;

  // "review_rating" field.
  double? _reviewRating;
  double get reviewRating => _reviewRating ?? 0.0;
  set reviewRating(double? val) => _reviewRating = val;
  void incrementReviewRating(double amount) =>
      _reviewRating = reviewRating + amount;
  bool hasReviewRating() => _reviewRating != null;

  static ReviewStruct fromMap(Map<String, dynamic> data) => ReviewStruct(
        userImage: data['user_image'] as String?,
        userFirstName: data['user_first_name'] as String?,
        reviewMessage: data['review_message'] as String?,
        reviewCreatedTime: data['review_created_time'] as DateTime?,
        reviewRating: castToType<double>(data['review_rating']),
      );

  static ReviewStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ReviewStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_image': _userImage,
        'user_first_name': _userFirstName,
        'review_message': _reviewMessage,
        'review_created_time': _reviewCreatedTime,
        'review_rating': _reviewRating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_image': serializeParam(
          _userImage,
          ParamType.String,
        ),
        'user_first_name': serializeParam(
          _userFirstName,
          ParamType.String,
        ),
        'review_message': serializeParam(
          _reviewMessage,
          ParamType.String,
        ),
        'review_created_time': serializeParam(
          _reviewCreatedTime,
          ParamType.DateTime,
        ),
        'review_rating': serializeParam(
          _reviewRating,
          ParamType.double,
        ),
      }.withoutNulls;

  static ReviewStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReviewStruct(
        userImage: deserializeParam(
          data['user_image'],
          ParamType.String,
          false,
        ),
        userFirstName: deserializeParam(
          data['user_first_name'],
          ParamType.String,
          false,
        ),
        reviewMessage: deserializeParam(
          data['review_message'],
          ParamType.String,
          false,
        ),
        reviewCreatedTime: deserializeParam(
          data['review_created_time'],
          ParamType.DateTime,
          false,
        ),
        reviewRating: deserializeParam(
          data['review_rating'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ReviewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReviewStruct &&
        userImage == other.userImage &&
        userFirstName == other.userFirstName &&
        reviewMessage == other.reviewMessage &&
        reviewCreatedTime == other.reviewCreatedTime &&
        reviewRating == other.reviewRating;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userImage,
        userFirstName,
        reviewMessage,
        reviewCreatedTime,
        reviewRating
      ]);
}

ReviewStruct createReviewStruct({
  String? userImage,
  String? userFirstName,
  String? reviewMessage,
  DateTime? reviewCreatedTime,
  double? reviewRating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReviewStruct(
      userImage: userImage,
      userFirstName: userFirstName,
      reviewMessage: reviewMessage,
      reviewCreatedTime: reviewCreatedTime,
      reviewRating: reviewRating,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReviewStruct? updateReviewStruct(
  ReviewStruct? review, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    review
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReviewStructData(
  Map<String, dynamic> firestoreData,
  ReviewStruct? review,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (review == null) {
    return;
  }
  if (review.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && review.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reviewData = getReviewFirestoreData(review, forFieldValue);
  final nestedData = reviewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = review.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReviewFirestoreData(
  ReviewStruct? review, [
  bool forFieldValue = false,
]) {
  if (review == null) {
    return {};
  }
  final firestoreData = mapToFirestore(review.toMap());

  // Add any Firestore field values
  review.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReviewListFirestoreData(
  List<ReviewStruct>? reviews,
) =>
    reviews?.map((e) => getReviewFirestoreData(e, true)).toList() ?? [];
