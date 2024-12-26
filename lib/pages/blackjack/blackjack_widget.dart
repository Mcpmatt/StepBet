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
import 'blackjack_model.dart';
export 'blackjack_model.dart';

class BlackjackWidget extends StatefulWidget {
  const BlackjackWidget({super.key});

  @override
  State<BlackjackWidget> createState() => _BlackjackWidgetState();
}

class _BlackjackWidgetState extends State<BlackjackWidget> {
  late BlackjackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlackjackModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Blackjack'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BLACKJACK_PAGE_Blackjack_ON_INIT_STATE');
      logFirebaseEvent('Blackjack_update_app_state');
      FFAppState().blackjackVisited = true;
      logFirebaseEvent('Blackjack_update_page_state');
      _model.tempWalletValue = FFAppState().gameTokens;
      safeSetState(() {});
      if (FFAppState().gameTokens == _model.tempWalletValue ? true : false) {
        logFirebaseEvent('Blackjack_update_app_state');
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
          body: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: SafeArea(
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BLACKJACK_PAGE_EXIT_BTN_ON_TAP');
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.hasCashedOut,
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
                                hasCashedOut: false,
                              ));
                            },
                            text: 'Exit',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.65,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFFA1B27),
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
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.95,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FlutterFlowWebView(
                        content:
                            'https://mcpmatt.github.io/Blackjack305?tokens=${_model.tempWalletValue?.toString()}&uid=$currentUserUid&cloudFunction=https://us-central1-fitness305-casino-dkmau0.cloudfunctions.net/handleCashout',
                        bypass: false,
                        height: MediaQuery.sizeOf(context).height * 0.99,
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
