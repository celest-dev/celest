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

List<OkResult<Shape>> okShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) OkResult(shape)];
List<ErrResult<String>> errShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) ErrResult('Bad shape: ($shape)')];
List<Result<Shape, String>> shapeResults(List<Shape> shapes) => [
      ...okShapeResults(shapes),
      ...errShapeResults(shapes),
    ];

// TODO(dnys1): Test ShapeResult<dynamic> not allowed.
List<ShapeResult<String>> aliasedOkShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) OkResult(shape)];
List<ShapeResult<String>> aliasedErrShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) ErrResult('Bad shape: ($shape)')];
List<ShapeResult<String>> aliasedShapeResults(List<Shape> shapes) => [
      ...okShapeResults(shapes),
      ...errShapeResults(shapes),
    ];

SwappedResult<Shape, String> swappedResult(Result<Shape, String> result) =>
    SwappedResult(result);

// TODO(dnys1): rework subtype checks with finals so that OkShapeResult is not
// OkShapeResult okShapeResult(Shape shape) => OkShapeResult(shape);
// a subtype of Result<String, Shape>. Currently, OkShapeResult is a subtype of
// Result<String, Shape> because it extends OkResult.

// TODO(dnys1): bounded generics (e.g. `Future<Result<T>> sayHello<T extends SealedClass>`