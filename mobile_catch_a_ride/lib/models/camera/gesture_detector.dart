import 'package:flutter/gestures.dart';

class DetectUserPan extends PanGestureRecognizer {
  Function _DetectUserPan;

  DetectUserPan(this._DetectUserPan);

  @override
  void resolve(GestureDisposition disposition) {
    super.resolve(disposition);
    this._DetectUserPan();
  }
}