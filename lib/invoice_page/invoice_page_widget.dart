import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoicePageWidget extends StatefulWidget {
  const InvoicePageWidget({
    Key key,
    this.transRef,
  }) : super(key: key);

  final TransactionsRecord transRef;

  @override
  _InvoicePageWidgetState createState() => _InvoicePageWidgetState();
}

class _InvoicePageWidgetState extends State<InvoicePageWidget> {
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Invoice PDF',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Open Sans',
                color: FlutterFlowTheme.of(context).secondaryColor,
                fontSize: 22,
              ),
        ),
        actions: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: InkWell(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Your IPFS hash is'),
                        content: Text('0xx'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'IPFS',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Open Sans',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FlutterFlowPdfViewer(
            networkPath: widget.transRef.pdfUrl,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}
