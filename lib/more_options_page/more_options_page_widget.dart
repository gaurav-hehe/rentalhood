import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../help_page/help_page_widget.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import '../my_ads_page/my_ads_page_widget.dart';
import '../my_orders_page/my_orders_page_widget.dart';
import '../profile_page/profile_page_widget.dart';
import '../user_agreement_page/user_agreement_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreOptionsPageWidget extends StatefulWidget {
  const MoreOptionsPageWidget({Key key}) : super(key: key);

  @override
  _MoreOptionsPageWidgetState createState() => _MoreOptionsPageWidgetState();
}

class _MoreOptionsPageWidgetState extends State<MoreOptionsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final moreOptionsPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFFEEEEEE),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'HomePage'),
                  ),
                );
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePageWidget(),
                                ),
                              );
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 25, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'More Options',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Color(0xFF302E2E),
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          moreOptionsPageUsersRecord.photoUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Text(
                                      moreOptionsPageUsersRecord.displayName,
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Click to view Profile',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          fontSize: 12,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyOrdersPageWidget(),
                                  ),
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3F3F4),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 1),
                                          child: FaIcon(
                                            FontAwesomeIcons.folder,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyOrdersPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'My Orders',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyAdsPageWidget(),
                                  ),
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3F3F4),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 1),
                                          child: FaIcon(
                                            FontAwesomeIcons.ad,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Text(
                                              'My Ads',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HelpPageWidget(),
                                  ),
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3F3F4),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 5,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HelpPageWidget(),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: FaIcon(
                                              FontAwesomeIcons.handsHelping,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                'FAQ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .title1
                                                    .override(
                                                      fontFamily: 'Open Sans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserAgreementPageWidget(),
                                  ),
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3F3F4),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.3),
                                          child: Icon(
                                            Icons.post_add,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: AutoSizeText(
                                              'User Agreement\n&\nTerms and Condition',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF3F3F4),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    width: 5,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: Icon(
                                          Icons.rate_review,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 5, 0, 0),
                                          child: Text(
                                            'Review',
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: InkWell(
                              onTap: () async {
                                await signOut();
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPageWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF3F3F4),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      width: 5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.3),
                                          child: Icon(
                                            Icons.logout,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: AutoSizeText(
                                              'LogOut',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
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
