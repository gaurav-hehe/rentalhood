import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String choiceChipsValue1;
  String choiceChipsValue2;
  String dropDownValue;
  double sliderValue1;
  double sliderValue2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(40, 150, 40, 150),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 600,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Filters',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Open Sans',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Sort By',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.1, 0.1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30, 0, 0, 0),
                                  child: FlutterFlowChoiceChips(
                                    initiallySelected: [choiceChipsValue1],
                                    options: [
                                      ChipData('Price'),
                                      ChipData('Date')
                                    ],
                                    onChanged: (val) => setState(
                                        () => choiceChipsValue1 = val.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Open Sans',
                                            color: Colors.white,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 0,
                                      elevation: 5,
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
                                      iconSize: 20,
                                      elevation: 4,
                                    ),
                                    chipSpacing: 15,
                                    multiselect: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                        child: FlutterFlowChoiceChips(
                          initiallySelected: [choiceChipsValue2],
                          options: [ChipData('New'), ChipData('Used')],
                          onChanged: (val) =>
                              setState(() => choiceChipsValue2 = val.first),
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
                    ],
                  ),
                  Divider(
                    color: Color(0xFF0E1112),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.25, 0),
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
                            onChanged: (val) =>
                                setState(() => dropDownValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      color: Colors.black,
                                    ),
                            hintText: 'PRODUCT TYPE',
                            fillColor: Color(0x00FFFFFF),
                            elevation: 2,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            borderRadius: 0,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Price Range',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                            child: Text(
                              'Rs.100 - 10,000',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
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
                    max: 10000,
                    value: sliderValue1 ??= 10,
                    label: sliderValue1.toString(),
                    divisions: 1998,
                    onChanged: (newValue) {
                      setState(() => sliderValue1 = newValue);
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'Location',
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Open Sans',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                          child: Text(
                            '100M - 5000M',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    activeColor: FlutterFlowTheme.of(context).secondaryColor,
                    inactiveColor: Color(0xFF9E9E9E),
                    min: 100,
                    max: 5000,
                    value: sliderValue2 ??= 100,
                    label: sliderValue2.toString(),
                    divisions: 980,
                    onChanged: (newValue) {
                      setState(() => sliderValue2 = newValue);
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Apply',
                      options: FFButtonOptions(
                        width: 180,
                        height: 40,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFFEEEEEE),
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
                  Container(
                    height: 200,
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
