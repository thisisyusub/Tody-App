import 'dart:math' as math;

void main() {
  Shape shape;

  shape = Rectangle(width: 10, height: 20);
  (shape as Rectangle).width = 15;

  print(shape.area());

  shape = Square(size: 20);
  (shape as Square).size = 30;
  print(shape.area());
}

abstract class Shape {
  double area();
}

class Square extends Shape {
  Square({required this.size});

  double size;

  @override
  double area() => math.pow(size, 2).toDouble();
}

class Rectangle extends Shape {
  Rectangle({
    required this.width,
    required this.height,
  });

  double width;
  double height;

  @override
  double area() => width * height;
}
