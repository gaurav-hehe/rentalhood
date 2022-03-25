import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterSheetWidget extends StatefulWidget {
  const FilterSheetWidget({Key key}) : super(key: key);

  @override
  _FilterSheetWidgetState createState() => _FilterSheetWidgetState();
}

class _FilterSheetWidgetState extends State<FilterSheetWidget> {
  String choiceChipsValue;
  var placePickerValue = FFPlace();
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  double sliderValue;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'FILTERS',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Open Sans',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.85, 0),
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
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 25,
                      ),
                      buttonOptions: FFButtonOptions(
                        width: 50,
                        height: 35,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                  child: InkWell(
                    onTap: () async {
                      final usersUpdateData = createUsersRecordData(
                        location: placePickerValue.latLng,
                      );
                      await currentUserReference.update(usersUpdateData);
                    },
                    child: Text(
                      'UPDATE',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Color(0xFF0E1112),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
              child: Text(
                'Condition',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Open Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 5, 10, 0),
                    child: FlutterFlowChoiceChips(
                      initiallySelected: [choiceChipsValue],
                      options: [ChipData('New'), ChipData('Used')],
                      onChanged: (val) =>
                          setState(() => choiceChipsValue = val.first),
                      selectedChipStyle: ChipStyle(
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Open Sans',
                                  color: Colors.white,
                                ),
                        iconColor: Colors.white,
                        iconSize: 18,
                        elevation: 4,
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFF262D34),
                                ),
                        iconColor: Color(0xFF262D34),
                        iconSize: 18,
                        elevation: 4,
                      ),
                      chipSpacing: 20,
                      multiselect: false,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
              child: Text(
                'Product Type',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 0, 5),
              child: FlutterFlowDropDown(
                options: [
                  'Mobile Phones',
                  'Tools & Toolkits',
                  'Mobile Accessories',
                  'Computers & Laptops',
                  'Computer Accessories',
                  'Furnitures',
                  'Electronic Appliances',
                  'Electronic Gadgets'
                ].toList(),
                onChanged: (val) => setState(() => dropDownValue = val),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Open Sans',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                hintText: 'PRODUCT TYPE',
                fillColor: Color(0xFFEEEEEE),
                elevation: 2,
                borderColor: FlutterFlowTheme.of(context).tertiaryColor,
                borderWidth: 1,
                borderRadius: 0,
                margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                hidesUnderline: true,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 8, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Price Range',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'Rs.5 - 1000 per day',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Open Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 40, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Min. ',
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Min Price',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Max. ',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Max Price',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 10, 8, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Max Location',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      '10M - 5000M',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              activeColor: FlutterFlowTheme.of(context).secondaryColor,
              inactiveColor: Color(0xFF9E9E9E),
              min: 10,
              max: 5000,
              value: sliderValue ??= 10,
              label: sliderValue.toString(),
              divisions: 499,
              onChanged: (newValue) {
                setState(() => sliderValue = newValue);
              },
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(
                        () => FFAppState().filterCondition = choiceChipsValue);
                    setState(() => FFAppState().filterProdType = dropDownValue);
                    setState(() => FFAppState().filterMinPrice =
                        int.parse(textController1.text));
                    setState(() => FFAppState().filterMaxPrice =
                        int.parse(textController2.text));
                    await Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: NavBarPage(initialPage: 'HomePage'),
                      ),
                      (r) => false,
                    );
                  },
                  text: 'APPLY',
                  options: FFButtonOptions(
                    width: 200,
                    height: 40,
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Open Sans',
                          color: Color(0xFFEEEEEE),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
