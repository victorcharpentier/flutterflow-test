import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/evaluation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reviews_widget.dart' show ReviewsWidget;
import 'package:flutter/material.dart';

class ReviewsModel extends FlutterFlowModel<ReviewsWidget> {
  ///  Local state fields for this page.

  ReviewStruct? reviews;
  void updateReviewsStruct(Function(ReviewStruct) updateFn) =>
      updateFn(reviews ??= ReviewStruct());

  ///  State fields for stateful widgets in this page.

  // Model for evaluationBar component.
  late EvaluationBarModel evaluationBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    evaluationBarModel = createModel(context, () => EvaluationBarModel());
  }

  @override
  void dispose() {
    evaluationBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
