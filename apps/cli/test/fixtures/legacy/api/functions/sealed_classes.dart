// Should be able to use the base type.
import 'package:celest/celest.dart';
import 'package:celest_backend/exceptions/exceptions.dart';
import 'package:celest_backend/models/sealed_classes.dart';

@cloud
double area(Shape shape) => shape.area;

// Should be able to use the base type in a collection.
@cloud
List<Shape> sealedClass({
  required List<Shape> shapes,
}) {
  return shapes;
}

// Should be able to use leaf types directly.
@cloud
Rectangle rectangle(Rectangle rectangle) => rectangle;
@cloud
Circle circle(Circle circle) => circle;

// Should be able to define custom toJson/fromJson methods.
@cloud
List<ShapeWithInheritedCustomJson> sealedClassWithInheritedCustomJson({
  required List<ShapeWithInheritedCustomJson> shapes,
}) {
  return shapes;
}

// Should be able to define toJson/fromJson on just the leaf classes.
@cloud
List<ShapeWithCustomJson> sealedClassWithCustomJson({
  required List<ShapeWithCustomJson> shapes,
}) {
  return shapes;
}

// Should be able to override toJson/fromJson in the leaf classes.
@cloud
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

@cloud
ShapeWithOverriddenCustomJson rectangleWithOverriddenCustomJson(
  RectangleWithOverriddenCustomJson rectangle,
) {
  return rectangle;
}

@cloud
CircleWithOverriddenCustomJson circleWithOverriddenCustomJson(
  ShapeWithOverriddenCustomJson circle,
) {
  return circle as CircleWithOverriddenCustomJson;
}

@cloud
List<OkResult<Shape>> okShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) OkResult(shape)];
@cloud
List<ErrResult<String>> errShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) ErrResult('Bad shape: ($shape)')];
@cloud
List<Result<Shape, String>> shapeResults(List<Shape> shapes) => [
      ...okShapeResults(shapes),
      ...errShapeResults(shapes),
    ];

// TODO(dnys1): Test ShapeResult<dynamic> not allowed.
@cloud
List<ShapeResult<String>> aliasedOkShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) OkResult(shape)];
@cloud
List<ShapeResult<String>> aliasedErrShapeResults(List<Shape> shapes) =>
    [for (final shape in shapes) ErrResult('Bad shape: ($shape)')];
@cloud
List<ShapeResult<String>> aliasedShapeResults(List<Shape> shapes) => [
      ...okShapeResults(shapes),
      ...errShapeResults(shapes),
    ];

@cloud
SwappedResult<Shape, String> swappedResult(Result<Shape, String> result) =>
    SwappedResult(result);

@cloud
OkResult<T> genericResult<T extends Shape>(T data) => OkResult(data);
@cloud
List<Result<T, E>>
    multipleGenericResult<T extends Shape, E extends ShapeException>(
  T data,
  E error,
) =>
        [OkResult(data), ErrResult(error)];

// TODO(dnys1): rework subtype checks with finals so that OkShapeResult is not
// a subtype of Result<String, Shape>. Currently, OkShapeResult is a subtype of
// Result<String, Shape> because it extends OkResult.
@cloud
OkShapeResult okShapeResult(Shape shape) => OkShapeResult(shape);
