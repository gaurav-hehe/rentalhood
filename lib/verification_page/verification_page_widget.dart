import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationPageWidget extends StatefulWidget {
  const VerificationPageWidget({Key key}) : super(key: key);

  @override
  _VerificationPageWidgetState createState() => _VerificationPageWidgetState();
}

class _VerificationPageWidgetState extends State<VerificationPageWidget> {
  TextEditingController codeController;
  TextEditingController phoneNoController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    phoneNoController = TextEditingController(text: currentPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEEEE),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 20),
                  child: Text(
                    'Phone Verification',
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF5D5E60),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: AuthUserStreamWidget(
                                child: TextFormField(
                                  controller: phoneNoController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(40, 40, 40, 40),
                            child: TextFormField(
                              onChanged: (_) => EasyDebounce.debounce(
                                'codeController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              controller: codeController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Enter Code',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.sms,
                                ),
                                suffixIcon: codeController.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () => setState(
                                          () => codeController.clear(),
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).subtitle2,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (codeController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enter SMS verification code.'),
                          ),
                        );
                        return;
                      }
                      final phoneVerifiedUser = await verifySmsCode(
                        context: context,
                        smsCode: codeController.text,
                      );
                      if (phoneVerifiedUser == null) {
                        return;
                      }
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePageWidget(
                            userLoc: currentUserDocument?.location,
                          ),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Login',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        width: 1,
                      ),
                      borderRadius: 5,
                    ),
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
