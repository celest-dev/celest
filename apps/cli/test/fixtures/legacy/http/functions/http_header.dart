import 'package:celest/celest.dart';
import 'package:celest/http.dart';
import 'package:celest_backend/models/http_header_query.dart';

@cloud
Future<HttpHeaderParams> headers(
  @httpHeader('aString') String aString,
  @httpHeader('anInt') int anInt,
  @httpHeader('aDouble') double aDouble,
  @httpHeader('aNum') num aNum,
  @httpHeader('aBool') bool aBool,
  @httpHeader('aDateTime') DateTime aDateTime,
  @httpHeader('aNullableString') String? aNullableString,
  @httpHeader('aNullableInt') int? aNullableInt,
  @httpHeader('aNullableDouble') double? aNullableDouble,
  @httpHeader('aNullableNum') num? aNullableNum,
  @httpHeader('aNullableBool') bool? aNullableBool,
  @httpHeader('aNullableDateTime') DateTime? aNullableDateTime,
) async {
  return HttpHeaderParams(
    aString: aString,
    anInt: anInt,
    aDouble: aDouble,
    aNum: aNum,
    aBool: aBool,
    aDateTime: aDateTime,
    aNullableString: aNullableString,
    aNullableInt: aNullableInt,
    aNullableDouble: aNullableDouble,
    aNullableNum: aNullableNum,
    aNullableBool: aNullableBool,
    aNullableDateTime: aNullableDateTime,
  );
}
