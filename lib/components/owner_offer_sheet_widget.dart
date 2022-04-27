import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../pickup_step2/pickup_step2_widget.dart';
import '../return_step1/return_step1_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerOfferSheetWidget extends StatefulWidget {
  const OwnerOfferSheetWidget({
    Key key,
    this.offerRef,
  }) : super(key: key);

  final DocumentReference offerRef;

  @override
  _OwnerOfferSheetWidgetState createState() => _OwnerOfferSheetWidgetState();
}

class _OwnerOfferSheetWidgetState extends State<OwnerOfferSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OffersRecord>(
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
                  FFButtonWidget(
                    onPressed: () async {
                      final offersUpdateData = createOffersRecordData(
                        status: 'Accepted',
                      );
                      await containerOffersRecord.reference
                          .update(offersUpdateData);
                      Navigator.pop(context);
                    },
                    text: 'Accept Offer',
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
                        color: Color(0xFF00BF14),
                        width: 2,
                      ),
                      borderRadius: 40,
                    ),
                  ),
                if ((containerOffersRecord.status) == 'Pending')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final offersUpdateData = createOffersRecordData(
                          status: 'Declined',
                        );
                        await containerOffersRecord.reference
                            .update(offersUpdateData);
                        Navigator.pop(context);
                      },
                      text: 'Declined Offer',
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
                          color: Color(0xFFB82023),
                          width: 2,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ),
                if (functions.visiblityPRpage(containerOffersRecord.status) ??
                    true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if ((containerOffersRecord.status) == 'Returning') {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: ReturnStep1Widget(
                                transactionRef:
                                    containerOffersRecord.transactionRef,
                              ),
                            ),
                          );
                        } else {
                          if ((containerOffersRecord.status) == 'Picking Up') {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: PickupStep2Widget(
                                  transactionrRef:
                                      containerOffersRecord.transactionRef,
                                  offerRef: containerOffersRecord.reference,
                                ),
                              ),
                            );
                          }
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
    );
  }
}
