import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../order_details_page/order_details_page_widget.dart';
import '../product_detail_page/product_detail_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAdsPageWidget extends StatefulWidget {
  const MyAdsPageWidget({Key key}) : super(key: key);

  @override
  _MyAdsPageWidgetState createState() => _MyAdsPageWidgetState();
}

class _MyAdsPageWidgetState extends State<MyAdsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).tertiaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        actions: [],
        centerTitle: true,
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'My Ads',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Open Sans',
                              fontSize: 30,
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  thickness: 5,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: StreamBuilder<List<ProductsRecord>>(
                      stream: queryProductsRecord(
                        queryBuilder: (productsRecord) => productsRecord.where(
                            'uploaded_by',
                            isEqualTo: currentUserReference),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<ProductsRecord> listViewProductsRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewProductsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewProductsRecord =
                                listViewProductsRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
                              child: StreamBuilder<ProductsRecord>(
                                stream: ProductsRecord.getDocument(
                                    listViewProductsRecord.reference),
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
                                  final containerProductsRecord = snapshot.data;
                                  return Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 7,
                                          color: Color(0x32171717),
                                          offset: Offset(0, 3),
                                          spreadRadius: 10,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 5),
                                      child: StreamBuilder<TransactionsRecord>(
                                        stream: TransactionsRecord.getDocument(
                                            containerProductsRecord.transRef),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final rowTransactionsRecord =
                                              snapshot.data;
                                          return InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Make a choice!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Order Details'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'View Ad'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child:
                                                        ProductDetailPageWidget(
                                                      productRef:
                                                          containerProductsRecord,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    reverseDuration: Duration(
                                                        milliseconds: 300),
                                                    child:
                                                        OrderDetailsPageWidget(
                                                      transRef:
                                                          rowTransactionsRecord,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Image.network(
                                                  containerProductsRecord
                                                      .image1,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  fit: BoxFit.cover,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              formatNumber(
                                                                containerProductsRecord
                                                                    .price,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                currency:
                                                                    'Rs. ',
                                                                format: '',
                                                                locale: '',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child: StreamBuilder<
                                                                  ProductsRecord>(
                                                                stream: ProductsRecord
                                                                    .getDocument(
                                                                        containerProductsRecord
                                                                            .reference),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final iconProductsRecord =
                                                                      snapshot
                                                                          .data;
                                                                  return InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      if ((iconProductsRecord
                                                                              .status) ==
                                                                          'Available') {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Confirm Delete?'),
                                                                                  content: Text('The product will be deleted from your products list.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirm'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          final usersUpdateData =
                                                                              {
                                                                            'my_ads':
                                                                                FieldValue.arrayRemove([
                                                                              iconProductsRecord.reference
                                                                            ]),
                                                                          };
                                                                          await currentUserReference
                                                                              .update(usersUpdateData);
                                                                          await containerProductsRecord
                                                                              .reference
                                                                              .delete();
                                                                        }
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Product on Rent, Cannot Delete.',
                                                                              style: TextStyle(),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                Color(0x00000000),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .delete_forever,
                                                                      color: Color(
                                                                          0xFFC80C0D),
                                                                      size: 30,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          containerProductsRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            containerProductsRecord
                                                                .description,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Text(
                                                          containerProductsRecord
                                                              .status,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  containerProductsRecord
                                                                      .uploadedAt),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
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
