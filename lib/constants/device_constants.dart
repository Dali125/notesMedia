import 'dart:ui';

class DeviceDimensions {
  double getWidth() {
    double width = window.physicalSize.width;

    return width;
  }

  double getHeight() {
    double height = window.physicalSize.height;

    return height;
  }
}
