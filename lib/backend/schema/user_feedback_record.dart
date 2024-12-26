import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFeedbackRecord extends FirestoreRecord {
  UserFeedbackRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "satisfaction" field.
  double? _satisfaction;
  double get satisfaction => _satisfaction ?? 0.0;
  bool hasSatisfaction() => _satisfaction != null;

  // "easeOfUse" field.
  double? _easeOfUse;
  double get easeOfUse => _easeOfUse ?? 0.0;
  bool hasEaseOfUse() => _easeOfUse != null;

  // "NetPromoterScore" field.
  double? _netPromoterScore;
  double get netPromoterScore => _netPromoterScore ?? 0.0;
  bool hasNetPromoterScore() => _netPromoterScore != null;

  // "Comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _satisfaction = castToType<double>(snapshotData['satisfaction']);
    _easeOfUse = castToType<double>(snapshotData['easeOfUse']);
    _netPromoterScore = castToType<double>(snapshotData['NetPromoterScore']);
    _comments = snapshotData['Comments'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userFeedback')
          : FirebaseFirestore.instance.collectionGroup('userFeedback');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userFeedback').doc(id);

  static Stream<UserFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserFeedbackRecord.fromSnapshot(s));

  static Future<UserFeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserFeedbackRecord.fromSnapshot(s));

  static UserFeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserFeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserFeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserFeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserFeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserFeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserFeedbackRecordData({
  double? satisfaction,
  double? easeOfUse,
  double? netPromoterScore,
  String? comments,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'satisfaction': satisfaction,
      'easeOfUse': easeOfUse,
      'NetPromoterScore': netPromoterScore,
      'Comments': comments,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserFeedbackRecordDocumentEquality
    implements Equality<UserFeedbackRecord> {
  const UserFeedbackRecordDocumentEquality();

  @override
  bool equals(UserFeedbackRecord? e1, UserFeedbackRecord? e2) {
    return e1?.satisfaction == e2?.satisfaction &&
        e1?.easeOfUse == e2?.easeOfUse &&
        e1?.netPromoterScore == e2?.netPromoterScore &&
        e1?.comments == e2?.comments &&
        e1?.user == e2?.user;
  }

  @override
  int hash(UserFeedbackRecord? e) => const ListEquality().hash([
        e?.satisfaction,
        e?.easeOfUse,
        e?.netPromoterScore,
        e?.comments,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is UserFeedbackRecord;
}
