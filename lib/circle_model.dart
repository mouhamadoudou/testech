import 'dart:math';

import 'package:testech/shape.dart';

class CircleModel extends Shape {
  CircleModel({required super.p1, required super.p2});

  double getRadius() {
    double radius=p1.distanceTo(p2);

    return radius;
  }

  @override
  double getArea() {
    double r = getRadius();
    return pi*r*r;
  }

  @override
  double getPerimeter() {
    return 2*pi*getRadius();
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'type': 'Circle',
      'center': p1.toJson(),
      'radius': getRadius().toStringAsFixed(2),
    };
  }
}
