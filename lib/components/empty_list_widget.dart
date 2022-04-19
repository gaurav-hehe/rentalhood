import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget({Key key}) : super(key: key);

  @override
  _EmptyListWidgetState createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.no_food,
          color: Color(0xFF8B97A2),
          size: 90,
        ),
        AutoSizeText(
          'Seems you don’t have any products in your area.\nTry expanding the location filter.',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
