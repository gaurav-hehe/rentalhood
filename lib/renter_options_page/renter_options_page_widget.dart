import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../order_details_page/order_details_page_widget.dart';
import '../return_page/return_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RenterOptionsPageWidget extends StatefulWidget {
  const RenterOptionsPageWidget({
    Key key,
    this.offerRef,
  }) : super(key: key);

  final DocumentReference offerRef;

  @override
  _RenterOptionsPageWidgetState createState() =>
      _RenterOptionsPageWidgetState();
}

class _RenterOptionsPageWidgetState extends State<RenterOptionsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 50,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          'Back',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Page Title',
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          fontSize: 22,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          elevation: 2,
        ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<OffersRecord>(
            stream: OffersRecord.getDocument(widget.offerRef),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final containerOffersRecord = snapshot.data;
              return Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x3B1D2429),
                      offset: Offset(0, -3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((containerOffersRecord.status) == 'Pending')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final offersUpdateData = createOffersRecordData(
                                status: 'Cancelled',
                              );
                              await containerOffersRecord.reference
                                  .update(offersUpdateData);
                              Navigator.pop(context);
                            },
                            text: 'Cancel Offer',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              color: Color(0xFFDBE2E7),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF262D34),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Color(0xFFB82023),
                                width: 2,
                              ),
                              borderRadius: 40,
                            ),
                          ),
                        ),
                      if ((containerOffersRecord.status) == 'Accepted')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: StreamBuilder<TransactionsRecord>(
                            stream: TransactionsRecord.getDocument(
                                containerOffersRecord.transactionRef),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final buttonTransactionsRecord = snapshot.data;
                              return FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child: OrderDetailsPageWidget(
                                        transRef: buttonTransactionsRecord,
                                      ),
                                    ),
                                  );
                                },
                                text: 'Renting Page',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 60,
                                  color: Color(0xFFDBE2E7),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF262D34),
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  borderSide: BorderSide(
                                    color: Color(0xFF00BF14),
                                    width: 2,
                                  ),
                                  borderRadius: 40,
                                ),
                              );
                            },
                          ),
                        ),
                      if ((containerOffersRecord.status) == 'Picked Up')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: ReturnPageWidget(
                                    offerRef: containerOffersRecord,
                                  ),
                                ),
                              );
                            },
                            text: 'Return Page',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60,
                              color: Color(0xFFDBE2E7),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF262D34),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Color(0xFF00BF14),
                                width: 2,
                              ),
                              borderRadius: 40,
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Back',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 60,
                            color: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF57636C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              width: 2,
                            ),
                            borderRadius: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
