import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'terms_of_services_model.dart';
export 'terms_of_services_model.dart';

class TermsOfServicesWidget extends StatefulWidget {
  const TermsOfServicesWidget({super.key});

  @override
  State<TermsOfServicesWidget> createState() => _TermsOfServicesWidgetState();
}

class _TermsOfServicesWidgetState extends State<TermsOfServicesWidget> {
  late TermsOfServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsOfServicesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TermsOfServices'});
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
            width: 477.0,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Text(
                    'Terms Of  Service',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Inter Tight',
                          fontSize: 46.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 526.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Lorem ipsum odor amet, consectetuer adipiscing elit. Ex cursus ante sit at volutpat enim id pharetra ultrices? Rutrum commodo ridiculus; auctor magna eget pretium facilisis curae. Leo inceptos duis tincidunt consectetur risus; magnis eleifend. Finibus urna quam adipiscing aptent molestie eleifend justo nullam. Viverra tincidunt fusce turpis elit non sollicitudin suscipit. Laoreet sodales semper euismod morbi ipsum ut proin curae. Tempor rutrum tortor sociosqu, mus a porttitor. Sociosqu penatibus lorem massa iaculis velit semper urna maecenas.\n\nRisus dolor imperdiet leo lobortis eu. Ornare ligula facilisis bibendum tincidunt ultrices malesuada lacus mauris. Phasellus eu sit morbi tincidunt magnis aliquam nam metus. Quam vehicula dis a conubia semper quisque venenatis tellus. Massa ultrices curae pretium nostra malesuada mauris lacus. Nibh fermentum nibh facilisi facilisi magna nisl dis. Senectus quisque consectetur vivamus nibh egestas iaculis. Fames laoreet senectus dui ac lacus sit.\n\nPosuere cras diam cras commodo morbi iaculis ultricies. Himenaeos est mus etiam in, in purus. Ultrices taciti sagittis vel porta tempor penatibus dapibus mollis fringilla. Ante interdum hendrerit integer purus auctor turpis. Tempus vulputate quam hac donec amet. Hac non potenti platea praesent inceptos turpis conubia vestibulum. Augue nunc gravida sem elit fringilla sociosqu. Venenatis suspendisse fermentum donec ante porttitor auctor blandit facilisi.\n\nNisl consequat nisi tempor purus eleifend. Ante sociosqu congue natoque id taciti. Risus semper taciti ornare augue phasellus. Donec lacinia velit, gravida interdum feugiat diam? Morbi malesuada pharetra sapien tortor feugiat ex sed vel. Inceptos elit litora est sem inceptos per curabitur at. Phasellus curabitur leo aenean sollicitudin accumsan sapien dignissim etiam. Tortor curabitur et donec montes dapibus diam vitae.\n\nPlacerat nulla ridiculus fames egestas tellus donec vel est! Blandit interdum hendrerit sagittis erat morbi tempor vulputate risus mauris. Ullamcorper phasellus volutpat molestie sapien mus conubia. Molestie aliquam orci pharetra imperdiet tincidunt porttitor pellentesque. Semper aenean finibus efficitur mollis dolor maecenas sodales blandit. Feugiat aptent ligula tincidunt, erat ad varius libero. Rutrum scelerisque commodo diam ut ac egestas aenean nam neque.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            fontSize: 10.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TERMS_OF_SERVICES_PAGE_ACCEPT_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('AccountPage');
                            },
                            text: 'Accept',
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 75.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TERMS_OF_SERVICES_PAGE_DENY_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('LoginPage');
                            },
                            text: 'Deny',
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 75.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
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
    );
  }
}
