import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'describe_your_space_types_widget.dart'
    show DescribeYourSpaceTypesWidget;
import 'package:flutter/material.dart';

class DescribeYourSpaceTypesModel
    extends FlutterFlowModel<DescribeYourSpaceTypesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PropertiesRecord? property;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
