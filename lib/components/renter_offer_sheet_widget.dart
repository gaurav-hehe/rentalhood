import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../pickup_step1/pickup_step1_widget.dart';
import '../renting_page/renting_page_widget.dart';
import '../return_page/return_page_widget.dart';
import '../return_step2/return_step2_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RenterOfferSheetWidget extends StatefulWidget {
  const RenterOfferSheetWidget({
    Key key,
    this.offerRef,
  }) : super(key: key);

  final OffersRecord offerRef;

  @override
  _RenterOfferSheetWidgetState createState() => _RenterOfferSheetWidgetState();
}

class _RenterOfferSheetWidgetState extends State<RenterOfferSheetWidget> {
  @override
  Widget build(BuildContext context) {
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
            if ((widget.offerRef.status) == 'Pending')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final offersUpdateData = createOffersRecordData(
                      status: 'Cancelled',
                    );
                    await widget.offerRef.reference.update(offersUpdateData);
                    Navigator.pop(context);
                  },
                  text: 'Cancel Offer',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    color: Color(0xFFDBE2E7),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            if ((widget.offerRef.status) == 'Accepted')
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
                        child: RentingPageWidget(
                          offerRef: widget.offerRef,
                        ),
                      ),
                    );
                  },
                  text: 'Renting Page',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    color: Color(0xFFDBE2E7),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            if ((widget.offerRef.status) == 'Picked Up')
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
                          offerRef: widget.offerRef,
                        ),
                      ),
                    );
                  },
                  text: 'Return Page',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60,
                    color: Color(0xFFDBE2E7),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
            if (functions.visiblityPRpage(widget.offerRef.status) ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: StreamBuilder<TransactionsRecord>(
                  stream: TransactionsRecord.getDocument(
                      widget.offerRef.transactionRef),
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
                    final buttonTransactionsRecord = snapshot.data;
                    return FFButtonWidget(
                      onPressed: () async {
                        if ((buttonTransactionsRecord.pickupS1) == false) {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: PickupStep1Widget(
                                transactionRef: widget.offerRef.transactionRef,
                              ),
                            ),
                          );
                          return;
                        } else {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: ReturnStep2Widget(
                                transactionRef: widget.offerRef.transactionRef,
                                offerRef: widget.offerRef.reference,
                              ),
                            ),
                          );
                        }
                      },
                      text: 'Pickup / Return Page',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60,
                        color: Color(0xFFDBE2E7),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF262D34),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          width: 2,
                        ),
                        borderRadius: 40,
                      ),
                    );
                  },
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
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
  }
}
