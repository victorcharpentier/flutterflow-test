import '/flutter_flow/flutter_flow_util.dart';
import 'describe_your_space_usages_widget.dart'
    show DescribeYourSpaceUsagesWidget;
import 'package:flutter/material.dart';

class DescribeYourSpaceUsagesModel
    extends FlutterFlowModel<DescribeYourSpaceUsagesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;

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
