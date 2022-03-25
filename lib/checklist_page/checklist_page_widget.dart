import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../my_ads_page/my_ads_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChecklistPageWidget extends StatefulWidget {
  const ChecklistPageWidget({
    Key key,
    this.adref,
  }) : super(key: key);

  final DocumentReference adref;

  @override
  _ChecklistPageWidgetState createState() => _ChecklistPageWidgetState();
}

class _ChecklistPageWidgetState extends State<ChecklistPageWidget> {
  bool checkboxListTileValue1;
  bool checkboxListTileValue2;
  bool checkboxListTileValue3;
  bool checkboxListTileValue4;
  bool checkboxListTileValue5;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Color(0xFFEEEEEE),
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
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'CheckList',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
        ),
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Please assess the condition of the product and fill the checklist accordingly',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color(0xFF95A1AC),
                      ),
                      child: CheckboxListTile(
                        value: checkboxListTileValue1 ??= true,
                        onChanged: (newValue) =>
                            setState(() => checkboxListTileValue1 = newValue),
                        title: Text(
                          'Minor Scratches',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color(0xFF95A1AC),
                      ),
                      child: CheckboxListTile(
                        value: checkboxListTileValue2 ??= true,
                        onChanged: (newValue) =>
                            setState(() => checkboxListTileValue2 = newValue),
                        title: Text(
                          'Visible Dents',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color(0xFF95A1AC),
                      ),
                      child: CheckboxListTile(
                        value: checkboxListTileValue3 ??= true,
                        onChanged: (newValue) =>
                            setState(() => checkboxListTileValue3 = newValue),
                        title: Text(
                          'Wear and Tear',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color(0xFF95A1AC),
                      ),
                      child: CheckboxListTile(
                        value: checkboxListTileValue4 ??= true,
                        onChanged: (newValue) =>
                            setState(() => checkboxListTileValue4 = newValue),
                        title: Text(
                          'Dust-Free Surface',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color(0xFF95A1AC),
                      ),
                      child: CheckboxListTile(
                        value: checkboxListTileValue5 ??= true,
                        onChanged: (newValue) =>
                            setState(() => checkboxListTileValue5 = newValue),
                        title: Text(
                          'Cover Applied',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  Spacer(),
                  FFButtonWidget(
                    onPressed: () async {
                      final productsUpdateData = createProductsRecordData(
                        q1: checkboxListTileValue1,
                        q2: checkboxListTileValue2,
                        q3: checkboxListTileValue3,
                        q4: checkboxListTileValue4,
                        q5: checkboxListTileValue5,
                      );
                      await widget.adref.update(productsUpdateData);

                      final usersUpdateData = {
                        'my_ads': FieldValue.arrayUnion([widget.adref]),
                      };
                      await currentUserReference.update(usersUpdateData);
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: MyAdsPageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    text: 'Post Ad',
                    options: FFButtonOptions(
                      width: 200,
                      height: 40,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFFEEEEEE),
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
