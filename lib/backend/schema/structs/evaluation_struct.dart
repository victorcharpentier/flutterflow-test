// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EvaluationStruct extends FFFirebaseStruct {
  EvaluationStruct({
    double? globalEvaluation,
    double? cleanlinessEvaluation,
    double? comfortEvaluation,
    double? locationEvaluation,
    double? accuracyEvaluation,
    double? staffEvaluation,
    double? valueEvaluation,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _globalEvaluation = globalEvaluation,
        _cleanlinessEvaluation = cleanlinessEvaluation,
        _comfortEvaluation = comfortEvaluation,
        _locationEvaluation = locationEvaluation,
        _accuracyEvaluation = accuracyEvaluation,
        _staffEvaluation = staffEvaluation,
        _valueEvaluation = valueEvaluation,
        super(firestoreUtilData);

  // "global_evaluation" field.
  double? _globalEvaluation;
  double get globalEvaluation => _globalEvaluation ?? 0.0;
  set globalEvaluation(double? val) => _globalEvaluation = val;
  void incrementGlobalEvaluation(double amount) =>
      _globalEvaluation = globalEvaluation + amount;
  bool hasGlobalEvaluation() => _globalEvaluation != null;

  // "cleanliness_evaluation" field.
  double? _cleanlinessEvaluation;
  double get cleanlinessEvaluation => _cleanlinessEvaluation ?? 0.0;
  set cleanlinessEvaluation(double? val) => _cleanlinessEvaluation = val;
  void incrementCleanlinessEvaluation(double amount) =>
      _cleanlinessEvaluation = cleanlinessEvaluation + amount;
  bool hasCleanlinessEvaluation() => _cleanlinessEvaluation != null;

  // "comfort_evaluation" field.
  double? _comfortEvaluation;
  double get comfortEvaluation => _comfortEvaluation ?? 0.0;
  set comfortEvaluation(double? val) => _comfortEvaluation = val;
  void incrementComfortEvaluation(double amount) =>
      _comfortEvaluation = comfortEvaluation + amount;
  bool hasComfortEvaluation() => _comfortEvaluation != null;

  // "location_evaluation" field.
  double? _locationEvaluation;
  double get locationEvaluation => _locationEvaluation ?? 0.0;
  set locationEvaluation(double? val) => _locationEvaluation = val;
  void incrementLocationEvaluation(double amount) =>
      _locationEvaluation = locationEvaluation + amount;
  bool hasLocationEvaluation() => _locationEvaluation != null;

  // "accuracy_evaluation" field.
  double? _accuracyEvaluation;
  double get accuracyEvaluation => _accuracyEvaluation ?? 0.0;
  set accuracyEvaluation(double? val) => _accuracyEvaluation = val;
  void incrementAccuracyEvaluation(double amount) =>
      _accuracyEvaluation = accuracyEvaluation + amount;
  bool hasAccuracyEvaluation() => _accuracyEvaluation != null;

  // "staff_evaluation" field.
  double? _staffEvaluation;
  double get staffEvaluation => _staffEvaluation ?? 0.0;
  set staffEvaluation(double? val) => _staffEvaluation = val;
  void incrementStaffEvaluation(double amount) =>
      _staffEvaluation = staffEvaluation + amount;
  bool hasStaffEvaluation() => _staffEvaluation != null;

  // "value_evaluation" field.
  double? _valueEvaluation;
  double get valueEvaluation => _valueEvaluation ?? 0.0;
  set valueEvaluation(double? val) => _valueEvaluation = val;
  void incrementValueEvaluation(double amount) =>
      _valueEvaluation = valueEvaluation + amount;
  bool hasValueEvaluation() => _valueEvaluation != null;

  static EvaluationStruct fromMap(Map<String, dynamic> data) =>
      EvaluationStruct(
        globalEvaluation: castToType<double>(data['global_evaluation']),
        cleanlinessEvaluation:
            castToType<double>(data['cleanliness_evaluation']),
        comfortEvaluation: castToType<double>(data['comfort_evaluation']),
        locationEvaluation: castToType<double>(data['location_evaluation']),
        accuracyEvaluation: castToType<double>(data['accuracy_evaluation']),
        staffEvaluation: castToType<double>(data['staff_evaluation']),
        valueEvaluation: castToType<double>(data['value_evaluation']),
      );

  static EvaluationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EvaluationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'global_evaluation': _globalEvaluation,
        'cleanliness_evaluation': _cleanlinessEvaluation,
        'comfort_evaluation': _comfortEvaluation,
        'location_evaluation': _locationEvaluation,
        'accuracy_evaluation': _accuracyEvaluation,
        'staff_evaluation': _staffEvaluation,
        'value_evaluation': _valueEvaluation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'global_evaluation': serializeParam(
          _globalEvaluation,
          ParamType.double,
        ),
        'cleanliness_evaluation': serializeParam(
          _cleanlinessEvaluation,
          ParamType.double,
        ),
        'comfort_evaluation': serializeParam(
          _comfortEvaluation,
          ParamType.double,
        ),
        'location_evaluation': serializeParam(
          _locationEvaluation,
          ParamType.double,
        ),
        'accuracy_evaluation': serializeParam(
          _accuracyEvaluation,
          ParamType.double,
        ),
        'staff_evaluation': serializeParam(
          _staffEvaluation,
          ParamType.double,
        ),
        'value_evaluation': serializeParam(
          _valueEvaluation,
          ParamType.double,
        ),
      }.withoutNulls;

  static EvaluationStruct fromSerializableMap(Map<String, dynamic> data) =>
      EvaluationStruct(
        globalEvaluation: deserializeParam(
          data['global_evaluation'],
          ParamType.double,
          false,
        ),
        cleanlinessEvaluation: deserializeParam(
          data['cleanliness_evaluation'],
          ParamType.double,
          false,
        ),
        comfortEvaluation: deserializeParam(
          data['comfort_evaluation'],
          ParamType.double,
          false,
        ),
        locationEvaluation: deserializeParam(
          data['location_evaluation'],
          ParamType.double,
          false,
        ),
        accuracyEvaluation: deserializeParam(
          data['accuracy_evaluation'],
          ParamType.double,
          false,
        ),
        staffEvaluation: deserializeParam(
          data['staff_evaluation'],
          ParamType.double,
          false,
        ),
        valueEvaluation: deserializeParam(
          data['value_evaluation'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'EvaluationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EvaluationStruct &&
        globalEvaluation == other.globalEvaluation &&
        cleanlinessEvaluation == other.cleanlinessEvaluation &&
        comfortEvaluation == other.comfortEvaluation &&
        locationEvaluation == other.locationEvaluation &&
        accuracyEvaluation == other.accuracyEvaluation &&
        staffEvaluation == other.staffEvaluation &&
        valueEvaluation == other.valueEvaluation;
  }

  @override
  int get hashCode => const ListEquality().hash([
        globalEvaluation,
        cleanlinessEvaluation,
        comfortEvaluation,
        locationEvaluation,
        accuracyEvaluation,
        staffEvaluation,
        valueEvaluation
      ]);
}

EvaluationStruct createEvaluationStruct({
  double? globalEvaluation,
  double? cleanlinessEvaluation,
  double? comfortEvaluation,
  double? locationEvaluation,
  double? accuracyEvaluation,
  double? staffEvaluation,
  double? valueEvaluation,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EvaluationStruct(
      globalEvaluation: globalEvaluation,
      cleanlinessEvaluation: cleanlinessEvaluation,
      comfortEvaluation: comfortEvaluation,
      locationEvaluation: locationEvaluation,
      accuracyEvaluation: accuracyEvaluation,
      staffEvaluation: staffEvaluation,
      valueEvaluation: valueEvaluation,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EvaluationStruct? updateEvaluationStruct(
  EvaluationStruct? evaluation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    evaluation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEvaluationStructData(
  Map<String, dynamic> firestoreData,
  EvaluationStruct? evaluation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (evaluation == null) {
    return;
  }
  if (evaluation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && evaluation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final evaluationData = getEvaluationFirestoreData(evaluation, forFieldValue);
  final nestedData = evaluationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = evaluation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEvaluationFirestoreData(
  EvaluationStruct? evaluation, [
  bool forFieldValue = false,
]) {
  if (evaluation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(evaluation.toMap());

  // Add any Firestore field values
  evaluation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEvaluationListFirestoreData(
  List<EvaluationStruct>? evaluations,
) =>
    evaluations?.map((e) => getEvaluationFirestoreData(e, true)).toList() ?? [];
