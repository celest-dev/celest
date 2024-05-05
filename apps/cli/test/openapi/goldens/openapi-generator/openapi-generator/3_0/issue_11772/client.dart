// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i2;

import 'package:celest/celest.dart' as _i3;
import 'package:collection/collection.dart' as _i4;
import 'package:http/http.dart' as _i1;

extension type ExtraAnnotationTestServers(Uri _) implements Uri {
  static final ExtraAnnotationTestServers defaultServer = server0;

  static final ExtraAnnotationTestServers server0 =
      ExtraAnnotationTestServers(Uri.parse(r'http://localhost:8080'));
}

class ExtraAnnotationTestEmployee {
  ExtraAnnotationTestEmployee({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List all employees.
  Future<GetEmployeesResponse> getEmployees({
    String? filterBy,
    String? filter,
    String? sortBy,
    required SortOrder sortOrder,
    int? offset,
    int? maxResults,
  }) async {
    final $queryParameters = <String, String>{};
    if (filterBy != null) {
      $queryParameters['filterBy'] = filterBy;
    }
    if (filter != null) {
      $queryParameters['filter'] = filter;
    }
    if (sortBy != null) {
      $queryParameters['sortBy'] = sortBy;
    }
    $queryParameters['sortOrder'] = sortOrder.toString();
    if (offset != null) {
      $queryParameters['offset'] = offset.toString();
    }
    if (maxResults != null) {
      $queryParameters['maxResults'] = maxResults.toString();
    }
    final $uri = Uri.parse('$_baseUri/employee')
        .replace(queryParameters: $queryParameters);
    final $request = _i1.Request(
      'GET',
      $uri,
    );
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $contentType = $response.headers['content-type'];
    switch ($response.statusCode) {
      /// A list resource collection of Employees.
      case 200:
        return _decodeJson<GetEmployeesResponse>($response);
      default:
        throw Exception('Unexpected response');
    }
  }

  Future<T> _decodeJson<T>(_i1.StreamedResponse $response) async {
    final $body = await $response.stream.bytesToString();
    final $json = _i2.jsonDecode($body);
    return _i3.Serializers.instance.deserialize<T>($json);
  }
}

class ExtraAnnotationTestCompany {
  ExtraAnnotationTestCompany({
    required _i1.Client httpClient,
    required Uri baseUri,
  })  : _httpClient = httpClient,
        _baseUri = baseUri;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;
}

final class ExtraAnnotationTestClient {
  ExtraAnnotationTestClient({
    _i1.Client? httpClient,
    Uri? baseUri,
  })  : _httpClient = httpClient ?? _i1.Client(),
        _baseUri = baseUri ?? ExtraAnnotationTestServers.defaultServer;

  final _i1.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  ExtraAnnotationTestEmployee get employee => ExtraAnnotationTestEmployee(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  ExtraAnnotationTestCompany get company => ExtraAnnotationTestCompany(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class EmployeeEntity {
  EmployeeEntity({
    this.id,
    this.name,
    this.email,
    this.role,
    this.hasAcceptedTerms,
    this.dateTermsAccepted,
    this.termsVersionNumber,
  });

  final String? id;

  final String? name;

  final String? email;

  final String? role;

  final bool? hasAcceptedTerms;

  final DateTime? dateTermsAccepted;

  final double? termsVersionNumber;
}

final class Employee {
  Employee({
    this.id,
    this.name,
    this.email,
    this.role,
    this.hasAcceptedTerms,
    this.dateTermsAccepted,
    this.termsVersionNumber,
  });

  final String? id;

  final String? name;

  final String? email;

  final String? role;

  final bool? hasAcceptedTerms;

  final DateTime? dateTermsAccepted;

  final double? termsVersionNumber;
}

extension type const SurveyGroupEntity_submissionStatus(String _)
    implements String {
  static const SurveyGroupEntity_submissionStatus complete =
      SurveyGroupEntity_submissionStatus('Complete');

  static const SurveyGroupEntity_submissionStatus incomplete =
      SurveyGroupEntity_submissionStatus('Incomplete');
}

final class SurveyGroupEntity {
  SurveyGroupEntity({
    this.id,
    this.createdDate,
    this.createdBy,
    this.modifiedDate,
    this.modifiedBy,
    required this.opportunityId,
    required this.projectName,
    required this.projectCreatorId,
    this.submissionStatus,
  });

  final String? id;

  final DateTime? createdDate;

  final String? createdBy;

  final DateTime? modifiedDate;

  final String? modifiedBy;

  final String opportunityId;

  final String projectName;

  final String projectCreatorId;

  final SurveyGroupEntity_submissionStatus? submissionStatus;
}

extension type const SurveyGroup_submissionStatus(String _) implements String {
  static const SurveyGroup_submissionStatus complete =
      SurveyGroup_submissionStatus('Complete');

  static const SurveyGroup_submissionStatus incomplete =
      SurveyGroup_submissionStatus('Incomplete');
}

final class SurveyGroup {
  SurveyGroup({
    this.id,
    this.createdDate,
    this.createdBy,
    this.modifiedDate,
    this.modifiedBy,
    required this.opportunityId,
    required this.projectName,
    required this.projectCreatorId,
    this.submissionStatus,
  });

  final String? id;

  final DateTime? createdDate;

  final String? createdBy;

  final DateTime? modifiedDate;

  final String? modifiedBy;

  final String opportunityId;

  final String projectName;

  final String projectCreatorId;

  final SurveyGroup_submissionStatus? submissionStatus;
}

final class EmployeeAssignment_employee {
  EmployeeAssignment_employee({
    this.id,
    this.name,
    this.email,
    this.role,
    this.hasAcceptedTerms,
    this.dateTermsAccepted,
    this.termsVersionNumber,
  });

  final String? id;

  final String? name;

  final String? email;

  final String? role;

  final bool? hasAcceptedTerms;

  final DateTime? dateTermsAccepted;

  final double? termsVersionNumber;
}

extension type const EmployeeAssignment_surveyGroup_submissionStatus(String _)
    implements String {
  static const EmployeeAssignment_surveyGroup_submissionStatus complete =
      EmployeeAssignment_surveyGroup_submissionStatus('Complete');

  static const EmployeeAssignment_surveyGroup_submissionStatus incomplete =
      EmployeeAssignment_surveyGroup_submissionStatus('Incomplete');
}

final class EmployeeAssignment_surveyGroup {
  EmployeeAssignment_surveyGroup({
    this.id,
    this.createdDate,
    this.createdBy,
    this.modifiedDate,
    this.modifiedBy,
    required this.opportunityId,
    required this.projectName,
    required this.projectCreatorId,
    this.submissionStatus,
  });

  final String? id;

  final DateTime? createdDate;

  final String? createdBy;

  final DateTime? modifiedDate;

  final String? modifiedBy;

  final String opportunityId;

  final String projectName;

  final String projectCreatorId;

  final EmployeeAssignment_surveyGroup_submissionStatus? submissionStatus;
}

final class EmployeeAssignment {
  EmployeeAssignment({
    this.id,
    this.employee,
    this.surveyGroup,
    this.startDate,
    this.endDate,
    this.billableRole,
  });

  final String? id;

  final EmployeeAssignment_employee? employee;

  final EmployeeAssignment_surveyGroup? surveyGroup;

  final DateTime? startDate;

  final DateTime? endDate;

  final String? billableRole;
}

extension type const CompanyDto_priceCategory(String _) implements String {
  static const CompanyDto_priceCategory free = CompanyDto_priceCategory('FREE');

  static const CompanyDto_priceCategory priceTier1 =
      CompanyDto_priceCategory('PRICE_TIER_1');

  static const CompanyDto_priceCategory priceTier2 =
      CompanyDto_priceCategory('PRICE_TIER_2');
}

final class CompanyDto {
  CompanyDto({this.priceCategory});

  final CompanyDto_priceCategory? priceCategory;
}

extension type const SamplingPriceCategoryEnum(String _) implements String {
  static const SamplingPriceCategoryEnum free =
      SamplingPriceCategoryEnum('FREE');

  static const SamplingPriceCategoryEnum priceTier1 =
      SamplingPriceCategoryEnum('PRICE_TIER_1');

  static const SamplingPriceCategoryEnum priceTier2 =
      SamplingPriceCategoryEnum('PRICE_TIER_2');
}
extension type const SortOrder(String _) implements String {
  static const SortOrder asc = SortOrder('ASC');

  static const SortOrder desc = SortOrder('DESC');
}

final class GetEmployeesResponse extends _i4.DelegatingList<Employee> {
  GetEmployeesResponse(super.base);
}
