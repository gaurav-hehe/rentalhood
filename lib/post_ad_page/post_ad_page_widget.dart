import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:io';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PostAdPageWidget extends StatefulWidget {
  const PostAdPageWidget({Key key}) : super(key: key);

  @override
  _PostAdPageWidgetState createState() => _PostAdPageWidgetState();
}

class _PostAdPageWidgetState extends State<PostAdPageWidget> {
  ProductsRecord newAd;
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  String choiceChipsValue;
  String dropDownValue;
  TextEditingController addressController;
  var placePickerValue = FFPlace();
  TextEditingController descriptionController;
  TextEditingController priceController;
  TextEditingController titleController;
  TextEditingController availabilityController;
  TextEditingController identifierController;
  bool checkboxListTileValue1;
  bool checkboxListTileValue2;
  bool checkboxListTileValue3;
  bool checkboxListTileValue4;
  bool checkboxListTileValue5;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    titleController = TextEditingController();
    availabilityController = TextEditingController();
    identifierController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFECEBEB),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Text(
                          'Add Product',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Open Sans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 30, 5, 0),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFCDD1D1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 8, 0, 0),
                              child: Text(
                                'BASIC INFORMATION  ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF777171),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.questionCircle,
                                color: Color(0xFF777171),
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0x00EEEEEE),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Give a brief  but detailed information about the product.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Color(0xFF545252),
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 285,
                      decoration: BoxDecoration(
                        color: Color(0x00ECEBEB),
                        border: Border.all(
                          color: Color(0xFF545252),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: titleController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'TITLE',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF616161),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF616161),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 10, 0),
                                  child: TextFormField(
                                    controller: priceController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'PRICE PER DAY',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF616161),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF616161),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.94,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: TextFormField(
                                        controller: descriptionController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'DESCRIPTION',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF616161),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF616161),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 5, 10, 5),
                              child: Text(
                                'Please enter the description to get best possible response. Tell other users what you love about the product.',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 5, 0),
                                  child: TextFormField(
                                    controller: addressController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'FULL ADDRESS',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: Color(0xFF5D5E60),
                                          ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                child: FlutterFlowPlacePicker(
                                  iOSGoogleMapsApiKey:
                                      'AIzaSyAMBy4yAjHAzlTm2fMH5qxDwMMZVmB4JBs',
                                  androidGoogleMapsApiKey:
                                      'AIzaSyBKPbL-SHAE3_r4MNgvxrViJPVmAtbOZjw',
                                  webGoogleMapsApiKey:
                                      'AIzaSyB7rDPXoN62wvMqAmQPhYJh9ugGBPNA01Q',
                                  onSelect: (place) =>
                                      setState(() => placePickerValue = place),
                                  defaultText: '',
                                  icon: Icon(
                                    Icons.place,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  buttonOptions: FFButtonOptions(
                                    width: 50,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: Colors.white,
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
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF545252),
                          )
                        ],
                        border: Border.all(
                          color: Color(0xFF545252),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 8, 5, 0),
                                  child: FlutterFlowDropDown(
                                    options: [
                                      'Mobile Phone',
                                      'Tools & Toolkits',
                                      'Mobile Accessories',
                                      'Computers & Laptops',
                                      'Computer Accessories',
                                      'Furnitures',
                                      'Electronic Appliances',
                                      'Electronic Gadgets'
                                    ].toList(),
                                    onChanged: (val) =>
                                        setState(() => dropDownValue = val),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Open Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                        ),
                                    hintText: 'PRODUCT TYPE',
                                    fillColor: Color(0xFFEEEEEE),
                                    elevation: 4,
                                    borderColor: Color(0x00D2D6E0),
                                    borderWidth: 0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        20, 4, 12, 4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 15, 10, 0),
                            child: Text(
                              'PRODUCT CONDITION',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 5, 10, 0),
                            child: FlutterFlowChoiceChips(
                              initiallySelected: [choiceChipsValue],
                              options: [ChipData('New'), ChipData('Used')],
                              onChanged: (val) =>
                                  setState(() => choiceChipsValue = val.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18,
                                elevation: 4,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: Color(0xFF262D34),
                                    ),
                                iconColor: Color(0xFF262D34),
                                iconSize: 18,
                                elevation: 4,
                              ),
                              chipSpacing: 20,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 130,
                      decoration: BoxDecoration(
                        color: Color(0x00ECEBEB),
                        border: Border.all(
                          color: Color(0xFF545252),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 0),
                                  child: TextFormField(
                                    controller: availabilityController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'AVAILABILITY in DAYS',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF616161),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF616161),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 10, 0),
                                  child: TextFormField(
                                    controller: identifierController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'UNIQUE IDENTIFIER',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF545252),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF545252),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 80,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF545252),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'IMAGES',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: Color(0xFF616161),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.questionCircle,
                                  color: Color(0xFF777171),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Text(
                                  'Upload at least 1 image of the product below.',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Text(
                            'Please assess the condition of the product and verify the below checklist.',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: checkboxListTileValue1 ??= false,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue1 = newValue),
                            title: Text(
                              'Minor Scratches',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: checkboxListTileValue2 ??= false,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue2 = newValue),
                            title: Text(
                              'Visible Dents',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: checkboxListTileValue3 ??= false,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue3 = newValue),
                            title: Text(
                              'Wear and Tear',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: checkboxListTileValue4 ??= false,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue4 = newValue),
                            title: Text(
                              'Dust-Free Surface',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: checkboxListTileValue5 ??= false,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue5 = newValue),
                            title: Text(
                              'Cover Applied',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor: Color(0xFFF5F5F5),
                            activeColor:
                                FlutterFlowTheme.of(context).secondaryColor,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color: Color(0xFF545252),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Upload Photos',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Color(0xFF616161),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: Icon(
                                            Icons.image_search,
                                            color: Color(0xFF545252),
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 15),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if ((uploadedFileUrl1 != null) &&
                                                (uploadedFileUrl1 != ''))
                                              Image.network(
                                                uploadedFileUrl1,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.contain,
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 2, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    final downloadUrls = await Future
                                                        .wait(selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes)));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    if (downloadUrls != null) {
                                                      setState(() =>
                                                          uploadedFileUrl1 =
                                                              downloadUrls
                                                                  .first);
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
                                                child: Text(
                                                  'Image 1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 15,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((uploadedFileUrl2 != null) &&
                                                (uploadedFileUrl2 != ''))
                                              Image.network(
                                                uploadedFileUrl2,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.contain,
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 2, 0, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    final downloadUrls = await Future
                                                        .wait(selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes)));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    if (downloadUrls != null) {
                                                      setState(() =>
                                                          uploadedFileUrl2 =
                                                              downloadUrls
                                                                  .first);
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
                                                child: Text(
                                                  'Image 2',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 15,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final productsCreateData =
                                            createProductsRecordData(
                                          name: titleController.text,
                                          description:
                                              descriptionController.text,
                                          condition: choiceChipsValue,
                                          identifier: identifierController.text,
                                          uploadedAt: getCurrentTimestamp,
                                          uploadedBy: currentUserReference,
                                          location: placePickerValue.latLng,
                                          image1: uploadedFileUrl1,
                                          image2: uploadedFileUrl2,
                                          q1: checkboxListTileValue1,
                                          q2: checkboxListTileValue2,
                                          q3: checkboxListTileValue3,
                                          q4: checkboxListTileValue4,
                                          q5: checkboxListTileValue5,
                                          prodId: random_data.randomInteger(
                                              1000, 99999),
                                          address: addressController.text,
                                          price:
                                              int.parse(priceController.text),
                                          availability: int.parse(
                                              availabilityController.text),
                                          productType: dropDownValue,
                                          status: 'Available',
                                          ownerName: currentUserDisplayName,
                                        );
                                        var productsRecordReference =
                                            ProductsRecord.collection.doc();
                                        await productsRecordReference
                                            .set(productsCreateData);
                                        newAd =
                                            ProductsRecord.getDocumentFromData(
                                                productsCreateData,
                                                productsRecordReference);

                                        final usersUpdateData = {
                                          'my_ads': FieldValue.arrayUnion(
                                              [newAd.reference]),
                                        };
                                        await currentUserReference
                                            .update(usersUpdateData);
                                        Navigator.pop(context);

                                        setState(() {});
                                      },
                                      text: 'POST',
                                      options: FFButtonOptions(
                                        width: 150,
                                        height: 50,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                        elevation: 5,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 40,
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
                  ),
                ),
                Container(
                  width: 100,
                  height: 200,
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
  }
}
