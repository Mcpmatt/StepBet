import '/components/leaderboard_bets_amount_widget.dart';
import '/components/leaderboard_bets_widget.dart';
import '/components/leaderboard_steps_widget.dart';
import '/components/leaderboard_token_widget.dart';
import '/components/leaderboard_vault_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'community_leader_board_widget.dart' show CommunityLeaderBoardWidget;
import 'package:flutter/material.dart';

class CommunityLeaderBoardModel
    extends FlutterFlowModel<CommunityLeaderBoardWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for leaderboard_steps component.
  late LeaderboardStepsModel leaderboardStepsModel;
  // Model for leaderboard_token component.
  late LeaderboardTokenModel leaderboardTokenModel;
  // Model for leaderboard_Bets component.
  late LeaderboardBetsModel leaderboardBetsModel;
  // Model for leaderboard_Vault component.
  late LeaderboardVaultModel leaderboardVaultModel;
  // Model for leaderboard_BetsAmount component.
  late LeaderboardBetsAmountModel leaderboardBetsAmountModel;

  @override
  void initState(BuildContext context) {
    leaderboardStepsModel = createModel(context, () => LeaderboardStepsModel());
    leaderboardTokenModel = createModel(context, () => LeaderboardTokenModel());
    leaderboardBetsModel = createModel(context, () => LeaderboardBetsModel());
    leaderboardVaultModel = createModel(context, () => LeaderboardVaultModel());
    leaderboardBetsAmountModel =
        createModel(context, () => LeaderboardBetsAmountModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    leaderboardStepsModel.dispose();
    leaderboardTokenModel.dispose();
    leaderboardBetsModel.dispose();
    leaderboardVaultModel.dispose();
    leaderboardBetsAmountModel.dispose();
  }
}
