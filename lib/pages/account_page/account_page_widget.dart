import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drop2/drop2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'account_page_model.dart';
export 'account_page_model.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({
    super.key,
    String? withdrawAmount,
  }) : withdrawAmount = withdrawAmount ?? '';

  final String withdrawAmount;

  @override
  State<AccountPageWidget> createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  late AccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AccountPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ACCOUNT_AccountPage_ON_INIT_STATE');
      if (dateTimeFormat(
            "yMd",
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ) !=
          valueOrDefault<String>(
            dateTimeFormat(
              "yMd",
              FFAppState().LastLogin,
              locale: FFLocalizations.of(context).languageCode,
            ),
            '1/1/2001',
          )) {
        logFirebaseEvent('AccountPage_update_app_state');
        FFAppState().LastLogin = getCurrentTimestamp;
        FFAppState().LoginStreak = FFAppState().LoginStreak + 1;
        FFAppState().DailySteps = 0;
        FFAppState().blackjackVisited = false;
        FFAppState().stepGoalReached = false;
        FFAppState().plinkoVisited = false;
        FFAppState().stepsEntered = false;
        FFAppState().leaderboardVisited = false;
        FFAppState().minesweeperVisited = false;
        FFAppState().appExplored = false;
        if (dateTimeFormat(
              "M",
              getCurrentTimestamp,
              locale: FFLocalizations.of(context).languageCode,
            ) !=
            dateTimeFormat(
              "M",
              FFAppState().LastLogin,
              locale: FFLocalizations.of(context).languageCode,
            )) {
          logFirebaseEvent('AccountPage_update_app_state');
          FFAppState().userFeedback = false;
        }
        if (FFAppState().LoginStreak > 5) {
          logFirebaseEvent('AccountPage_update_app_state');
          FFAppState().LoginStreak = 1;
        } else {
          if (FFAppState().LoginStreak > 4) {
            logFirebaseEvent('AccountPage_backend_call');

            await currentUserReference!.update({
              ...mapToFirestore(
                {
                  'token_count': FieldValue.increment(500),
                },
              ),
            });
          }
        }
      } else {
        logFirebaseEvent('AccountPage_update_app_state');
        FFAppState().LastLogin = getCurrentTimestamp;
        if ((FFAppState().DailySteps >= 10000) &&
            !FFAppState().stepGoalReached) {
          logFirebaseEvent('AccountPage_backend_call');

          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'token_count': FieldValue.increment(100),
              },
            ),
          });
          logFirebaseEvent('AccountPage_update_app_state');
          FFAppState().stepGoalReached = true;
        }
        if ((FFAppState().blackjackVisited &&
                FFAppState().plinkoVisited &&
                FFAppState().leaderboardVisited &&
                FFAppState().stepsEntered) &&
            (FFAppState().appExplored == false)) {
          logFirebaseEvent('AccountPage_backend_call');

          await currentUserReference!.update({
            ...mapToFirestore(
              {
                'token_count': FieldValue.increment(300),
              },
            ),
          });
          logFirebaseEvent('AccountPage_update_app_state');
          FFAppState().appExplored = true;
        }
      }
    });

    _model.textFieldWIthdrawAmountTextController ??= TextEditingController();
    _model.textFieldWIthdrawAmountFocusNode ??= FocusNode();

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/blurred_casino_background.png'
                      : 'assets/images/CasinoBackground2.png',
                ).image,
              ),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 800.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                key: const ValueKey('Text_f0f3'),
                                'My Account',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  letterSpacing: 0.0,
                                  shadows: [
                                    const Shadow(
                                      color: Color(0xFF040404),
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 10.0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Align(
                                alignment: const AlignmentDirectional(1.0, -1.0),
                                child: Container(
                                  width: 81.0,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderRadius: 24.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.person,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'ACCOUNT_PAGE_PAGE_person_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_alert_dialog');
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: true,
                                          targetAnchor: const AlignmentDirectional(
                                                  1.0, 1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: const Drop2Widget(),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xDCFFFFFF)
                                    : const Color(0xB6424242),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (currentUserDisplayName != '')
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              currentUserDisplayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            'Rank: ${functions.tokensToRanks(valueOrDefault(currentUserDocument?.vaultValue, 0))}'
                                                .maybeHandleOverflow(
                                              maxChars: 25,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  color: () {
                                                    if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.tokenCount,
                                                            0) <
                                                        100) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .success;
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.tokenCount,
                                                                0) >=
                                                            100) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.tokenCount,
                                                                0) <
                                                            250)) {
                                                      return const Color(0xFF23D867);
                                                    } else if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.tokenCount,
                                                                0) >=
                                                            250) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.tokenCount,
                                                                0) <
                                                            500)) {
                                                      return const Color(0xFFDA822F);
                                                    } else {
                                                      return const Color(0xFFDFC20F);
                                                    }
                                                  }(),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xDCFFFFFF)
                                    : const Color(0xB6424242),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'User Statistics',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total Steps',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                valueOrDefault(
                                                        currentUserDocument
                                                            ?.stepCount,
                                                        0)
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total Bets',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault(
                                                      currentUserDocument
                                                          ?.betsPlaced,
                                                      0)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Vault Balance',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              formatNumber(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.vaultValue,
                                                    0),
                                                formatType: FormatType.compact,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ].divide(const SizedBox(height: 18.0)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xDEFFFFFF)
                                    : const Color(0xB6424242),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Step Entry',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Inter Tight',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  FFButtonWidget(
                                    key: const ValueKey('StepNavButton_c7ty'),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ACCOUNT_PAGE_PAGE_StepNavButton_ON_TAP');
                                      logFirebaseEvent(
                                          'StepNavButton_navigate_to');

                                      context.pushNamed('ManualSteps');

                                      logFirebaseEvent(
                                          'StepNavButton_google_analytics_event');
                                      logFirebaseEvent(
                                        'enterCasino',
                                        parameters: {
                                          'casinoEnterClick':
                                              'casinoEnterClick',
                                        },
                                      );
                                    },
                                    text: 'Enter Steps',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 65.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 18.0)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? const Color(0xDDFFFFFF)
                                    : const Color(0xB6424242),
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 5.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My Wallet',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                      fontFamily: 'Inter Tight',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      shadows: [
                                        Shadow(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 6.0,
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Bank Balance',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              formatNumber(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.tokenCount,
                                                    0),
                                                formatType: FormatType.compact,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Wallet Balance',
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            formatNumber(
                                              FFAppState().gameTokens,
                                              formatType: FormatType.compact,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Inter Tight',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller: _model
                                        .textFieldWIthdrawAmountTextController,
                                    focusNode:
                                        _model.textFieldWIthdrawAmountFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: widget.withdrawAmount,
                                      hintText: 'Please Enter Withdrawal...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .textFieldWIthdrawAmountTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'ACCOUNT_WITHDRAW_TO_WALLET_BTN_ON_TAP');
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().gameTokens = FFAppState()
                                              .gameTokens +
                                          int.parse(_model
                                              .textFieldWIthdrawAmountTextController
                                              .text);
                                      if (FFAppState().gameTokens >
                                          valueOrDefault(
                                              currentUserDocument?.tokenCount,
                                              0)) {
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().gameTokens = FFAppState()
                                                .gameTokens +
                                            (-int.parse(_model
                                                .textFieldWIthdrawAmountTextController
                                                .text));
                                        logFirebaseEvent(
                                            'Button_update_app_state');
                                        FFAppState().gameTokens = FFAppState()
                                                .gameTokens +
                                            valueOrDefault(
                                                currentUserDocument?.tokenCount,
                                                0);
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          tokenCount: 0,
                                        ));
                                      } else {
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'token_count': FieldValue
                                                  .increment(-(int.parse(_model
                                                      .textFieldWIthdrawAmountTextController
                                                      .text))),
                                            },
                                          ),
                                        });
                                      }

                                      logFirebaseEvent('Button_alert_dialog');
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          'Withdraw Tokens'),
                                                      content: const Text(
                                                          'Tokens Withdrawn!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: const Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              const Text('Confirm'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ) ??
                                              false;
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'HomePage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                    text: 'Withdraw to Wallet',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 18.0)),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 24.0))
                          .addToEnd(const SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
