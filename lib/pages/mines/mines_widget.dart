import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'mines_model.dart';
export 'mines_model.dart';

class MinesWidget extends StatefulWidget {
  /// Mines Game Page
  const MinesWidget({super.key});

  @override
  State<MinesWidget> createState() => _MinesWidgetState();
}

class _MinesWidgetState extends State<MinesWidget> {
  late MinesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Mines'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MINES_PAGE_Mines_ON_INIT_STATE');
      logFirebaseEvent('Mines_update_app_state');
      FFAppState().minesweeperVisited = true;
      logFirebaseEvent('Mines_custom_action');
      await actions.initializeGame();
      logFirebaseEvent('Mines_update_page_state');
      _model.walletValue = FFAppState().gameTokens;
      safeSetState(() {});
      if (_model.walletValue == FFAppState().gameTokens) {
        logFirebaseEvent('Mines_update_app_state');
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
              decoration: const BoxDecoration(
                color: Color(0xFF010128),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.07,
                          decoration: const BoxDecoration(),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Mines',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF1AFF01),
                                    fontSize: 50.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Current Bet: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF00FA00),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  FFAppState().currentBet.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF01FF25),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      const Shadow(
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 2.0,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Tokens: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF03FA03),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.walletValue?.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF06F106),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('MINES_PAGE_Button1_ON_TAP');
                                if (_model.walletValue! >= 1) {
                                  logFirebaseEvent('Button1_update_app_state');
                                  FFAppState().currentBet =
                                      FFAppState().currentBet + 1;
                                  safeSetState(() {});
                                  logFirebaseEvent('Button1_update_page_state');
                                  _model.walletValue = _model.walletValue! + -1;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('Button1_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: const Text('Error!'),
                                          content: const Text('Need More Tokens'),
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
                              },
                              text: '+1',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF4B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('MINES_PAGE_Button10_ON_TAP');
                                if (_model.walletValue! >= 10) {
                                  logFirebaseEvent('Button10_update_app_state');
                                  FFAppState().currentBet =
                                      FFAppState().currentBet + 10;
                                  safeSetState(() {});
                                  logFirebaseEvent(
                                      'Button10_update_page_state');
                                  _model.walletValue =
                                      _model.walletValue! + -10;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('Button10_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: const Text('Error!'),
                                          content: const Text('Need More Tokens'),
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
                              },
                              text: '+10',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF4B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('MINES_PAGE_Button100_ON_TAP');
                                if (_model.walletValue! >= 100) {
                                  logFirebaseEvent(
                                      'Button100_update_app_state');
                                  FFAppState().currentBet =
                                      FFAppState().currentBet + 100;
                                  safeSetState(() {});
                                  logFirebaseEvent(
                                      'Button100_update_page_state');
                                  _model.walletValue =
                                      _model.walletValue! + -100;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('Button100_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: const Text('Error!'),
                                          content: const Text('Need More Tokens'),
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
                              },
                              text: '+100',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF4B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MINES_PAGE_Button1000_ON_TAP');
                                if (_model.walletValue! >= 1000) {
                                  logFirebaseEvent(
                                      'Button1000_update_app_state');
                                  FFAppState().currentBet =
                                      FFAppState().currentBet + 1000;
                                  safeSetState(() {});
                                  logFirebaseEvent(
                                      'Button1000_update_page_state');
                                  _model.walletValue =
                                      _model.walletValue! + -1000;
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent('Button1000_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          title: const Text('Error!'),
                                          content: const Text('Need More Tokens'),
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
                              },
                              text: '+1000',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF4B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ].divide(const SizedBox(width: 20.0)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('MINES_PAGE_NewGameButton_ON_TAP');
                            if ((FFAppState().currentBet > 0) &&
                                (FFAppState().isGameActive == false)) {
                              logFirebaseEvent('NewGameButton_custom_action');
                              await actions.makeBet(
                                FFAppState().currentBet,
                                FFAppState().mineCount,
                              );
                              logFirebaseEvent('NewGameButton_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'total_bet_amount': FieldValue.increment(
                                        FFAppState().currentBet),
                                  },
                                ),
                              });
                              logFirebaseEvent('NewGameButton_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('Game Start!'),
                                      content:
                                          const Text('Tap the TIles and Good Luck!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              logFirebaseEvent(
                                  'NewGameButton_update_app_state');
                              FFAppState().isGameActive = true;
                              safeSetState(() {});
                              logFirebaseEvent('NewGameButton_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'bets_placed': FieldValue.increment(1),
                                  },
                                ),
                              });
                            } else {
                              if ((FFAppState().currentBet > 0) &&
                                  (FFAppState().isGameActive == true)) {
                                return;
                              }

                              logFirebaseEvent('NewGameButton_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('Error: Zero Tokens Bet'),
                                      content: const Text(
                                          'Please Enter the Amount of Tokens to Bet'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              return;
                            }
                          },
                          text: 'Start Game',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'MINES_PAGE_ResetBetButton_ON_TAP');
                            if (FFAppState().isGameActive == false) {
                              logFirebaseEvent(
                                  'ResetBetButton_update_page_state');
                              _model.walletValue =
                                  _model.walletValue! + FFAppState().currentBet;
                              safeSetState(() {});
                              logFirebaseEvent(
                                  'ResetBetButton_update_app_state');
                              FFAppState().currentBet = 0;
                              safeSetState(() {});
                            } else {
                              return;
                            }
                          },
                          text: 'Reset Bet',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= '1',
                          ),
                          options: const ['1', '5', '10', '15', '20', '24'],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue = val);
                            logFirebaseEvent(
                                'MINES_DropDown_9hwj0eta_ON_FORM_WIDGET_S');
                            logFirebaseEvent('DropDown_update_app_state');
                            FFAppState().mineCount =
                                int.parse((_model.dropDownValue!));
                            safeSetState(() {});
                          },
                          width: MediaQuery.sizeOf(context).width * 0.25,
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFFF1F0F0),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          hintText: 'Mines',
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          fillColor: const Color(0xFF4B39EF),
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ].divide(const SizedBox(width: 20.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_5s7wc72v_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      0,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(0) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(0) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(0) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(0) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(0) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_1b1yhu3d_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      1,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(1) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(1) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(1) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(1) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(1) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_1bv1qh0w_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      2,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(2) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(2) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(2) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(2) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(2) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_dt7mdyje_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      3,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(3) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(3) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(3) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(3) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(3) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_not93fl6_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      4,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(4) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(4) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(4) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(4) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(4) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .addToStart(const SizedBox(width: 10.0))
                          .addToEnd(const SizedBox(width: 10.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_vavuz4ge_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      5,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(5) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(5) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(5) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(5) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(5) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_1vz0jdm1_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      6,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(6) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(6) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(6) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(6) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(6) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_81klb5i8_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      7,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(7) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(7) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(7) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(7) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(7) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_3if1bnhu_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      8,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(8) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(8) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(8) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(8) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(8) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_703xzj5h_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      9,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(9) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(9) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(9) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(9) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(9) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .addToStart(const SizedBox(width: 10.0))
                          .addToEnd(const SizedBox(width: 10.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_myrlvmup_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      10,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(10) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(10) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(10) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(10) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(10) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_3no1884z_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      11,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(11) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(11) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(11) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(11) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(11) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_tc5zegkj_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      12,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(12) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(12) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(12) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(12) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(12) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_83klr014_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      13,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(13) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(13) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(13) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(13) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(13) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_qjpgkov9_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      14,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(14) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(14) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(14) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(14) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(14) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .addToStart(const SizedBox(width: 10.0))
                          .addToEnd(const SizedBox(width: 10.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_l0q8231t_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      15,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(15) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(15) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(15) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(15) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(15) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_b6hh4e5x_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      16,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(16) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(16) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(16) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(16) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(16) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_pdp0081k_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      17,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(17) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(17) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(17) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(17) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(17) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_d270760s_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      18,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(18) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(18) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(18) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(18) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(18) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_livwfs5d_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      19,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(19) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(19) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(19) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(19) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(19) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .addToStart(const SizedBox(width: 10.0))
                          .addToEnd(const SizedBox(width: 10.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_xgsoove8_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      20,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(20) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(20) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(20) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(20) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(20) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_3c3nwaet_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      21,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(21) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(21) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(21) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(21) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(21) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_s0oqeq45_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      22,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(22) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(22) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(22) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(22) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(22) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_d1r9tokn_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      23,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(23) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(23) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(23) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(23) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(23) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.2,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MINES_PAGE_Container_wz0swq82_ON_TAP');
                                    logFirebaseEvent('Container_custom_action');
                                    await actions.handleCardTap(
                                      24,
                                    );
                                    if (FFAppState().bombHit == true) {
                                      logFirebaseEvent(
                                          'Container_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('BOOM!'),
                                              content: const Text('You Hit a Mine!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: const Icon(
                                      Icons.question_mark,
                                      color: Colors.white,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                if (FFAppState()
                                        .isRevealed
                                        .elementAtOrNull(24) ==
                                    true)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF4B39EF),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(24) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(24) ==
                                                true))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.bomb,
                                              color: Color(0xFFFA0000),
                                              size: 50.0,
                                            ),
                                          ),
                                        if ((FFAppState()
                                                    .isRevealed
                                                    .elementAtOrNull(24) ==
                                                true) &&
                                            (FFAppState()
                                                    .isBomb
                                                    .elementAtOrNull(24) ==
                                                false))
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.attach_money,
                                              color: Color(0xFF00CD52),
                                              size: 60.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 5.0))
                          .addToStart(const SizedBox(width: 10.0))
                          .addToEnd(const SizedBox(width: 10.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Win Amount:  ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF01FF25),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  FFAppState().winAmount.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF01FF25),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      const Shadow(
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 2.0,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Multiplier: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF03FA03),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  formatNumber(
                                    FFAppState().currentMultiplier,
                                    formatType: FormatType.compact,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF06F106),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('MINES_PAGE_CashInButton_ON_TAP');
                            if (FFAppState().isGameActive == true) {
                              logFirebaseEvent('CashInButton_custom_action');
                              await actions.cashOut();
                              logFirebaseEvent('CashInButton_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('Congratulations! You Won:'),
                                      content: Text(
                                          FFAppState().winAmount.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              logFirebaseEvent(
                                  'CashInButton_update_page_state');
                              _model.walletValue =
                                  _model.walletValue! + FFAppState().winAmount;
                              safeSetState(() {});
                              logFirebaseEvent('CashInButton_update_app_state');
                              FFAppState().winAmount = 0;
                              safeSetState(() {});
                              logFirebaseEvent('CashInButton_update_app_state');
                              FFAppState().isGameActive = false;
                              safeSetState(() {});
                            } else {
                              return;
                            }
                          },
                          text: 'Cash Out',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.08,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Inter Tight',
                              color: const Color(0xFF04F916),
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
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
                        FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('MINES_PAGE_EXIT_BTN_ON_TAP');
                            if (FFAppState().isGameActive == false) {
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'token_count': FieldValue.increment(
                                        _model.walletValue!),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('HomePage');
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      content: const Text(
                                          'Please finish the game before exiting'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              return;
                            }
                          },
                          text: 'Exit',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.4,
                            height: MediaQuery.sizeOf(context).height * 0.08,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Inter Tight',
                              color: const Color(0xFFF00505),
                              fontSize: 50.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
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
                      ].divide(const SizedBox(width: 50.0)),
                    ),
                  ].divide(const SizedBox(height: 15.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
