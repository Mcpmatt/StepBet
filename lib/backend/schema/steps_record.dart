import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StepsRecord extends FirestoreRecord {
  StepsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "event_time" field.
  DateTime? _eventTime;
  DateTime? get eventTime => _eventTime;
  bool hasEventTime() => _eventTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "step_count" field.
  int? _stepCount;
  int get stepCount => _stepCount ?? 0;
  bool hasStepCount() => _stepCount != null;

  void _initializeFields() {
    _eventTime = snapshotData['event_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _stepCount = castToType<int>(snapshotData['step_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('steps');

  static Stream<StepsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StepsRecord.fromSnapshot(s));

  static Future<StepsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StepsRecord.fromSnapshot(s));

  static StepsRecord fromSnapshot(DocumentSnapshot snapshot) => StepsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StepsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StepsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StepsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StepsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStepsRecordData({
  DateTime? eventTime,
  DocumentReference? user,
  int? stepCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_time': eventTime,
      'user': user,
      'step_count': stepCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class StepsRecordDocumentEquality implements Equality<StepsRecord> {
  const StepsRecordDocumentEquality();

  @override
  bool equals(StepsRecord? e1, StepsRecord? e2) {
    return e1?.eventTime == e2?.eventTime &&
        e1?.user == e2?.user &&
        e1?.stepCount == e2?.stepCount;
  }

  @override
  int hash(StepsRecord? e) =>
      const ListEquality().hash([e?.eventTime, e?.user, e?.stepCount]);

  @override
  bool isValidKey(Object? o) => o is StepsRecord;
}
