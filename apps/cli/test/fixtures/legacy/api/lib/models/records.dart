typedef NamedFieldsRecord = ({
  String field,
  String anotherField,
});

typedef Nested = ({NamedFieldsRecord namedFields});

typedef NullableNested = ({NamedFieldsRecord? namedFields});
