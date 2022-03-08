import 'package:flutter/material.dart';

import 'package:mobile_catch_a_ride/views/globals.dart' as globals;

class PositionedModel extends StatefulWidget {
  const PositionedModel({Key? key}) : super(key: key);

  @override
  _PositionedModelState createState() => _PositionedModelState();
}

class _PositionedModelState extends State<PositionedModel> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20.0,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 12.0
        ),
        decoration: _boxDecoration(),
        child: _text(),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ]
    );
  }

  Text _text() {
    return Text(
      '${globals.info!.totalDistance}, ${globals.info!.totalDuration}',
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}
