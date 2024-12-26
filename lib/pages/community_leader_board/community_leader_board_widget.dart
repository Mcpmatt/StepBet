import '/components/leaderboard_bets_amount_widget.dart';
import '/components/leaderboard_bets_widget.dart';
import '/components/leaderboard_steps_widget.dart';
import '/components/leaderboard_token_widget.dart';
import '/components/leaderboard_vault_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'community_leader_board_model.dart';
export 'community_leader_board_model.dart';

class CommunityLeaderBoardWidget extends StatefulWidget {
  const CommunityLeaderBoardWidget({super.key});

  @override
  State<CommunityLeaderBoardWidget> createState() =>
      _CommunityLeaderBoardWidgetState();
}

class _CommunityLeaderBoardWidgetState extends State<CommunityLeaderBoardWidget>
    with TickerProviderStateMixin {
  late CommunityLeaderBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityLeaderBoardModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CommunityLeaderBoard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COMMUNITY_LEADER_BOARD_CommunityLeaderBo');
      logFirebaseEvent('CommunityLeaderBoard_update_app_state');
      FFAppState().leaderboardVisited = true;
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: SafeArea(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF7C7474),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/blurred_casino_background.png'
                        : 'assets/images/CasinoBackground1.png',
                  ).image,
                ),
              ),
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: 800.0,
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Text(
                          'Leaderboard',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Inter Tight',
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.white
                                    : FlutterFlowTheme.of(context).primaryText,
                            fontSize: 50.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            shadows: [
                              const Shadow(
                                color: Color(0xFF090909),
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        decoration: BoxDecoration(
                          color: const Color(0x7FFFFFFF),
                          borderRadius: BorderRadius.circular(0.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: const Alignment(0.0, 0),
                                child: TabBar(
                                  isScrollable: true,
                                  labelColor: const Color(0xFF0624E7),
                                  unselectedLabelColor: Colors.black,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        letterSpacing: 0.0,
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Inter Tight',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                  indicatorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  tabs: const [
                                    Tab(
                                      text: 'Steps',
                                    ),
                                    Tab(
                                      text: 'Tokens',
                                    ),
                                    Tab(
                                      text: 'Number of Bets ',
                                    ),
                                    Tab(
                                      text: 'Vault',
                                    ),
                                    Tab(
                                      text: 'Bet Amount',
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [
                                      () async {},
                                      () async {},
                                      () async {},
                                      () async {},
                                      () async {}
                                    ][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model:
                                                  _model.leaderboardStepsModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: const LeaderboardStepsWidget(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.leaderboardTokenModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: const LeaderboardTokenWidget(),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.leaderboardBetsModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: const LeaderboardBetsWidget(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Enter Casino',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 75.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model: _model.leaderboardVaultModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: const LeaderboardVaultWidget(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 85.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Enter Casino',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 75.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Inter Tight',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        wrapWithModel(
                                          model:
                                              _model.leaderboardBetsAmountModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: const LeaderboardBetsAmountWidget(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
