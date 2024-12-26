import '/flutter_flow/flutter_flow_util.dart';
import 'account_page_widget.dart' show AccountPageWidget;
import 'package:flutter/material.dart';

class AccountPageModel extends FlutterFlowModel<AccountPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField-WIthdrawAmount widget.
  FocusNode? textFieldWIthdrawAmountFocusNode;
  TextEditingController? textFieldWIthdrawAmountTextController;
  String? Function(BuildContext, String?)?
      textFieldWIthdrawAmountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldWIthdrawAmountFocusNode?.dispose();
    textFieldWIthdrawAmountTextController?.dispose();
  }
}
