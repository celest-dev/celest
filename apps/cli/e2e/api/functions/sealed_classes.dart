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

// Should be able to define custom toJson/fromJson methods.
List<ShapeWithInheritedCustomJson> sealedClassWithInheritedCustomJson({
  required List<ShapeWithInheritedCustomJson> shapes,
}) {
  return shapes;
}

sealed class ShapeWithInheritedCustomJson {
  const ShapeWithInheritedCustomJson();

  factory ShapeWithInheritedCustomJson.fromJson(Map<String, Object?> json) {
    final type = json[r'$type'] as String;
    final size = json['size'] as Map<String, Object?>;
    if (type == 'RectangleWithInheritedCustomJson') {
      return RectangleWithInheritedCustomJson(
        (size['width'] as num).toDouble(),
        (size['height'] as num).toDouble(),
      );
    } else if (type == 'CircleWithInheritedCustomJson') {
      return CircleWithInheritedCustomJson(
        (size['radius'] as num).toDouble(),
      );
    } else {
      throw ArgumentError.value(
        json,
        'json',
        'Unknown type: $type',
      );
    }
  }

  Map<String, Object?> toJson() => switch (this) {
        RectangleWithInheritedCustomJson(:final width, :final height) => {
            'size': {
              'width': width,
              'height': height,
            },
          },
        CircleWithInheritedCustomJson(:final radius) => {
            'size': {
              'radius': radius,
            },
          },
      };
}

class RectangleWithInheritedCustomJson extends ShapeWithInheritedCustomJson {
  RectangleWithInheritedCustomJson(this.width, this.height);

  final double width;
  final double height;
}

class CircleWithInheritedCustomJson extends ShapeWithInheritedCustomJson {
  CircleWithInheritedCustomJson(this.radius);

  final double radius;
}

// Should be able to define toJson/fromJson on just the leaf classes.
List<ShapeWithCustomJson> sealedClassWithCustomJson({
  required List<ShapeWithCustomJson> shapes,
}) {
  return shapes;
}

sealed class ShapeWithCustomJson {}

class RectangleWithCustomJson extends ShapeWithCustomJson {
  RectangleWithCustomJson(this.width, this.height);

  factory RectangleWithCustomJson.fromJson(Map<String, Object?> json) {
    final size = json['size'] as Map<String, Object?>;
    return RectangleWithCustomJson(
      (size['width'] as num).toDouble(),
      (size['height'] as num).toDouble(),
    );
  }

  final double width;
  final double height;

  Map<String, Object?> toJson() => {
        'size': {
          'width': width,
          'height': height,
        },
      };
}

class CircleWithCustomJson extends ShapeWithCustomJson {
  CircleWithCustomJson(this.radius);

  factory CircleWithCustomJson.fromJson(Map<String, Object?> json) {
    final size = json['size'] as Map<String, Object?>;
    return CircleWithCustomJson(
      (size['radius'] as num).toDouble(),
    );
  }

  final double radius;

  Map<String, Object?> toJson() => {
        'size': {
          'radius': radius,
        },
      };
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

sealed class ShapeWithOverriddenCustomJson {
  const ShapeWithOverriddenCustomJson();

  factory ShapeWithOverriddenCustomJson.fromJson(Map<String, Object?> json) {
    final type = json[r'$type'] as String;
    if (type == 'RectangleWithOverriddenCustomJson') {
      final size = json['size'] as Map<String, Object?>;
      return RectangleWithOverriddenCustomJson(
        (size['width'] as num).toDouble(),
        (size['height'] as num).toDouble(),
      );
    } else if (type == 'CircleWithOverriddenCustomJson') {
      return CircleWithOverriddenCustomJson.fromJson(json);
    } else {
      throw ArgumentError.value(
        json,
        'json',
        'Unknown type: $type',
      );
    }
  }

  Map<String, Object?> toJson() => switch (this) {
        RectangleWithOverriddenCustomJson(:final width, :final height) => {
            'size': {
              'width': width,
              'height': height,
            },
          },
        _ => throw StateError('Unknown type: $this'),
      };
}

class RectangleWithOverriddenCustomJson extends ShapeWithOverriddenCustomJson {
  RectangleWithOverriddenCustomJson(this.width, this.height);

  final double width;
  final double height;
}

class CircleWithOverriddenCustomJson extends ShapeWithOverriddenCustomJson {
  CircleWithOverriddenCustomJson(this.radius);

  factory CircleWithOverriddenCustomJson.fromJson(Map<String, Object?> json) {
    final size = json['size'] as Map<String, Object?>;
    return CircleWithOverriddenCustomJson(
      (size['radius'] as num).toDouble(),
    );
  }

  final double radius;

  @override
  Map<String, Object?> toJson() => {
        'size': {
          'radius': radius,
        },
      };
}
