import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_setup_model.dart';
export 'profile_setup_model.dart';

class ProfileSetupWidget extends StatefulWidget {
  const ProfileSetupWidget({super.key});

  @override
  State<ProfileSetupWidget> createState() => _ProfileSetupWidgetState();
}

class _ProfileSetupWidgetState extends State<ProfileSetupWidget> {
  late ProfileSetupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileSetupModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileSetup'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        body: SafeArea(
          top: true,
          child: SafeArea(
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Enter User Name',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Name...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 26.0, 24.0, 26.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              maxLength: 15,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Select Avatar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 7.0),
                                child: Container(
                                  width: 68.0,
                                  height: 68.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        'https://pbs.twimg.com/profile_images/1654003218911838209/fq6vS2a8_400x400.jpg',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(68.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 20.0,
                                buttonSize: 37.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 21.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PROFILE_SETUP_PAGE_add_ICN_ON_TAP');
                                  logFirebaseEvent(
                                      'IconButton_update_app_state');
                                  FFAppState().profileUrl =
                                      'https://pbs.twimg.com/profile_images/1654003218911838209/fq6vS2a8_400x400.jpg';
                                  safeSetState(() {});
                                },
                              ),
                            ],
                          ),
                          Stack(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 7.0),
                                child: Container(
                                  width: 68.0,
                                  height: 68.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        'https://a.storyblok.com/f/197805/e6aae15449/how_to_draw_a_minion_main_image.jpg/m/0x0/filters:format(avif):quality(75)',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(68.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 20.0,
                                buttonSize: 37.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 21.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PROFILE_SETUP_PAGE_add_ICN_ON_TAP');
                                  if (valueOrDefault(
                                          currentUserDocument?.vaultValue, 0) >=
                                      5000) {
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().profileUrl =
                                        'https://www.linearity.io/blog/content/images/2023/06/how-to-draw-a-minion-NewBlogCover.png';
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You can only unlock this avatar with \'Gambler\' title!',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    return;
                                  }
                                },
                              ),
                            ],
                          ),
                          Stack(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 7.0),
                                child: Container(
                                  width: 68.0,
                                  height: 68.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        'https://ih1.redbubble.net/image.4940776034.1987/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(68.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 20.0,
                                buttonSize: 37.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 21.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PROFILE_SETUP_PAGE_add_ICN_ON_TAP');
                                  if (valueOrDefault(
                                          currentUserDocument?.vaultValue, 0) >=
                                      25000) {
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().profileUrl =
                                        'https://www.linearity.io/blog/content/images/2023/06/how-to-draw-a-minion-NewBlogCover.png';
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You can only unlock this avatar with \'Baller\' title!',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    return;
                                  }
                                },
                              ),
                            ],
                          ),
                          Stack(
                            alignment: const AlignmentDirectional(-1.0, 1.0),
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 7.0),
                                child: Container(
                                  width: 68.0,
                                  height: 68.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        'https://imgflip.com/s/meme/Leonardo-Dicaprio-Cheers.jpg',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(68.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 20.0,
                                buttonSize: 37.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.add,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 21.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'PROFILE_SETUP_PAGE_add_ICN_ON_TAP');
                                  if (valueOrDefault(
                                          currentUserDocument?.vaultValue, 0) >=
                                      500000) {
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    FFAppState().profileUrl =
                                        'https://www.linearity.io/blog/content/images/2023/06/how-to-draw-a-minion-NewBlogCover.png';
                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'IconButton_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You can only unlock this avatar with \'High Roller\' title!',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    return;
                                  }
                                },
                              ),
                            ],
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PROFILE_SETUP_PAGE_SUBMIT_BTN_ON_TAP');
                              if (_model.textController.text != '') {
                                logFirebaseEvent('Button_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  displayName: _model.textController.text,
                                ));
                                logFirebaseEvent('Button_navigate_to');

                                context.goNamed('WelcomePage');
                              } else {
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('WelcomePage');
                              }
                            },
                            text: 'Submit',
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 75.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
