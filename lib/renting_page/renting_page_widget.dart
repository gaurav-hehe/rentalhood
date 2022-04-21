import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../completion_page/completion_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class RentingPageWidget extends StatefulWidget {
  const RentingPageWidget({
    Key key,
    this.offerRef,
  }) : super(key: key);

  final OffersRecord offerRef;

  @override
  _RentingPageWidgetState createState() => _RentingPageWidgetState();
}

class _RentingPageWidgetState extends State<RentingPageWidget> {
  DateTime datePicked;
  TransactionsRecord transactionRef;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductsRecord>(
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
        final rentingPageProductsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0x00FFFFFF),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 46,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFF0B0B0B),
                size: 24,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Color(0xFFF1F5F8),
          body: SafeArea(
            child: Column(
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
                        'Renting Page',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Open Sans',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
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
                            rentingPageProductsRecord.image1,
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  'Name: ${rentingPageProductsRecord.name}',
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
                                'From: ${rentingPageProductsRecord.ownerName}',
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
                                      0, 30, 0, 5),
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
                    height: 200,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Text(
                              'Pick up details',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'ADD: ${rentingPageProductsRecord.address}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'DATE & TIME: ${dateTimeFormat('d/M h:mm a', datePicked)}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 18,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await DatePicker.showDateTimePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        setState(() => datePicked = date);
                                      },
                                      currentTime: getCurrentTimestamp,
                                      minTime: getCurrentTimestamp,
                                    );
                                  },
                                  text: 'Select',
                                  options: FFButtonOptions(
                                    width: 70,
                                    height: 30,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'YOUR DEPOSIT: ${widget.offerRef.deposit} (Offer)',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 12),
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
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  'Total',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 24,
                                      ),
                                ),
                              ),
                              Text(
                                'Rs. ${functions.totalPriceCalc(rentingPageProductsRecord.availability.toDouble(), widget.offerRef.price.toDouble()).toString()}',
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
                    var _shouldSetState = false;
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('ARE YOU SURE TO RENT THE PRODUCT?'),
                              content: Text('This action is not reversable.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      final transactionsCreateData =
                          createTransactionsRecordData(
                        renterName: currentUserDisplayName,
                        price: functions
                            .totalPriceCalc(
                                rentingPageProductsRecord.availability
                                    .toDouble(),
                                widget.offerRef.price.toDouble())
                            .toString(),
                        renterId: currentUserReference,
                        ownerId: rentingPageProductsRecord.uploadedBy,
                        pickupDt: datePicked,
                        ownerName: rentingPageProductsRecord.ownerName,
                        productRef: rentingPageProductsRecord.reference,
                        paymentMode: widget.offerRef.paymentMode,
                        id: random_data.randomInteger(1000, 99999).toString(),
                        offerRef: widget.offerRef.reference,
                      );
                      var transactionsRecordReference =
                          TransactionsRecord.collection.doc();
                      await transactionsRecordReference
                          .set(transactionsCreateData);
                      transactionRef = TransactionsRecord.getDocumentFromData(
                          transactionsCreateData, transactionsRecordReference);
                      _shouldSetState = true;

                      final usersUpdateData = {
                        'my_orders': FieldValue.arrayUnion(
                            [rentingPageProductsRecord.reference]),
                      };
                      await currentUserReference.update(usersUpdateData);

                      final offersUpdateData = createOffersRecordData(
                        status: 'Picking Up',
                        transactionRef: transactionRef.reference,
                      );
                      await widget.offerRef.reference.update(offersUpdateData);

                      final productsUpdateData = {
                        ...createProductsRecordData(
                          rentedBy: currentUserReference,
                          transRef: transactionRef.reference,
                          status: 'Not Available',
                        ),
                        'allTransactions':
                            FieldValue.arrayUnion([transactionRef.reference]),
                      };
                      await rentingPageProductsRecord.reference
                          .update(productsUpdateData);
                    } else {
                      if (_shouldSetState) setState(() {});
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
                    if (_shouldSetState) setState(() {});
                  },
                  text: 'RENT IT !',
                  options: FFButtonOptions(
                    width: 300,
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
            ),
          ),
        );
      },
    );
  }
}
