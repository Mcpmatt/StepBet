import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

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

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "has_cashed_out" field.
  bool? _hasCashedOut;
  bool get hasCashedOut => _hasCashedOut ?? false;
  bool hasHasCashedOut() => _hasCashedOut != null;

  // "token_count" field.
  int? _tokenCount;
  int get tokenCount => _tokenCount ?? 0;
  bool hasTokenCount() => _tokenCount != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "has_cashed_out_plinko" field.
  bool? _hasCashedOutPlinko;
  bool get hasCashedOutPlinko => _hasCashedOutPlinko ?? false;
  bool hasHasCashedOutPlinko() => _hasCashedOutPlinko != null;

  // "step_count" field.
  int? _stepCount;
  int get stepCount => _stepCount ?? 0;
  bool hasStepCount() => _stepCount != null;

  // "vault_value" field.
  int? _vaultValue;
  int get vaultValue => _vaultValue ?? 0;
  bool hasVaultValue() => _vaultValue != null;

  // "userFeedback" field.
  bool? _userFeedback;
  bool get userFeedback => _userFeedback ?? false;
  bool hasUserFeedback() => _userFeedback != null;

  // "bets_placed" field.
  int? _betsPlaced;
  int get betsPlaced => _betsPlaced ?? 0;
  bool hasBetsPlaced() => _betsPlaced != null;

  // "total_bet_amount" field.
  int? _totalBetAmount;
  int get totalBetAmount => _totalBetAmount ?? 0;
  bool hasTotalBetAmount() => _totalBetAmount != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _hasCashedOut = snapshotData['has_cashed_out'] as bool?;
    _tokenCount = castToType<int>(snapshotData['token_count']);
    _title = snapshotData['title'] as String?;
    _hasCashedOutPlinko = snapshotData['has_cashed_out_plinko'] as bool?;
    _stepCount = castToType<int>(snapshotData['step_count']);
    _vaultValue = castToType<int>(snapshotData['vault_value']);
    _userFeedback = snapshotData['userFeedback'] as bool?;
    _betsPlaced = castToType<int>(snapshotData['bets_placed']);
    _totalBetAmount = castToType<int>(snapshotData['total_bet_amount']);
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
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? hasCashedOut,
  int? tokenCount,
  String? title,
  bool? hasCashedOutPlinko,
  int? stepCount,
  int? vaultValue,
  bool? userFeedback,
  int? betsPlaced,
  int? totalBetAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'has_cashed_out': hasCashedOut,
      'token_count': tokenCount,
      'title': title,
      'has_cashed_out_plinko': hasCashedOutPlinko,
      'step_count': stepCount,
      'vault_value': vaultValue,
      'userFeedback': userFeedback,
      'bets_placed': betsPlaced,
      'total_bet_amount': totalBetAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.hasCashedOut == e2?.hasCashedOut &&
        e1?.tokenCount == e2?.tokenCount &&
        e1?.title == e2?.title &&
        e1?.hasCashedOutPlinko == e2?.hasCashedOutPlinko &&
        e1?.stepCount == e2?.stepCount &&
        e1?.vaultValue == e2?.vaultValue &&
        e1?.userFeedback == e2?.userFeedback &&
        e1?.betsPlaced == e2?.betsPlaced &&
        e1?.totalBetAmount == e2?.totalBetAmount;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.hasCashedOut,
        e?.tokenCount,
        e?.title,
        e?.hasCashedOutPlinko,
        e?.stepCount,
        e?.vaultValue,
        e?.userFeedback,
        e?.betsPlaced,
        e?.totalBetAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
