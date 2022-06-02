import 'package:flutter/material.dart';

class UiSpacer {
  //space between widgets vertically
  static Widget verticalSpace({double space = 20}) => SizedBox(height: space);

  //space between widgets horizontally
  static Widget horizontalSpace({double space = 20}) => SizedBox(width: space);

  static Widget empty() => SizedBox(width: 0);
  static Widget px1({double space = 2}) => SizedBox(width: space);
  static Widget px2({double space = 4}) => SizedBox(width: space);
  static Widget px3({double space = 6}) => SizedBox(width: space);
  static Widget px4({double space = 10}) => SizedBox(width: space);
  static Widget px5({double space = 16}) => SizedBox(width: space);

  //dividers
  static Widget divider({double thickness = 2}) =>
      Divider(thickness: thickness);
}
