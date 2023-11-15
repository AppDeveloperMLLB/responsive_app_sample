import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool isTablet() {
    const tabletWidth = 600;
    //  縦の場合は横幅で、横の場合は高さでタブレットか判定する
    return MediaQuery.orientationOf(this) == Orientation.portrait
        ? MediaQuery.sizeOf(this).width > tabletWidth
        : MediaQuery.sizeOf(this).height > tabletWidth;
  }
}
