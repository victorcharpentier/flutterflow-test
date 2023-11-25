import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'highlight_amenities_widget.dart' show HighlightAmenitiesWidget;
import 'package:flutter/material.dart';

class HighlightAmenitiesModel
    extends FlutterFlowModel<HighlightAmenitiesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues1;
  FormFieldController<List<String>>? choiceChipsValueController1;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues2;
  FormFieldController<List<String>>? choiceChipsValueController2;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues3;
  FormFieldController<List<String>>? choiceChipsValueController3;

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
