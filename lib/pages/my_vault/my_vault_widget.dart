import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'my_vault_model.dart';
export 'my_vault_model.dart';

class MyVaultWidget extends StatefulWidget {
  const MyVaultWidget({super.key});

  @override
  State<MyVaultWidget> createState() => _MyVaultWidgetState();
}

class _MyVaultWidgetState extends State<MyVaultWidget> {
  late MyVaultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyVaultModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MyVault'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: AuthUserStreamWidget(
              builder: (context) => FlutterFlowWebView(
                content:
                    'https://mcpmatt.github.io/TreasureVault305/?token_count=${valueOrDefault(currentUserDocument?.tokenCount, 0).toString()}&uid=$currentUserUid&vault_value=${valueOrDefault(currentUserDocument?.vaultValue, 0).toString()}&cloudFunction=https://us-central1-fitness305-casino-dkmau0.cloudfunctions.net/updateUserVault',
                bypass: false,
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                verticalScroll: false,
                horizontalScroll: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
