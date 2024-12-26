import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'plinko_model.dart';
export 'plinko_model.dart';

class PlinkoWidget extends StatefulWidget {
  /// Plinko Game Page
  const PlinkoWidget({super.key});

  @override
  State<PlinkoWidget> createState() => _PlinkoWidgetState();
}

class _PlinkoWidgetState extends State<PlinkoWidget> {
  late PlinkoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlinkoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Plinko'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PLINKO_PAGE_Plinko_ON_INIT_STATE');
      logFirebaseEvent('Plinko_update_app_state');
      FFAppState().plinkoVisited = true;
      logFirebaseEvent('Plinko_update_page_state');
      _model.tempWalletValue = FFAppState().gameTokens;
      safeSetState(() {});
      if (FFAppState().gameTokens == _model.tempWalletValue) {
        logFirebaseEvent('Plinko_update_app_state');
        FFAppState().gameTokens = 0;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.03,
                      decoration: const BoxDecoration(
                        color: Color(0xFF373E51),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('PLINKO_PAGE_EXIT_BTN_ON_TAP');
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.hasCashedOutPlinko,
                                      false) ==
                                  true) {
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('HomePage');
                              } else {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: const Text('Error:'),
                                        content:
                                            const Text('Please Cash Out to Exit'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                return;
                              }

                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                hasCashedOutPlinko: false,
                              ));
                            },
                            text: 'Exit',
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFFF0000),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                                shadows: [
                                  const Shadow(
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.97,
                      decoration: const BoxDecoration(),
                      child: FlutterFlowWebView(
                        content:
                            'https://step-bet-plinko305.netlify.app/?tokens=${_model.tempWalletValue?.toString()}&uid=$currentUserUid&cloudFunction=https://us-central1-fitness305-casino-dkmau0.cloudfunctions.net/handleCashOutPlinko',
                        bypass: false,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
