import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../my_orders_page/my_orders_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCompletionPageWidget extends StatefulWidget {
  const PaymentCompletionPageWidget({
    Key key,
    this.productRef,
    this.transactionRef,
  }) : super(key: key);

  final DocumentReference productRef;
  final TransactionsRecord transactionRef;

  @override
  _PaymentCompletionPageWidgetState createState() =>
      _PaymentCompletionPageWidgetState();
}

class _PaymentCompletionPageWidgetState
    extends State<PaymentCompletionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TransactionsRecord>(
      stream: TransactionsRecord.getDocument(widget.transactionRef.reference),
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
        final paymentCompletionPageTransactionsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Text(
                        'Order Successful',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Lexend Deca',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Text(
                        paymentCompletionPageTransactionsRecord.price,
                        style: GoogleFonts.getFont(
                          'Overpass',
                          color: Color(0xFF5D5E60),
                          fontWeight: FontWeight.w100,
                          fontSize: 72,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                      child: Text(
                        'If your payment was cash, then please carry the appropriate change when picking up the product.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF8B97A2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyOrdersPageWidget(),
                                  ),
                                  (r) => false,
                                );
                                final transactionsUpdateData =
                                    createTransactionsRecordData(
                                  paymentMode: 'cash',
                                );
                                await paymentCompletionPageTransactionsRecord
                                    .reference
                                    .update(transactionsUpdateData);

                                final productsUpdateData =
                                    createProductsRecordData(
                                  rentedBy: currentUserReference,
                                );
                                await widget.productRef
                                    .update(productsUpdateData);
                              },
                              text: 'Go Home',
                              options: FFButtonOptions(
                                width: 230,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
