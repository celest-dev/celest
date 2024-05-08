import 'package:libcoder/libcoder.dart';
import 'package:test/test.dart';

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

  static const Typeref<MyClass> self = Typeref(typeName: 'MyClass');

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
}

final coding = GlobalCoder(
  staticConfig: const {
    MyClass.self: CoderConfig<MyClass>(
      encode: MyClass.encode,
      decode: MyClass.decode,
    )
  },
);

void main() {
  group('JsonEncoder', () {
    final jsonEncoder = coding.json.encoder;

    test('can encode single values', () {
      final bool = jsonEncoder.singleValueContainer();
      bool.encodeBool(true);
      expect(bool.value, true);

      final int = jsonEncoder.singleValueContainer();
      int.encodeInt(42);
      expect(int.value, 42);

      final double = jsonEncoder.singleValueContainer();
      double.encodeDouble(3.14);
      expect(double.value, 3.14);

      final string = jsonEncoder.singleValueContainer();
      string.encodeString('Hello, World!');
      expect(string.value, 'Hello, World!');

      final nullValue = jsonEncoder.singleValueContainer();
      nullValue.encodeNull();
      expect(nullValue.value, null);
    });

    test('can encode list values', () {
      final container = jsonEncoder.unkeyedContainer();
      container.encodeBool(true);
      container.encodeInt(42);
      container.encodeDouble(3.14);
      container.encodeString('Hello, World!');
      container.encodeNull();

      final sublist = container.nestedUnkeyedContainer();
      sublist.encodeBool(true);
      sublist.encodeInt(42);
      sublist.encodeDouble(3.14);
      sublist.encodeString('Hello, World!');
      sublist.encodeNull();

      final submap = container.nestedContainer();
      submap.encodeBool('bool', true);
      submap.encodeInt('int', 42);
      submap.encodeDouble('double', 3.14);
      submap.encodeString('string', 'Hello, World!');
      submap.encodeNull('null');

      final myClass = container.nestedSingleValueContainer();
      myClass.encode(
        MyClass(
          myBool: true,
          myInt: 42,
          myDouble: 3.14,
          myString: 'Hello, World!',
          myDateTime: DateTime.utc(2000),
        ),
        as: MyClass.self,
      );

      expect(
        container.value,
        [
          true,
          42,
          3.14,
          'Hello, World!',
          null,
          [true, 42, 3.14, 'Hello, World!', null],
          {
            'bool': true,
            'int': 42,
            'double': 3.14,
            'string': 'Hello, World!',
            'null': null,
          },
          {
            'myBool': true,
            'myInt': 42,
            'myDouble': 3.14,
            'myString': 'Hello, World!',
            'myDateTime': 946684800000,
          },
        ],
      );
    });

    test('can encode map values', () {
      final container = jsonEncoder.container();
      container.encodeBool('bool', true);
      container.encodeInt('int', 42);
      container.encodeDouble('double', 3.14);
      container.encodeString('string', 'Hello, World!');
      container.encodeNull('null');

      final list = container.nestedUnkeyedContainer('list');
      list.encodeBool(true);
      list.encodeInt(42);
      list.encodeDouble(3.14);
      list.encodeString('Hello, World!');
      list.encodeNull();

      final map = container.nestedContainer('map');
      map.encodeBool('bool', true);
      map.encodeInt('int', 42);
      map.encodeDouble('double', 3.14);
      map.encodeString('string', 'Hello, World!');
      map.encodeNull('null');

      final myClass = container.nestedSingleValueContainer('myClass');
      myClass.encode(
        MyClass(
          myBool: true,
          myInt: 42,
          myDouble: 3.14,
          myString: 'Hello, World!',
          myDateTime: DateTime.utc(2000),
        ),
        as: MyClass.self,
      );

      expect(container.value, {
        'bool': true,
        'int': 42,
        'double': 3.14,
        'string': 'Hello, World!',
        'null': null,
        'list': [true, 42, 3.14, 'Hello, World!', null],
        'map': {
          'bool': true,
          'int': 42,
          'double': 3.14,
          'string': 'Hello, World!',
          'null': null,
        },
        'myClass': {
          'myBool': true,
          'myInt': 42,
          'myDouble': 3.14,
          'myString': 'Hello, World!',
          'myDateTime': 946684800000,
        },
      });
    });
  });

  group('JsonDecoder', () {
    final jsonDecoder = coding.json.decoder;

    test('can decode single values', () {
      final bool = jsonDecoder.singleValueContainer(true);
      expect(bool.decodeBool(), true);

      final int = jsonDecoder.singleValueContainer(42);
      expect(int.decodeInt(), 42);

      final double = jsonDecoder.singleValueContainer(3.14);
      expect(double.decodeDouble(), 3.14);

      final string = jsonDecoder.singleValueContainer('Hello, World!');
      expect(string.decodeString(), 'Hello, World!');

      final nullValue = jsonDecoder.singleValueContainer(null);
      expect(nullValue.decodeNull(), true);
    });

    test('can decode list values', () {
      final container = jsonDecoder.unkeyedContainer([
        true,
        42,
        3.14,
        'Hello, World!',
        null,
        [true, 42, 3.14, 'Hello, World!', null],
        {
          'bool': true,
          'int': 42,
          'double': 3.14,
          'string': 'Hello, World!',
          'null': null,
        },
        {
          'myBool': true,
          'myInt': 42,
          'myDouble': 3.14,
          'myString': 'Hello, World!',
          'myDateTime': 946684800000,
        },
      ]);

      expect(container.decodeBool(), true);
      expect(container.decodeInt(), 42);
      expect(container.decodeDouble(), 3.14);
      expect(container.decodeString(), 'Hello, World!');
      expect(container.decodeNull(), true);

      final sublist = container.nestedUnkeyedContainer();
      expect(sublist.decodeBool(), true);
      expect(sublist.decodeInt(), 42);
      expect(sublist.decodeDouble(), 3.14);
      expect(sublist.decodeString(), 'Hello, World!');
      expect(sublist.decodeNull(), true);

      final submap = container.nestedContainer();
      expect(submap.decodeBool('bool'), true);
      expect(submap.decodeInt('int'), 42);
      expect(submap.decodeDouble('double'), 3.14);
      expect(submap.decodeString('string'), 'Hello, World!');
      expect(submap.decodeNull('null'), true);

      final myClass = container.nestedSingleValueContainer();
      final myClassValue = myClass.decode(as: MyClass.self);
      expect(myClassValue.myBool, true);
      expect(myClassValue.myInt, 42);
      expect(myClassValue.myDouble, 3.14);
      expect(myClassValue.myString, 'Hello, World!');
    });

    test('can decode map values', () {
      final container = jsonDecoder.container({
        'bool': true,
        'int': 42,
        'double': 3.14,
        'string': 'Hello, World!',
        'null': null,
        'list': [true, 42, 3.14, 'Hello, World!', null],
        'map': {
          'bool': true,
          'int': 42,
          'double': 3.14,
          'string': 'Hello, World!',
          'null': null,
        },
        'myClass': {
          'myBool': true,
          'myInt': 42,
          'myDouble': 3.14,
          'myString': 'Hello, World!',
          'myDateTime': 946684800000,
        },
      });

      expect(container.decodeBool('bool'), true);
      expect(container.decodeInt('int'), 42);
      expect(container.decodeDouble('double'), 3.14);
      expect(container.decodeString('string'), 'Hello, World!');
      expect(container.decodeNull('null'), true);

      final list = container.nestedUnkeyedContainer('list');
      expect(list.decodeBool(), true);
      expect(list.decodeInt(), 42);
      expect(list.decodeDouble(), 3.14);
      expect(list.decodeString(), 'Hello, World!');
      expect(list.decodeNull(), true);

      final map = container.nestedContainer('map');
      expect(map.decodeBool('bool'), true);
      expect(map.decodeInt('int'), 42);
      expect(map.decodeDouble('double'), 3.14);
      expect(map.decodeString('string'), 'Hello, World!');
      expect(map.decodeNull('null'), true);

      final myClass = container.nestedSingleValueContainer('myClass');
      final myClassValue = myClass.decode(as: MyClass.self);
      expect(myClassValue.myBool, true);
      expect(myClassValue.myInt, 42);
      expect(myClassValue.myDouble, 3.14);
      expect(myClassValue.myString, 'Hello, World!');
      expect(myClassValue.myDateTime, DateTime.utc(2000));
    });
  });

  const expectedFormValues = {
    'bool': 'true',
    'double': '1.0',
    'int': '1',
    'string': 'string',
    'datetime': '946684800000',
    'myClass[myBool]': 'true',
    'myClass[myInt]': '42',
    'myClass[myDouble]': '3.14',
    'myClass[myString]': 'Hello, World!',
    'myClass[myDateTime]': '946684800000',
    'list[0]': 'true',
    'list[1]': '1',
    'list[2]': 'string',
    'list[3][bool]': 'true',
    'list[3][double]': '1.0',
    'list[3][int]': '1',
    'list[3][string]': 'string',
    'list[3][datetime]': '946684800000',
    'list[3][myClass][myBool]': 'true',
    'list[3][myClass][myInt]': '42',
    'list[3][myClass][myDouble]': '3.14',
    'list[3][myClass][myString]': 'Hello, World!',
    'list[3][myClass][myDateTime]': '946684800000',
    'list[4][myBool]': 'true',
    'list[4][myInt]': '42',
    'list[4][myDouble]': '3.14',
    'list[4][myString]': 'Hello, World!',
    'list[4][myDateTime]': '946684800000',
    'list[5][0]': 'true',
    'list[5][1]': '1',
    'list[5][2]': 'string',
    'list[5][3][bool]': 'true',
    'list[5][3][double]': '1.0',
    'list[5][3][int]': '1',
    'list[5][3][string]': 'string',
    'list[5][3][datetime]': '946684800000',
    'list[5][3][myClass][myBool]': 'true',
    'list[5][3][myClass][myInt]': '42',
    'list[5][3][myClass][myDouble]': '3.14',
    'list[5][3][myClass][myString]': 'Hello, World!',
    'list[5][3][myClass][myDateTime]': '946684800000',
    'list[5][4][myBool]': 'true',
    'list[5][4][myInt]': '42',
    'list[5][4][myDouble]': '3.14',
    'list[5][4][myString]': 'Hello, World!',
    'list[5][4][myDateTime]': '946684800000',
    'fields[bool]': 'true',
    'fields[double]': '1.0',
    'fields[int]': '1',
    'fields[string]': 'string',
    'fields[datetime]': '946684800000',
    'fields[myClass][myBool]': 'true',
    'fields[myClass][myInt]': '42',
    'fields[myClass][myDouble]': '3.14',
    'fields[myClass][myString]': 'Hello, World!',
    'fields[myClass][myDateTime]': '946684800000',
    'fields[list][0]': 'true',
    'fields[list][1]': '1',
    'fields[list][2]': 'string',
    'fields[list][3][bool]': 'true',
    'fields[list][3][double]': '1.0',
    'fields[list][3][int]': '1',
    'fields[list][3][string]': 'string',
    'fields[list][3][datetime]': '946684800000',
    'fields[list][3][myClass][myBool]': 'true',
    'fields[list][3][myClass][myInt]': '42',
    'fields[list][3][myClass][myDouble]': '3.14',
    'fields[list][3][myClass][myString]': 'Hello, World!',
    'fields[list][3][myClass][myDateTime]': '946684800000',
    'fields[list][4][myBool]': 'true',
    'fields[list][4][myInt]': '42',
    'fields[list][4][myDouble]': '3.14',
    'fields[list][4][myString]': 'Hello, World!',
    'fields[list][4][myDateTime]': '946684800000',
  };

  void encodeValues(KeyedEncodingContainer<String, Object> container) {
    container.encodeBool('bool', true);
    container.encodeDouble('double', 1.0);
    container.encodeInt('int', 1);
    container.encodeString('string', 'string');
    container.encodeDateTime('datetime', DateTime.utc(2000));
    container.encode(
      'myClass',
      MyClass(
        myBool: true,
        myInt: 42,
        myDouble: 3.14,
        myString: 'Hello, World!',
        myDateTime: DateTime.utc(2000),
      ),
      as: MyClass.self,
    );
  }

  void encodeList(UnkeyedEncodingContainer<Object> container) {
    container.encodeBool(true);
    container.encodeInt(1);
    container.encodeString('string');
    container.encodeMap(encodeValues);
    final myClass = container.nestedSingleValueContainer();
    myClass.encode(
      MyClass(
        myBool: true,
        myInt: 42,
        myDouble: 3.14,
        myString: 'Hello, World!',
        myDateTime: DateTime.utc(2000),
      ),
      as: MyClass.self,
    );
  }

  Object encode(Encoder<Object> encoder) {
    final container = encoder.container<String>();
    encodeValues(container);
    container.encodeList('list', (container) {
      encodeList(container);
      container.encodeList(encodeList);
    });
    container.encodeMap<String>('fields', (fields) {
      encodeValues(fields);
      fields.encodeList('list', encodeList);
    });
    return container.value;
  }

  test('FormDataEncoder', () {
    final encoded = encode(coding.formData.encoder) as String;
    expect(Uri.splitQueryString(encoded), expectedFormValues);
  });

  test('FormFieldsEncoder', () {
    final encoded = encode(coding.formFields.encoder) as Map<String, String>;
    expect(encoded, expectedFormValues);
  });
}
