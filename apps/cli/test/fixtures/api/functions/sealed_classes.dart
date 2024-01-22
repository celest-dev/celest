import 'package:celest_backend/models.dart';

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

// Should be able to define custom toJson/fromJson methods.
List<ShapeWithInheritedCustomJson> sealedClassWithInheritedCustomJson({
  required List<ShapeWithInheritedCustomJson> shapes,
}) {
  return shapes;
}

// Should be able to define toJson/fromJson on just the leaf classes.
List<ShapeWithCustomJson> sealedClassWithCustomJson({
  required List<ShapeWithCustomJson> shapes,
}) {
  return shapes;
}

// Should be able to override toJson/fromJson in the leaf classes.
List<ShapeWithOverriddenCustomJson> sealedClassWithOverriddenCustomJson({
  required CircleWithOverriddenCustomJson circle,
  required RectangleWithOverriddenCustomJson rectangle,
  required List<ShapeWithOverriddenCustomJson> other,
}) {
  return [
    circle,
    rectangle,
    ...other,
  ];
}

ShapeWithOverriddenCustomJson rectangleWithOverriddenCustomJson(
  RectangleWithOverriddenCustomJson rectangle,
) {
  return rectangle;
}

CircleWithOverriddenCustomJson circleWithOverriddenCustomJson(
  ShapeWithOverriddenCustomJson circle,
) {
  return circle as CircleWithOverriddenCustomJson;
}
