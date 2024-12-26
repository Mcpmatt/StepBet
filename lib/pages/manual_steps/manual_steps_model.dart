import '/flutter_flow/flutter_flow_util.dart';
import 'manual_steps_widget.dart' show ManualStepsWidget;
import 'package:flutter/material.dart';

class ManualStepsModel extends FlutterFlowModel<ManualStepsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ManualStepEntry widget.
  FocusNode? manualStepEntryFocusNode;
  TextEditingController? manualStepEntryTextController;
  String? Function(BuildContext, String?)?
      manualStepEntryTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    manualStepEntryFocusNode?.dispose();
    manualStepEntryTextController?.dispose();
  }
}
