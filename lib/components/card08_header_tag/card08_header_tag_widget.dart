import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'card08_header_tag_model.dart';
export 'card08_header_tag_model.dart';

class Card08HeaderTagWidget extends StatefulWidget {
  const Card08HeaderTagWidget({super.key});

  @override
  State<Card08HeaderTagWidget> createState() => _Card08HeaderTagWidgetState();
}

class _Card08HeaderTagWidgetState extends State<Card08HeaderTagWidget> {
  late Card08HeaderTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Card08HeaderTagModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
