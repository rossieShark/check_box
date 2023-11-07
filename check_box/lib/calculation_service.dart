import 'package:flutter/material.dart';

class CalculationService {
  static const double _padding = 16;
  static const double _checkBoxSize = 24;
  static const double _separatorMinSize = 10;
  static const double _separatorPadding = 0;

  double get padding => _padding;
  double get checkBoxSize => _checkBoxSize;
  double get separatorMinSize => _separatorMinSize;
  double get separatorPadding => _separatorPadding;

  double calculateTextMaxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width -
        _padding * 2 -
        _checkBoxSize -
        _separatorMinSize;
  }
}
