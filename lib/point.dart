import 'dart:math';

class Point {
  final double x;
  final double y;

  const Point({required this.x, required this.y});
  const Point.initial() : x = 0, y = 7;

  double distanceTo(Point p) {
    double W = x - p.x;
    double H = y - p.y;

    return sqrt(W * W + H * H);
  }

  Map<String, dynamic> toJson() {
    return {'x': x, 'y': y};
  }

  Point.fromJson(Map<String, dynamic> data) :  x = (data['x'] as int).toDouble(),    y = (data['y'] as int).toDouble();

  @override
  String toString() {
    return "Point($x, $y)";
  }
}
