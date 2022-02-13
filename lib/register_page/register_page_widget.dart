import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../flutter_flow/upload_media.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import 'dart:io';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({Key key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  String uploadedFileUrl = '';
  var placePickerValue = FFPlace();
  TextEditingController aadhaarNoController;
  TextEditingController emailController;
  TextEditingController nameController;
  TextEditingController phoneNoController;
  TextEditingController paswordController;
  bool paswordVisibility;
  TextEditingController confPasswordController;
  bool confPasswordVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    aadhaarNoController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneNoController = TextEditingController();
    paswordController = TextEditingController();
    paswordVisibility = false;
    confPasswordController = TextEditingController();
    confPasswordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          'Create Account ',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 3, 0, 0),
                      child: Text(
                        'Products are waiting for you.',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                  child: TextFormField(
                    controller: nameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      hintStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFF5D5E60),
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outlined,
                        color: Color(0xFF5D5E60),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2,
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFF5D5E60),
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outlined,
                        color: Color(0xFF5D5E60),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: phoneNoController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFF5D5E60),
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.call_rounded,
                        color: Color(0xFF5D5E60),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: aadhaarNoController,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Aadhaar number',
                      hintStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFF5D5E60),
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.contact_phone,
                        color: Color(0xFF5D5E60),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    onChanged: (_) => EasyDebounce.debounce(
                      'paswordController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    controller: paswordController,
                    obscureText: !paswordVisibility,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFF5D5E60),
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Color(0xFF5D5E60),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => paswordVisibility = !paswordVisibility,
                        ),
                        child: Icon(
                          paswordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: TextFormField(
                    controller: confPasswordController,
                    obscureText: !confPasswordVisibility,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Color(0xFF5D5E60),
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Color(0xFF5D5E60),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () =>
                              confPasswordVisibility = !confPasswordVisibility,
                        ),
                        child: Icon(
                          confPasswordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).subtitle2,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Field is required';
                      }

                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 25, 20, 0),
                      child: FlutterFlowPlacePicker(
                        iOSGoogleMapsApiKey: '',
                        androidGoogleMapsApiKey: '',
                        webGoogleMapsApiKey: '',
                        onSelect: (place) =>
                            setState(() => placePickerValue = place),
                        defaultText: 'Location',
                        icon: Icon(
                          Icons.place,
                          color: Color(0xFF616161),
                          size: 16,
                        ),
                        buttonOptions: FFButtonOptions(
                          width: 150,
                          height: 45,
                          color: Color(0xFFD2D6E0),
                          textStyle: FlutterFlowTheme.of(context).subtitle2,
                          borderSide: BorderSide(
                            color: Color(0xFF616161),
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 25, 20, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final selectedMedia = await selectMedia();
                          if (selectedMedia != null &&
                              validateFileFormat(
                                  selectedMedia.storagePath, context)) {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            final downloadUrl = await uploadData(
                                selectedMedia.storagePath, selectedMedia.bytes);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            if (downloadUrl != null) {
                              setState(() => uploadedFileUrl = downloadUrl);
                              showUploadMessage(
                                context,
                                'Success!',
                              );
                            } else {
                              showUploadMessage(
                                context,
                                'Failed to upload media',
                              );
                              return;
                            }
                          }
                        },
                        text: 'Image',
                        icon: Icon(
                          Icons.image_search,
                          color: Color(0xFF616161),
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 150,
                          height: 45,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context).subtitle2,
                          borderSide: BorderSide(
                            color: Color(0xFF616161),
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'HomePage'),
                        ),
                      );
                      if (paswordController.text !=
                          confPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Passwords don\'t match!',
                            ),
                          ),
                        );
                        return;
                      }

                      final user = await createAccountWithEmail(
                        context,
                        emailController.text,
                        paswordController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      final usersCreateData = createUsersRecordData(
                        location: placePickerValue.latLng,
                        email: emailController.text,
                        displayName: nameController.text,
                        photoUrl: uploadedFileUrl,
                        createdTime: getCurrentTimestamp,
                        uid: aadhaarNoController.text,
                        phoneNumber: phoneNoController.text,
                      );
                      await UsersRecord.collection
                          .doc(user.uid)
                          .update(usersCreateData);
                    },
                    text: 'SIGN UP',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Open Sans',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        width: 1,
                      ),
                      borderRadius: 5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPageWidget(),
                              ),
                            );
                          },
                          child: Text(
                            'LOGIN',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                          ),
                        ),
                      ),
                    ],
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
