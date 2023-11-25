import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "is_host" field.
  bool? _isHost;
  bool get isHost => _isHost ?? false;
  bool hasIsHost() => _isHost != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "is_influencer" field.
  bool? _isInfluencer;
  bool get isInfluencer => _isInfluencer ?? false;
  bool hasIsInfluencer() => _isInfluencer != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "instagram_username" field.
  String? _instagramUsername;
  String get instagramUsername => _instagramUsername ?? '';
  bool hasInstagramUsername() => _instagramUsername != null;

  // "tiktok_username" field.
  String? _tiktokUsername;
  String get tiktokUsername => _tiktokUsername ?? '';
  bool hasTiktokUsername() => _tiktokUsername != null;

  // "youtube_username" field.
  String? _youtubeUsername;
  String get youtubeUsername => _youtubeUsername ?? '';
  bool hasYoutubeUsername() => _youtubeUsername != null;

  // "birth_date" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  bool hasBirthDate() => _birthDate != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "biography" field.
  String? _biography;
  String get biography => _biography ?? '';
  bool hasBiography() => _biography != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isHost = snapshotData['is_host'] as bool?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _isInfluencer = snapshotData['is_influencer'] as bool?;
    _address = snapshotData['address'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _instagramUsername = snapshotData['instagram_username'] as String?;
    _tiktokUsername = snapshotData['tiktok_username'] as String?;
    _youtubeUsername = snapshotData['youtube_username'] as String?;
    _birthDate = snapshotData['birth_date'] as String?;
    _uid = snapshotData['uid'] as String?;
    _biography = snapshotData['biography'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isHost,
  String? firstName,
  String? lastName,
  bool? isInfluencer,
  String? address,
  String? displayName,
  String? instagramUsername,
  String? tiktokUsername,
  String? youtubeUsername,
  String? birthDate,
  String? uid,
  String? biography,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'is_host': isHost,
      'first_name': firstName,
      'last_name': lastName,
      'is_influencer': isInfluencer,
      'address': address,
      'display_name': displayName,
      'instagram_username': instagramUsername,
      'tiktok_username': tiktokUsername,
      'youtube_username': youtubeUsername,
      'birth_date': birthDate,
      'uid': uid,
      'biography': biography,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isHost == e2?.isHost &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.isInfluencer == e2?.isInfluencer &&
        e1?.address == e2?.address &&
        e1?.displayName == e2?.displayName &&
        e1?.instagramUsername == e2?.instagramUsername &&
        e1?.tiktokUsername == e2?.tiktokUsername &&
        e1?.youtubeUsername == e2?.youtubeUsername &&
        e1?.birthDate == e2?.birthDate &&
        e1?.uid == e2?.uid &&
        e1?.biography == e2?.biography;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.isHost,
        e?.firstName,
        e?.lastName,
        e?.isInfluencer,
        e?.address,
        e?.displayName,
        e?.instagramUsername,
        e?.tiktokUsername,
        e?.youtubeUsername,
        e?.birthDate,
        e?.uid,
        e?.biography
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
