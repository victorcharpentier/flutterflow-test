import '/components/content_price_summary_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_to_book_widget.dart' show RequestToBookWidget;
import 'package:flutter/material.dart';

class RequestToBookModel extends FlutterFlowModel<RequestToBookWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ContentPriceSummary component.
  late ContentPriceSummaryModel contentPriceSummaryModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    contentPriceSummaryModel =
        createModel(context, () => ContentPriceSummaryModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    contentPriceSummaryModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
