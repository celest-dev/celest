import 'package:libcoder/libcoder.dart';

final class MyClass {
  MyClass({
    required this.myBool,
    required this.myInt,
    required this.myDouble,
    required this.myString,
    required this.myDateTime,
  });

  final bool myBool;
  final int myInt;
  final double myDouble;
  final String myString;
  final DateTime myDateTime;

  static const self = Typeref<MyClass>(typeName: 'MyClass');

  static MyClass decode<V extends Object?>(V value, Decoder<V> decoder) {
    final container = decoder.container(value);
    final myBool = container.decodeBool('myBool');
    final myInt = container.decodeInt('myInt');
    final myDouble = container.decodeDouble('myDouble');
    final myString = container.decodeString('myString');
    final myDateTime = container.decodeDateTime('myDateTime');
    return MyClass(
      myBool: myBool,
      myInt: myInt,
      myDouble: myDouble,
      myString: myString,
      myDateTime: myDateTime,
    );
  }

  static V encode<V>(MyClass instance, Encoder<V> encoder) {
    final container = encoder.container();
    container.encodeBool('myBool', instance.myBool);
    container.encodeInt('myInt', instance.myInt);
    container.encodeDouble('myDouble', instance.myDouble);
    container.encodeString('myString', instance.myString);
    container.encodeDateTime('myDateTime', instance.myDateTime);
    return container.value;
  }

  V encodeWith<V>(Encoder<V> protocol) => protocol.encode(this, as: self);
}

final coding = GlobalCoder(
  staticConfig: const {
    MyClass.self: CoderConfig<MyClass>(
      encode: MyClass.encode,
      decode: MyClass.decode,
    ),
  },
);

void main() {
  final instance = MyClass(
    myBool: true,
    myInt: 42,
    myDouble: 3.14,
    myString: 'Hello, World!',
    myDateTime: DateTime.now(),
  );
  print(coding.json.encode(instance, as: MyClass.self));
  print(coding.formData.encode(instance, as: MyClass.self));
}
