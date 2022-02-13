import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../my_ads_page/my_ads_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SucessfullWidget extends StatefulWidget {
  const SucessfullWidget({Key key}) : super(key: key);

  @override
  _SucessfullWidgetState createState() => _SucessfullWidgetState();
}

class _SucessfullWidgetState extends State<SucessfullWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 420,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 200,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFEEEEEE),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                          child: Icon(
                            Icons.check_rounded,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Text(
                      'Successful',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Open Sans',
                            fontSize: 35,
                          ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyAdsPageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Done',
                    options: FFButtonOptions(
                      width: 120,
                      height: 60,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Open Sans',
                            color: Color(0xFFEEEEEE),
                            fontSize: 29,
                          ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
