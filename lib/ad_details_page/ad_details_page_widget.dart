import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdDetailsPageWidget extends StatefulWidget {
  const AdDetailsPageWidget({
    Key key,
    this.productId,
  }) : super(key: key);

  final DocumentReference productId;

  @override
  _AdDetailsPageWidgetState createState() => _AdDetailsPageWidgetState();
}

class _AdDetailsPageWidgetState extends State<AdDetailsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ProductsRecord> textProductsRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final textProductsRecord = textProductsRecordList.isNotEmpty
                        ? textProductsRecordList.first
                        : null;
                    return Text(
                      textProductsRecord.name,
                      style: FlutterFlowTheme.bodyText1,
                    );
                  },
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Hello World',
                    style: FlutterFlowTheme.bodyText1,
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
