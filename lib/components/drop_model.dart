import '/components/drop2/drop2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'drop_widget.dart' show DropWidget;
import 'package:flutter/material.dart';

class DropModel extends FlutterFlowModel<DropWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for drop2 component.
  late Drop2Model drop2Model;

  @override
  void initState(BuildContext context) {
    drop2Model = createModel(context, () => Drop2Model());
  }

  @override
  void dispose() {
    drop2Model.dispose();
  }
}
