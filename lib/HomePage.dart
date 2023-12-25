import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  get unfocusNode => null;

  @override
  _HomePage createState() => _HomePage();

  void dispose() {}
}

class _HomePage extends State<HomePage>
    with TickerProviderStateMixin {
  late HomePage _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasButtonTriggered = false;
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  // @override
  // void initState() {
  //   super.initState();
  //   _model = createModel(context, () => HomePage());
  //
  //   setupAnimations(
  //     animationsMap.values.where((anim) =>
  //     anim.trigger == AnimationTrigger.onActionTrigger ||
  //         !anim.applyInitialState),
  //     this,
  //   );
  // }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFE8EAED),
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Onboarding',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 15),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: Image.asset(
                              'assets/images/360_F_211146733_iDO91Irop3sEE9ppNiav1aMAfzqi3u3b.jpg',
                              fit: BoxFit.contain,
                            ),
                            allowRotation: false,
                            tag: 'imageTag',
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'imageTag',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          'assets/images/360_F_211146733_iDO91Irop3sEE9ppNiav1aMAfzqi3u3b.jpg',
                          width: 391,
                          height: 300,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Medicare',
                        style:
                        FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF121E86),
                          fontSize: 30,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text:
                        '\nEmbark on your journey to wellness with Medicare, where compassionate care meets seamless accessibility. \nGet started or log in to experience healthcare at your fingertips.',
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 190, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          // context.pushNamed('Doctorprofile');
                        },
                        text: 'Doctor',
                        options: FFButtonOptions(
                          height: 40,
                          padding:
                          EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF0544A8),
                          textStyle: FlutterFlowTheme.of(context).titleMedium,
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(140, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            // context.pushNamed('MyAuth');
                          },
                          text: 'Patient',
                          options: FFButtonOptions(
                            height: 40,
                            padding:
                            EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                            iconPadding: EdgeInsets.all(0),
                            color: Color(0xFF0544A8),
                            textStyle: FlutterFlowTheme.of(context).titleMedium,
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ).animateOnActionTrigger(
                            animationsMap['buttonOnActionTriggerAnimation']!,
                            hasBeenTriggered: hasButtonTriggered),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        ),
      ),
    );
  }

  FlutterFlowExpandedImageView({required Image image, required bool allowRotation, required String tag, required bool useHeroAnimation}) {}
}
