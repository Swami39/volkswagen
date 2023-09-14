import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "spentAt" field.
  String? _spentAt;
  String get spentAt => _spentAt ?? '';
  bool hasSpentAt() => _spentAt != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "dateSpent" field.
  DateTime? _dateSpent;
  DateTime? get dateSpent => _dateSpent;
  bool hasDateSpent() => _dateSpent != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _spentAt = snapshotData['spentAt'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _dateSpent = snapshotData['dateSpent'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  String? name,
  String? spentAt,
  double? amount,
  DateTime? dateSpent,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'spentAt': spentAt,
      'amount': amount,
      'dateSpent': dateSpent,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.spentAt == e2?.spentAt &&
        e1?.amount == e2?.amount &&
        e1?.dateSpent == e2?.dateSpent &&
        e1?.status == e2?.status;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality()
      .hash([e?.name, e?.spentAt, e?.amount, e?.dateSpent, e?.status]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
