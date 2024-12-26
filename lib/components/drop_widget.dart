import '/components/drop2/drop2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drop_model.dart';
export 'drop_model.dart';

class DropWidget extends StatefulWidget {
  const DropWidget({super.key});

  @override
  State<DropWidget> createState() => _DropWidgetState();
}

class _DropWidgetState extends State<DropWidget> {
  late DropModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.drop2Model,
      updateCallback: () => safeSetState(() {}),
      child: const Drop2Widget(),
    );
  }
}
