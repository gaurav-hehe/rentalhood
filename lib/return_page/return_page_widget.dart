import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../completion_page/completion_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReturnPageWidget extends StatefulWidget {
  const ReturnPageWidget({
    Key key,
    this.offerRef,
  }) : super(key: key);

  final OffersRecord offerRef;

  @override
  _ReturnPageWidgetState createState() => _ReturnPageWidgetState();
}

class _ReturnPageWidgetState extends State<ReturnPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
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
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: StreamBuilder<ProductsRecord>(
              stream: ProductsRecord.getDocument(widget.offerRef.prodRef),
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
                final columnProductsRecord = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x4814181B),
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 5),
                          child: Text(
                            'Returns Page',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryColor,
                                  fontSize: 25,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.96,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x3A000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                columnProductsRecord.image1,
                                width: 74,
                                height: 74,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 5),
                                    child: Text(
                                      columnProductsRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF111417),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'From: ${columnProductsRecord.ownerName}',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF111417),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.8, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 0),
                                      child: Text(
                                        formatNumber(
                                          widget.offerRef.price,
                                          formatType: FormatType.custom,
                                          currency: 'Rs. ',
                                          format: '',
                                          locale: '',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF151B1E),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x4814181B),
                              offset: Offset(0, 1),
                            )
                          ],
                          border: Border.all(
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final columnTransactionsRecord = snapshot.data;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 0, 10),
                                    child: Text(
                                      'Return details',
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      'ADD: ${columnProductsRecord.address}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 5),
                                    child: Text(
                                      'DATE & TIME: ${dateTimeFormat('d/M h:mm a', columnTransactionsRecord.returnDt)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 18,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 5, 0),
                                    child: Text(
                                      'PAYMENT MODE: ${columnTransactionsRecord.paymentMode}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 18,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      'YOUR DEPOSIT: ${widget.offerRef.deposit}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.96,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x3A000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Summary',
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 12, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      'Total',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 22,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'Rs. ${functions.totalPriceCalc(columnProductsRecord.availability.toDouble(), widget.offerRef.price.toDouble()).toString()}',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF151B1E),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title:
                                      Text('ARE YOU SURE TO RENT THE PRODUCT?'),
                                  content:
                                      Text('This action is not reversable.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          final transactionsUpdateData =
                              createTransactionsRecordData(
                            paymentMode: widget.offerRef.paymentMode,
                          );
                          await widget.offerRef.transactionRef
                              .update(transactionsUpdateData);

                          final offersUpdateData = createOffersRecordData(
                            status: 'Returning',
                          );
                          await widget.offerRef.reference
                              .update(offersUpdateData);

                          final productsUpdateData = createProductsRecordData(
                            status: 'Returning',
                          );
                          await columnProductsRecord.reference
                              .update(productsUpdateData);
                        } else {
                          return;
                        }

                        await Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
                            child: CompletionPageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'RETURN IT !',
                      options: FFButtonOptions(
                        width: 320,
                        height: 60,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        textStyle: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Open Sans',
                              color: Color(0xFFEEEEEE),
                              fontWeight: FontWeight.bold,
                            ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
