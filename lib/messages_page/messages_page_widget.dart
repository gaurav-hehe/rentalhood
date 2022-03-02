import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../chat_page/chat_page_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesPageWidget extends StatefulWidget {
  const MessagesPageWidget({Key key}) : super(key: key);

  @override
  _MessagesPageWidgetState createState() => _MessagesPageWidgetState();
}

class _MessagesPageWidgetState extends State<MessagesPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Text(
                        'Messages',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Open Sans',
                              fontSize: 30,
                            ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  thickness: 5,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: StreamBuilder<List<ChatsRecord>>(
                      stream: queryChatsRecord(
                        queryBuilder: (chatsRecord) => chatsRecord
                            .where('users', arrayContains: currentUserReference)
                            .orderBy('last_message_time', descending: true),
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
                        List<ChatsRecord> listViewChatsRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewChatsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewChatsRecord =
                                listViewChatsRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                              child: StreamBuilder<FFChatInfo>(
                                stream: FFChatManager.instance.getChatInfo(
                                    chatRecord: listViewChatsRecord),
                                builder: (context, snapshot) {
                                  final chatInfo = snapshot.data ??
                                      FFChatInfo(listViewChatsRecord);
                                  return FFChatPreview(
                                    onTap: chatInfo != null
                                        ? () => Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child: ChatPageWidget(
                                                  chatUser: chatInfo.otherUsers
                                                              .length ==
                                                          1
                                                      ? chatInfo
                                                          .otherUsersList.first
                                                      : null,
                                                  chatRef: chatInfo
                                                      .chatRecord.reference,
                                                ),
                                              ),
                                            )
                                        : null,
                                    lastChatText: chatInfo.chatPreviewMessage(),
                                    lastChatTime:
                                        listViewChatsRecord.lastMessageTime,
                                    seen: listViewChatsRecord.lastMessageSeenBy
                                        .contains(currentUserReference),
                                    title: chatInfo.chatPreviewTitle(),
                                    userProfilePic: chatInfo.chatPreviewPic(),
                                    color: Color(0xFFF3F3F4),
                                    unreadColor: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    titleTextStyle: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    dateTextStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    previewTextStyle: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0x73000000),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                    borderRadius: BorderRadius.circular(0),
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
