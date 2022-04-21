import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../order_details_page/order_details_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTransactionsWidget extends StatefulWidget {
  const AllTransactionsWidget({Key key}) : super(key: key);

  @override
  _AllTransactionsWidgetState createState() => _AllTransactionsWidgetState();
}

class _AllTransactionsWidgetState extends State<AllTransactionsWidget> {
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
                    'All Transactions',
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: StreamBuilder<List<TransactionsRecord>>(
              stream: queryTransactionsRecord(
                queryBuilder: (transactionsRecord) => transactionsRecord
                    .where('renter_id', isEqualTo: currentUserReference)
                    .where('owner_id', isEqualTo: currentUserReference),
              ),
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
                List<TransactionsRecord> listViewTransactionsRecordList =
                    snapshot.data;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewTransactionsRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewTransactionsRecord =
                        listViewTransactionsRecordList[listViewIndex];
                    return StreamBuilder<TransactionsRecord>(
                      stream: TransactionsRecord.getDocument(
                          listViewTransactionsRecord.reference),
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
                        final containerTransactionsRecord = snapshot.data;
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: OrderDetailsPageWidget(
                                    transRef: containerTransactionsRecord,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    if ((containerTransactionsRecord.ownerId) ==
                                        (currentUserReference))
                                      Icon(
                                        Icons.arrow_upward,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 40,
                                      ),
                                    if ((containerTransactionsRecord
                                            .renterId) ==
                                        (currentUserReference))
                                      Icon(
                                        Icons.arrow_downward,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 40,
                                      ),
                                  ],
                                ),
                                StreamBuilder<ProductsRecord>(
                                  stream: ProductsRecord.getDocument(
                                      containerTransactionsRecord.productRef),
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
                                    final textProductsRecord = snapshot.data;
                                    return Text(
                                      'Product: ${textProductsRecord.name}',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Open Sans',
                                            fontSize: 18,
                                          ),
                                    );
                                  },
                                ),
                                Text(
                                  dateTimeFormat('d/M/y',
                                      containerTransactionsRecord.pickupDt),
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
