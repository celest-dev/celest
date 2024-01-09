import 'dart:math';

// Should be able to use the base type.
double area(Shape shape) => shape.area;

// Should be able to use the base type in a collection.
List<Shape> sealedClass({
  required List<Shape> shapes,
}) {
  return shapes;
}

// Should be able to use leaf types directly.
Rectangle rectangle(Rectangle rectangle) => rectangle;
Circle circle(Circle circle) => circle;

sealed class Shape {
  double get area;
}

class Rectangle extends Shape {
  Rectangle(this.width, this.height);

  final double width;
  final double height;

  @override
  double get area => width * height;
}

class Circle extends Shape {
  Circle(this.radius);

  final double radius;

  @override
  double get area => pi * radius * radius;
}
