import '/flutter_flow/flutter_flow_util.dart';
import 'highlight_photos_widget.dart' show HighlightPhotosWidget;
import 'package:flutter/material.dart';

class HighlightPhotosModel extends FlutterFlowModel<HighlightPhotosWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> listbytes = [];
  void addToListbytes(FFUploadedFile item) => listbytes.add(item);
  void removeFromListbytes(FFUploadedFile item) => listbytes.remove(item);
  void removeAtIndexFromListbytes(int index) => listbytes.removeAt(index);
  void insertAtIndexInListbytes(int index, FFUploadedFile item) =>
      listbytes.insert(index, item);
  void updateListbytesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      listbytes[index] = updateFn(listbytes[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

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
