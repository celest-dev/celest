// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _$convert;

import 'package:http/http.dart' as _$http;

import 'models.dart';

extension type StripeApiServers(Uri _) implements Uri {
  static final StripeApiServers defaultServer = server0;

  static final StripeApiServers server0 = StripeApiServers(
    Uri.parse(r'https://api.stripe.com/'),
  );
}

class StripeApiClientV1Account {
  StripeApiClientV1Account({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves the details of an account.
  Future<Account> retrieve({List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/account',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Account.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountLinks {
  StripeApiClientV1AccountLinks({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates an AccountLink object that includes a single-use Stripe URL that the platform can redirect their user to in order to take them through the Connect Onboarding flow.
  Future<AccountLink> create({required PostAccountLinksBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/account_links');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return AccountLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountSessions {
  StripeApiClientV1AccountSessions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a AccountSession object that includes a single-use token that the platform can use on their front-end to grant client-side API access.
  Future<AccountSession> create({required PostAccountSessionsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/account_sessions');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return AccountSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountsAccountCapabilities {
  StripeApiClientV1AccountsAccountCapabilities({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of capabilities associated with the account. The capabilities are returned sorted by creation date, with the most recent capability appearing first.
  Future<GetAccountsAccountCapabilitiesResponse> list({
    required String account,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/capabilities',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetAccountsAccountCapabilitiesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves information about the specified Account Capability.
  Future<Capability> retrieve({
    required String account,
    required String capability,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/capabilities/$capability',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Capability.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing Account Capability. Request or remove a capability by updating its `requested` parameter.
  Future<Capability> update({
    required String account,
    required String capability,
    PostAccountsAccountCapabilitiesCapabilityBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/capabilities/$capability',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Capability.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountsAccountExternalAccounts {
  StripeApiClientV1AccountsAccountExternalAccounts({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List external accounts for an account.
  Future<GetAccountsAccountExternalAccountsResponse> list({
    required String account,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    Object_object? object,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (object != null) {
      $queryParameters['object'] = object.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/external_accounts',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetAccountsAccountExternalAccountsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Create an external account for a given account.
  Future<ExternalAccount> create({
    required String account,
    required PostAccountsAccountExternalAccountsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account/external_accounts');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ExternalAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieve a specified external account for a given account.
  Future<ExternalAccount> retrieve({
    required String account,
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/external_accounts/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ExternalAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the metadata, account holder name, account holder type of a bank account belonging to a [Custom account](/docs/connect/custom-accounts), and optionally sets it as the default for its currency. Other bank account details are not editable by design.
  ///
  /// You can re-enable a disabled bank account by performing an update call without providing any arguments or changes.
  Future<ExternalAccount> update({
    required String account,
    required String id,
    PostAccountsAccountExternalAccountsIdBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/external_accounts/$id',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ExternalAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Delete a specified external account for a given account.
  Future<DeletedExternalAccount> delete({
    required String account,
    required String id,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/external_accounts/$id',
    );
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedExternalAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountsAccountLoginLinks {
  StripeApiClientV1AccountsAccountLoginLinks({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a single-use login link for an Express account to access their Stripe dashboard.
  ///
  /// **You may only create login links for [Express accounts](/docs/connect/express-accounts) connected to your platform**.
  Future<LoginLink> create({
    required String account,
    PostAccountsAccountLoginLinksBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account/login_links');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return LoginLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountsAccountPersons {
  StripeApiClientV1AccountsAccountPersons({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of people associated with the account’s legal entity. The people are returned sorted by creation date, with the most recent people appearing first.
  Future<GetAccountsAccountPersonsResponse> list({
    required String account,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    Relationship_relationship? relationship,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (relationship != null) {
      $queryParameters['relationship'] = relationship.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/persons',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetAccountsAccountPersonsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new person.
  Future<Person> create({
    required String account,
    PostAccountsAccountPersonsBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account/persons');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Person.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an existing person.
  Future<Person> retrieve({
    required String account,
    required String person,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account/persons/$person',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Person.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing person.
  Future<Person> update({
    required String account,
    required String person,
    PostAccountsAccountPersonsPersonBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account/persons/$person');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Person.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes an existing person’s relationship to the account’s legal entity. Any person with a relationship for an account can be deleted through the API, except if the person is the `account_opener`. If your integration is using the `executive` parameter, you cannot delete the only verified `executive` on file.
  Future<DeletedPerson> delete({
    required String account,
    required String person,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account/persons/$person');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedPerson.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountsAccountReject {
  StripeApiClientV1AccountsAccountReject({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// With [Connect](/docs/connect), you may flag accounts as suspicious.
  ///
  /// Test-mode Custom and Express accounts can be rejected at any time. Accounts created using live-mode keys may only be rejected once all balances are zero.
  Future<Account> reject({
    required String account,
    required PostAccountsAccountRejectBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account/reject');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Account.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AccountsAccount {
  StripeApiClientV1AccountsAccount({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1AccountsAccountCapabilities get capabilities =>
      StripeApiClientV1AccountsAccountCapabilities(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1AccountsAccountExternalAccounts get externalAccounts =>
      StripeApiClientV1AccountsAccountExternalAccounts(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1AccountsAccountLoginLinks get loginLinks =>
      StripeApiClientV1AccountsAccountLoginLinks(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1AccountsAccountPersons get persons =>
      StripeApiClientV1AccountsAccountPersons(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1AccountsAccountReject get reject =>
      StripeApiClientV1AccountsAccountReject(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Accounts {
  StripeApiClientV1Accounts({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of accounts connected to your platform via [Connect](/docs/connect). If you’re not a platform, the list is empty.
  Future<GetAccountsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetAccountsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// With [Connect](/docs/connect), you can create Stripe accounts for your users. To do this, you’ll first need to [register your platform](https://dashboard.stripe.com/account/applications/settings).
  ///
  /// If you’ve already collected information for your connected accounts, you [can prefill that information](/docs/connect/best-practices#onboarding) when creating the account. Connect Onboarding won’t ask for the prefilled information during account onboarding. You can prefill any information on the account.
  Future<Account> create({PostAccountsBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Account.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an account.
  Future<Account> retrieve({
    required String account,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/accounts/$account',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Account.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a [connected account](/docs/connect/accounts) by setting the values of the parameters passed. Any parameters not provided are left unchanged.
  ///
  /// For Custom accounts, you can update any information on the account. For other accounts, you can update all information until that account has started to go through Connect Onboarding. Once you create an [Account Link](/docs/api/account_links) or [Account Session](/docs/api/account_sessions), some properties can only be changed or updated for Custom accounts.
  ///
  /// To update your own account, use the [Dashboard](https://dashboard.stripe.com/settings/account). Refer to our [Connect](/docs/connect/updating-accounts) documentation to learn more about updating accounts.
  Future<Account> update({
    required String account,
    PostAccountsAccountBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Account.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// With [Connect](/docs/connect), you can delete accounts you manage.
  ///
  /// Accounts created using test-mode keys can be deleted at any time. Standard accounts created using live-mode keys cannot be deleted. Custom or Express accounts created using live-mode keys can only be deleted once all balances are zero.
  ///
  /// If you want to delete your own account, use the [account information tab in your account settings](https://dashboard.stripe.com/settings/account) instead.
  Future<DeletedAccount> delete({required String account}) async {
    final $uri = Uri.parse('$_baseUri/v1/accounts/$account');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1AccountsAccount get account =>
      StripeApiClientV1AccountsAccount(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ApplePayDomains {
  StripeApiClientV1ApplePayDomains({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List apple pay domains.
  Future<GetApplePayDomainsResponse> list({
    String? domainName,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (domainName != null) {
      $queryParameters['domain_name'] = domainName;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/apple_pay/domains',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetApplePayDomainsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Create an apple pay domain.
  Future<ApplePayDomain> create({required PostApplePayDomainsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/apple_pay/domains');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ApplePayDomain.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieve an apple pay domain.
  Future<ApplePayDomain> retrieve({
    required String domain,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/apple_pay/domains/$domain',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ApplePayDomain.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Delete an apple pay domain.
  Future<DeletedApplePayDomain> delete({required String domain}) async {
    final $uri = Uri.parse('$_baseUri/v1/apple_pay/domains/$domain');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedApplePayDomain.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ApplePay {
  StripeApiClientV1ApplePay({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ApplePayDomains get domains =>
      StripeApiClientV1ApplePayDomains(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ApplicationFeesFeeRefunds {
  StripeApiClientV1ApplicationFeesFeeRefunds({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// By default, you can see the 10 most recent refunds stored directly on the application fee object, but you can also retrieve details about a specific refund stored on the application fee.
  Future<FeeRefund> retrieve({
    required String fee,
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/application_fees/$fee/refunds/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FeeRefund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified application fee refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  ///
  /// This request only accepts metadata as an argument.
  Future<FeeRefund> update({
    required String fee,
    required String id,
    PostApplicationFeesFeeRefundsIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/application_fees/$fee/refunds/$id');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FeeRefund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ApplicationFeesFee {
  StripeApiClientV1ApplicationFeesFee({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ApplicationFeesFeeRefunds get refunds =>
      StripeApiClientV1ApplicationFeesFeeRefunds(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ApplicationFeesIdRefunds {
  StripeApiClientV1ApplicationFeesIdRefunds({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// You can see a list of the refunds belonging to a specific application fee. Note that the 10 most recent refunds are always available by default on the application fee object. If you need more than those 10, you can use this API method and the `limit` and `starting_after` parameters to page through additional refunds.
  Future<GetApplicationFeesIdRefundsResponse> list({
    required String id,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/application_fees/$id/refunds',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetApplicationFeesIdRefundsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Refunds an application fee that has previously been collected but not yet refunded. Funds will be refunded to the Stripe account from which the fee was originally collected.
  ///
  /// You can optionally refund only part of an application fee. You can do so multiple times, until the entire fee has been refunded.
  ///
  /// Once entirely refunded, an application fee can’t be refunded again. This method will raise an error when called on an already-refunded application fee, or when trying to refund more money than is left on an application fee.
  Future<FeeRefund> create({
    required String id,
    PostApplicationFeesIdRefundsBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/application_fees/$id/refunds');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FeeRefund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ApplicationFeesId {
  StripeApiClientV1ApplicationFeesId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ApplicationFeesIdRefunds get refunds =>
      StripeApiClientV1ApplicationFeesIdRefunds(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ApplicationFees {
  StripeApiClientV1ApplicationFees({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of application fees you’ve previously collected. The application fees are returned in sorted order, with the most recent fees appearing first.
  Future<GetApplicationFeesResponse> list({
    String? charge,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (charge != null) {
      $queryParameters['charge'] = charge;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/application_fees',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetApplicationFeesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an application fee that your account has collected. The same information is returned when refunding the application fee.
  Future<ApplicationFee> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/application_fees/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ApplicationFee.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1ApplicationFeesFee get fee =>
      StripeApiClientV1ApplicationFeesFee(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1ApplicationFeesId get id =>
      StripeApiClientV1ApplicationFeesId(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1AppsSecretsDelete {
  StripeApiClientV1AppsSecretsDelete({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Deletes a secret from the secret store by name and scope.
  Future<AppsSecret> delete_where({
    required PostAppsSecretsDeleteBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/apps/secrets/delete');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return AppsSecret.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AppsSecretsFind {
  StripeApiClientV1AppsSecretsFind({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Finds a secret in the secret store by name and scope.
  Future<AppsSecret> find({
    List<String>? expand,
    required String name,
    required Scope_scope scope,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['name'] = name;
    $queryParameters['scope'] = scope.toString();
    final $uri = Uri.parse(
      '$_baseUri/v1/apps/secrets/find',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return AppsSecret.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1AppsSecrets {
  StripeApiClientV1AppsSecrets({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List all secrets stored on the given scope.
  Future<GetAppsSecretsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    required Scope_scope scope,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    $queryParameters['scope'] = scope.toString();
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/apps/secrets',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetAppsSecretsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Create or replace a secret in the secret store.
  Future<AppsSecret> create({required PostAppsSecretsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/apps/secrets');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return AppsSecret.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1AppsSecretsDelete get delete =>
      StripeApiClientV1AppsSecretsDelete(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1AppsSecretsFind get find => StripeApiClientV1AppsSecretsFind(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1Apps {
  StripeApiClientV1Apps({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1AppsSecrets get secrets =>
      StripeApiClientV1AppsSecrets(baseUri: _baseUri, httpClient: _httpClient);
}

class StripeApiClientV1Balance {
  StripeApiClientV1Balance({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves the current account balance, based on the authentication that was used to make the request. For a sample request, see [Accounting for negative balances](/docs/connect/account-balances#accounting-for-negative-balances).
  Future<Balance> retrieve({List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/balance',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Balance.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BalanceTransactions {
  StripeApiClientV1BalanceTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of transactions that have contributed to the Stripe account balance (e.g., charges, transfers, and so forth). The transactions are returned in sorted order, with the most recent transactions appearing first.
  ///
  /// Note that this endpoint was previously called “Balance history” and used the path `/v1/balance/history`.
  Future<GetBalanceTransactionsResponse> list({
    Created_created? created,
    String? currency,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? payout,
    String? source,
    String? startingAfter,
    String? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (currency != null) {
      $queryParameters['currency'] = currency;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (payout != null) {
      $queryParameters['payout'] = payout;
    }
    if (source != null) {
      $queryParameters['source'] = source;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/balance_transactions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetBalanceTransactionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the balance transaction with the given ID.
  ///
  /// Note that this endpoint previously used the path `/v1/balance/history/:id`.
  Future<BalanceTransaction> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/balance_transactions/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BalanceTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingMeterEventAdjustments {
  StripeApiClientV1BillingMeterEventAdjustments({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a billing meter event adjustment
  Future<BillingMeterEventAdjustment> create({
    required PostBillingMeterEventAdjustmentsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/billing/meter_event_adjustments');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingMeterEventAdjustment.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingMeterEvents {
  StripeApiClientV1BillingMeterEvents({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a billing meter event
  Future<BillingMeterEvent> create({
    required PostBillingMeterEventsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/billing/meter_events');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingMeterEvent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingMetersIdDeactivate {
  StripeApiClientV1BillingMetersIdDeactivate({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Deactivates a billing meter
  Future<BillingMeter> deactivate({
    required String id,
    PostBillingMetersIdDeactivateBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/billing/meters/$id/deactivate');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingMeter.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingMetersIdEventSummaries {
  StripeApiClientV1BillingMetersIdEventSummaries({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieve a list of billing meter event summaries.
  Future<GetBillingMetersIdEventSummariesResponse> list({
    required String id,
    required String customer,
    required DateTime endTime,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    required DateTime startTime,
    String? startingAfter,
    String? valueGroupingWindow,
  }) async {
    final $queryParameters = <String, Object>{};
    $queryParameters['customer'] = customer;
    $queryParameters['end_time'] = endTime.millisecondsSinceEpoch.toString();
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    $queryParameters['start_time'] =
        startTime.millisecondsSinceEpoch.toString();
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (valueGroupingWindow != null) {
      $queryParameters['value_grouping_window'] = r'hour';
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/billing/meters/$id/event_summaries',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetBillingMetersIdEventSummariesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingMetersIdReactivate {
  StripeApiClientV1BillingMetersIdReactivate({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Reactivates a billing meter
  Future<BillingMeter> reactivate({
    required String id,
    PostBillingMetersIdReactivateBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/billing/meters/$id/reactivate');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingMeter.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingMetersId {
  StripeApiClientV1BillingMetersId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1BillingMetersIdDeactivate get deactivate =>
      StripeApiClientV1BillingMetersIdDeactivate(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1BillingMetersIdEventSummaries get eventSummaries =>
      StripeApiClientV1BillingMetersIdEventSummaries(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1BillingMetersIdReactivate get reactivate =>
      StripeApiClientV1BillingMetersIdReactivate(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1BillingMeters {
  StripeApiClientV1BillingMeters({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieve a list of billing meters.
  Future<GetBillingMetersResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/billing/meters',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetBillingMetersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a billing meter
  Future<BillingMeter> create({required PostBillingMetersBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/billing/meters');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingMeter.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a billing meter given an ID
  Future<BillingMeter> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/billing/meters/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingMeter.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a billing meter
  Future<BillingMeter> update({
    required String id,
    PostBillingMetersIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/billing/meters/$id');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingMeter.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1BillingMetersId get id => StripeApiClientV1BillingMetersId(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1Billing {
  StripeApiClientV1Billing({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1BillingMeterEventAdjustments get meterEventAdjustments =>
      StripeApiClientV1BillingMeterEventAdjustments(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1BillingMeterEvents get meterEvents =>
      StripeApiClientV1BillingMeterEvents(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1BillingMeters get meters => StripeApiClientV1BillingMeters(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1BillingPortalConfigurations {
  StripeApiClientV1BillingPortalConfigurations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of configurations that describe the functionality of the customer portal.
  Future<GetBillingPortalConfigurationsResponse> list({
    bool? active,
    String? endingBefore,
    List<String>? expand,
    bool? isDefault,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (isDefault != null) {
      $queryParameters['is_default'] = isDefault.toString();
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/billing_portal/configurations',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetBillingPortalConfigurationsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a configuration that describes the functionality and behavior of a PortalSession
  Future<BillingPortalConfiguration> create({
    required PostBillingPortalConfigurationsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/billing_portal/configurations');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingPortalConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a configuration that describes the functionality of the customer portal.
  Future<BillingPortalConfiguration> retrieve({
    required String configuration,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/billing_portal/configurations/$configuration',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingPortalConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a configuration that describes the functionality of the customer portal.
  Future<BillingPortalConfiguration> update({
    required String configuration,
    PostBillingPortalConfigurationsConfigurationBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/billing_portal/configurations/$configuration',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingPortalConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingPortalSessions {
  StripeApiClientV1BillingPortalSessions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a session of the customer portal.
  Future<BillingPortalSession> create({
    required PostBillingPortalSessionsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/billing_portal/sessions');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BillingPortalSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1BillingPortal {
  StripeApiClientV1BillingPortal({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1BillingPortalConfigurations get configurations =>
      StripeApiClientV1BillingPortalConfigurations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1BillingPortalSessions get sessions =>
      StripeApiClientV1BillingPortalSessions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ChargesSearch {
  StripeApiClientV1ChargesSearch({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Search for charges you’ve previously created using Stripe’s [Search Query Language](/docs/search#search-query-language). Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up to an hour behind during outages. Search functionality is not available to merchants in India.
  Future<GetChargesSearchResponse> search({
    List<String>? expand,
    int? limit,
    String? page,
    required String query,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      $queryParameters['page'] = page;
    }
    $queryParameters['query'] = query;
    final $uri = Uri.parse(
      '$_baseUri/v1/charges/search',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetChargesSearchResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ChargesChargeCapture {
  StripeApiClientV1ChargesChargeCapture({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Capture the payment of an existing, uncaptured charge that was created with the `capture` option set to false.
  ///
  /// Uncaptured payments expire a set number of days after they are created ([7 by default](/docs/charges/placing-a-hold)), after which they are marked as refunded and capture attempts will fail.
  ///
  /// Don’t use this method to capture a PaymentIntent-initiated charge. Use [Capture a PaymentIntent](/docs/api/payment_intents/capture).
  Future<Charge> capture({
    required String charge,
    PostChargesChargeCaptureBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/charges/$charge/capture');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Charge.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ChargesChargeRefunds {
  StripeApiClientV1ChargesChargeRefunds({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// You can see a list of the refunds belonging to a specific charge. Note that the 10 most recent refunds are always available by default on the charge object. If you need more than those 10, you can use this API method and the `limit` and `starting_after` parameters to page through additional refunds.
  Future<GetChargesChargeRefundsResponse> list({
    required String charge,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/charges/$charge/refunds',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetChargesChargeRefundsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing refund.
  Future<Refund> retrieve({
    required String charge,
    required String refund,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/charges/$charge/refunds/$refund',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Refund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ChargesCharge {
  StripeApiClientV1ChargesCharge({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ChargesChargeCapture get capture =>
      StripeApiClientV1ChargesChargeCapture(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1ChargesChargeRefunds get refunds =>
      StripeApiClientV1ChargesChargeRefunds(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Charges {
  StripeApiClientV1Charges({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of charges you’ve previously created. The charges are returned in sorted order, with the most recent charges appearing first.
  Future<GetChargesResponse> list({
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? paymentIntent,
    String? startingAfter,
    String? transferGroup,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (paymentIntent != null) {
      $queryParameters['payment_intent'] = paymentIntent;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (transferGroup != null) {
      $queryParameters['transfer_group'] = transferGroup;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/charges',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetChargesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// This method is no longer recommended—use the [Payment Intents API](/docs/api/payment_intents) to initiate a new payment instead. Confirmation of the PaymentIntent creates the `Charge` object used to request payment.
  Future<Charge> create({PostChargesBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/charges');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Charge.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.
  Future<Charge> retrieve({
    required String charge,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/charges/$charge',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Charge.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<Charge> update({
    required String charge,
    PostChargesChargeBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/charges/$charge');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Charge.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1ChargesSearch get search => StripeApiClientV1ChargesSearch(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );

  StripeApiClientV1ChargesCharge get charge => StripeApiClientV1ChargesCharge(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1CheckoutSessionsSessionExpire {
  StripeApiClientV1CheckoutSessionsSessionExpire({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// A Session can be expired when it is in one of these statuses: `open`
  ///
  /// After it expires, a customer can’t complete a Session and customers loading the Session see a message saying the Session is expired.
  Future<CheckoutSession> expire({
    required String session,
    PostCheckoutSessionsSessionExpireBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/checkout/sessions/$session/expire');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CheckoutSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CheckoutSessionsSessionLineItems {
  StripeApiClientV1CheckoutSessionsSessionLineItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving a Checkout Session, there is an includable **line_items** property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  Future<GetCheckoutSessionsSessionLineItemsResponse> list_line_items({
    required String session,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/checkout/sessions/$session/line_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCheckoutSessionsSessionLineItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CheckoutSessionsSession {
  StripeApiClientV1CheckoutSessionsSession({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1CheckoutSessionsSessionExpire get expire =>
      StripeApiClientV1CheckoutSessionsSessionExpire(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CheckoutSessionsSessionLineItems get lineItems =>
      StripeApiClientV1CheckoutSessionsSessionLineItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1CheckoutSessions {
  StripeApiClientV1CheckoutSessions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Checkout Sessions.
  Future<GetCheckoutSessionsResponse> list({
    Created_created? created,
    String? customer,
    CustomerDetails_customerDetails? customerDetails,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? paymentIntent,
    String? paymentLink,
    String? startingAfter,
    Status_status? status,
    String? subscription,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (customerDetails != null) {
      $queryParameters['customer_details'] = customerDetails.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (paymentIntent != null) {
      $queryParameters['payment_intent'] = paymentIntent;
    }
    if (paymentLink != null) {
      $queryParameters['payment_link'] = paymentLink;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (subscription != null) {
      $queryParameters['subscription'] = subscription;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/checkout/sessions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCheckoutSessionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a Session object.
  Future<CheckoutSession> create({PostCheckoutSessionsBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/checkout/sessions');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CheckoutSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a Session object.
  Future<CheckoutSession> retrieve({
    required String session,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/checkout/sessions/$session',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CheckoutSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1CheckoutSessionsSession get session =>
      StripeApiClientV1CheckoutSessionsSession(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Checkout {
  StripeApiClientV1Checkout({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1CheckoutSessions get sessions =>
      StripeApiClientV1CheckoutSessions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ClimateOrdersOrderCancel {
  StripeApiClientV1ClimateOrdersOrderCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancels a Climate order. You can cancel an order within 30 days of creation. Stripe refunds the reservation `amount_subtotal`, but not the `amount_fees` for user-triggered cancellations. Frontier might cancel reservations if suppliers fail to deliver. If Frontier cancels the reservation, Stripe provides 90 days advance notice and refunds the `amount_total`.
  Future<ClimateOrder> cancel({
    required String order,
    PostClimateOrdersOrderCancelBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/climate/orders/$order/cancel');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ClimateOrder.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ClimateOrdersOrder {
  StripeApiClientV1ClimateOrdersOrder({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ClimateOrdersOrderCancel get cancel =>
      StripeApiClientV1ClimateOrdersOrderCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ClimateOrders {
  StripeApiClientV1ClimateOrders({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists all Climate order objects. The orders are returned sorted by creation date, with the most recently created orders appearing first.
  Future<GetClimateOrdersResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/climate/orders',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetClimateOrdersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a Climate order object for a given Climate product. The order will be processed immediately after creation and payment will be deducted your Stripe balance.
  Future<ClimateOrder> create({required PostClimateOrdersBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/climate/orders');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ClimateOrder.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a Climate order object with the given ID.
  Future<ClimateOrder> retrieve({
    required String order,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/climate/orders/$order',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ClimateOrder.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified order by setting the values of the parameters passed.
  Future<ClimateOrder> update({
    required String order,
    PostClimateOrdersOrderBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/climate/orders/$order');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ClimateOrder.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1ClimateOrdersOrder get order =>
      StripeApiClientV1ClimateOrdersOrder(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ClimateProducts {
  StripeApiClientV1ClimateProducts({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists all available Climate product objects.
  Future<GetClimateProductsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/climate/products',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetClimateProductsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a Climate product with the given ID.
  Future<ClimateProduct> retrieve({
    required String product,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/climate/products/$product',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ClimateProduct.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ClimateSuppliers {
  StripeApiClientV1ClimateSuppliers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists all available Climate supplier objects.
  Future<GetClimateSuppliersResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/climate/suppliers',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetClimateSuppliersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a Climate supplier object.
  Future<ClimateSupplier> retrieve({
    required String supplier,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/climate/suppliers/$supplier',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ClimateSupplier.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Climate {
  StripeApiClientV1Climate({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ClimateOrders get orders => StripeApiClientV1ClimateOrders(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );

  StripeApiClientV1ClimateProducts get products =>
      StripeApiClientV1ClimateProducts(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1ClimateSuppliers get suppliers =>
      StripeApiClientV1ClimateSuppliers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ConfirmationTokens {
  StripeApiClientV1ConfirmationTokens({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves an existing ConfirmationToken object
  Future<ConfirmationToken> retrieve({
    required String confirmationToken,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/confirmation_tokens/$confirmationToken',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ConfirmationToken.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CountrySpecs {
  StripeApiClientV1CountrySpecs({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists all Country Spec objects available in the API.
  Future<GetCountrySpecsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/country_specs',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCountrySpecsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Returns a Country Spec for a given Country code.
  Future<CountrySpec> retrieve({
    required String country,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/country_specs/$country',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CountrySpec.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Coupons {
  StripeApiClientV1Coupons({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your coupons.
  Future<GetCouponsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/coupons',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCouponsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// You can create coupons easily via the [coupon management](https://dashboard.stripe.com/coupons) page of the Stripe dashboard. Coupon creation is also accessible via the API if you need to create coupons on the fly.
  ///
  /// A coupon has either a `percent_off` or an `amount_off` and `currency`. If you set an `amount_off`, that amount will be subtracted from any invoice’s subtotal. For example, an invoice with a subtotal of 100 will have a final total of 0 if a coupon with an `amount_off` of 200 is applied to it and an invoice with a subtotal of 300 will have a final total of 100 if a coupon with an `amount_off` of 200 is applied to it.
  Future<Coupon> create({PostCouponsBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/coupons');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Coupon.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the coupon with the given ID.
  Future<Coupon> retrieve({
    required String coupon,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/coupons/$coupon',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Coupon.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are, by design, not editable.
  Future<Coupon> update({
    required String coupon,
    PostCouponsCouponBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/coupons/$coupon');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Coupon.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// You can delete coupons via the [coupon management](https://dashboard.stripe.com/coupons) page of the Stripe dashboard. However, deleting a coupon does not affect any customers who have already applied the coupon; it means that new customers can’t redeem the coupon. You can also delete coupons via the API.
  Future<DeletedCoupon> delete({required String coupon}) async {
    final $uri = Uri.parse('$_baseUri/v1/coupons/$coupon');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedCoupon.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CreditNotesPreviewLines {
  StripeApiClientV1CreditNotesPreviewLines({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving a credit note preview, you’ll get a **lines** property containing the first handful of those items. This URL you can retrieve the full (paginated) list of line items.
  Future<GetCreditNotesPreviewLinesResponse> preview_lines({
    int? amount,
    int? creditAmount,
    DateTime? effectiveAt,
    String? endingBefore,
    List<String>? expand,
    required String invoice,
    int? limit,
    List<Lines_linesItem>? lines,
    String? memo,
    Map<String, String>? metadata,
    int? outOfBandAmount,
    Reason_reason? reason,
    String? refund,
    int? refundAmount,
    ShippingCost_shippingCost? shippingCost,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (amount != null) {
      $queryParameters['amount'] = amount.toString();
    }
    if (creditAmount != null) {
      $queryParameters['credit_amount'] = creditAmount.toString();
    }
    if (effectiveAt != null) {
      $queryParameters['effective_at'] =
          effectiveAt.millisecondsSinceEpoch.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['invoice'] = invoice;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (lines != null) {
      $queryParameters['lines'] = lines;
    }
    if (memo != null) {
      $queryParameters['memo'] = memo;
    }
    if (metadata != null) {
      $queryParameters['metadata'] = metadata.toString();
    }
    if (outOfBandAmount != null) {
      $queryParameters['out_of_band_amount'] = outOfBandAmount.toString();
    }
    if (reason != null) {
      $queryParameters['reason'] = reason.toString();
    }
    if (refund != null) {
      $queryParameters['refund'] = refund;
    }
    if (refundAmount != null) {
      $queryParameters['refund_amount'] = refundAmount.toString();
    }
    if (shippingCost != null) {
      $queryParameters['shipping_cost'] = shippingCost.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/credit_notes/preview/lines',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCreditNotesPreviewLinesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CreditNotesPreview {
  StripeApiClientV1CreditNotesPreview({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Get a preview of a credit note without creating it.
  Future<CreditNote> preview({
    int? amount,
    int? creditAmount,
    DateTime? effectiveAt,
    List<String>? expand,
    required String invoice,
    List<Lines_linesItem>? lines,
    String? memo,
    Map<String, String>? metadata,
    int? outOfBandAmount,
    Reason_reason? reason,
    String? refund,
    int? refundAmount,
    ShippingCost_shippingCost? shippingCost,
  }) async {
    final $queryParameters = <String, Object>{};
    if (amount != null) {
      $queryParameters['amount'] = amount.toString();
    }
    if (creditAmount != null) {
      $queryParameters['credit_amount'] = creditAmount.toString();
    }
    if (effectiveAt != null) {
      $queryParameters['effective_at'] =
          effectiveAt.millisecondsSinceEpoch.toString();
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['invoice'] = invoice;
    if (lines != null) {
      $queryParameters['lines'] = lines;
    }
    if (memo != null) {
      $queryParameters['memo'] = memo;
    }
    if (metadata != null) {
      $queryParameters['metadata'] = metadata.toString();
    }
    if (outOfBandAmount != null) {
      $queryParameters['out_of_band_amount'] = outOfBandAmount.toString();
    }
    if (reason != null) {
      $queryParameters['reason'] = reason.toString();
    }
    if (refund != null) {
      $queryParameters['refund'] = refund;
    }
    if (refundAmount != null) {
      $queryParameters['refund_amount'] = refundAmount.toString();
    }
    if (shippingCost != null) {
      $queryParameters['shipping_cost'] = shippingCost.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/credit_notes/preview',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CreditNote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1CreditNotesPreviewLines get lines =>
      StripeApiClientV1CreditNotesPreviewLines(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1CreditNotesCreditNoteLines {
  StripeApiClientV1CreditNotesCreditNoteLines({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving a credit note, you’ll get a **lines** property containing the the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  Future<GetCreditNotesCreditNoteLinesResponse> list({
    required String creditNote,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/credit_notes/$creditNote/lines',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCreditNotesCreditNoteLinesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CreditNotesCreditNote {
  StripeApiClientV1CreditNotesCreditNote({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1CreditNotesCreditNoteLines get lines =>
      StripeApiClientV1CreditNotesCreditNoteLines(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1CreditNotesIdVoid {
  StripeApiClientV1CreditNotesIdVoid({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Marks a credit note as void. Learn more about [voiding credit notes](/docs/billing/invoices/credit-notes#voiding).
  Future<CreditNote> void_credit_note({
    required String id,
    PostCreditNotesIdVoidBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/credit_notes/$id/void');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CreditNote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CreditNotesId {
  StripeApiClientV1CreditNotesId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1CreditNotesIdVoid get void_ =>
      StripeApiClientV1CreditNotesIdVoid(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1CreditNotes {
  StripeApiClientV1CreditNotes({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of credit notes.
  Future<GetCreditNotesResponse> list({
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    String? invoice,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (invoice != null) {
      $queryParameters['invoice'] = invoice;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/credit_notes',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCreditNotesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Issue a credit note to adjust the amount of a finalized invoice. For a `status=open` invoice, a credit note reduces its `amount_due`. For a `status=paid` invoice, a credit note does not affect its `amount_due`. Instead, it can result in any combination of the following:
  ///
  /// *   Refund: create a new refund (using `refund_amount`) or link an existing refund (using `refund`).
  /// *   Customer balance credit: credit the customer’s balance (using `credit_amount`) which will be automatically applied to their next invoice when it’s finalized.
  /// *   Outside of Stripe credit: record the amount that is or will be credited outside of Stripe (using `out\_of\_band_amount`).
  ///
  /// For post-payment credit notes the sum of the refund, credit and outside of Stripe amounts must equal the credit note total.
  ///
  /// You may issue multiple credit notes for an invoice. Each credit note will increment the invoice’s `pre\_payment\_credit\_notes\_amount` or `post\_payment\_credit\_notes\_amount` depending on its `status` at the time of credit note creation.
  Future<CreditNote> create({required PostCreditNotesBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/credit_notes');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CreditNote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the credit note object with the given identifier.
  Future<CreditNote> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/credit_notes/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CreditNote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing credit note.
  Future<CreditNote> update({
    required String id,
    PostCreditNotesIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/credit_notes/$id');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CreditNote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1CreditNotesPreview get preview =>
      StripeApiClientV1CreditNotesPreview(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CreditNotesCreditNote get creditNote =>
      StripeApiClientV1CreditNotesCreditNote(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CreditNotesId get id => StripeApiClientV1CreditNotesId(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1CustomerSessions {
  StripeApiClientV1CustomerSessions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a customer session object that includes a single-use client secret that you can use on your front-end to grant client-side API access for certain customer resources.
  Future<CustomerSession> create({
    required PostCustomerSessionsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customer_sessions');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CustomerSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersSearch {
  StripeApiClientV1CustomersSearch({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Search for customers you’ve previously created using Stripe’s [Search Query Language](/docs/search#search-query-language). Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up to an hour behind during outages. Search functionality is not available to merchants in India.
  Future<GetCustomersSearchResponse> search({
    List<String>? expand,
    int? limit,
    String? page,
    required String query,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      $queryParameters['page'] = page;
    }
    $queryParameters['query'] = query;
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/search',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersSearchResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerBalanceTransactions {
  StripeApiClientV1CustomersCustomerBalanceTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of transactions that updated the customer’s [balances](/docs/billing/customer/balance).
  Future<GetCustomersCustomerBalanceTransactionsResponse> list({
    required String customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/balance_transactions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersCustomerBalanceTransactionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates an immutable transaction that updates the customer’s credit [balance](/docs/billing/customer/balance).
  Future<CustomerBalanceTransaction> create({
    required String customer,
    required PostCustomersCustomerBalanceTransactionsBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/balance_transactions',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CustomerBalanceTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a specific customer balance transaction that updated the customer’s [balances](/docs/billing/customer/balance).
  Future<CustomerBalanceTransaction> retrieve({
    required String customer,
    required String transaction,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/balance_transactions/$transaction',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CustomerBalanceTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Most credit balance transaction fields are immutable, but you may update its `description` and `metadata`.
  Future<CustomerBalanceTransaction> update({
    required String customer,
    required String transaction,
    PostCustomersCustomerBalanceTransactionsTransactionBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/balance_transactions/$transaction',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CustomerBalanceTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerCashBalance {
  StripeApiClientV1CustomersCustomerCashBalance({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves a customer’s cash balance.
  Future<CashBalance> retrieve({
    required String customer,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/cash_balance',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CashBalance.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Changes the settings on a customer’s cash balance.
  Future<CashBalance> update({
    required String customer,
    PostCustomersCustomerCashBalanceBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer/cash_balance');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CashBalance.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerCashBalanceTransactions {
  StripeApiClientV1CustomersCustomerCashBalanceTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of transactions that modified the customer’s [cash balance](/docs/payments/customer-balance).
  Future<GetCustomersCustomerCashBalanceTransactionsResponse> list({
    required String customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/cash_balance_transactions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersCustomerCashBalanceTransactionsResponse.fromJson(
          $json,
        );

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a specific cash balance transaction, which updated the customer’s [cash balance](/docs/payments/customer-balance).
  Future<CustomerCashBalanceTransaction> retrieve({
    required String customer,
    required String transaction,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/cash_balance_transactions/$transaction',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CustomerCashBalanceTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerDiscount {
  StripeApiClientV1CustomersCustomerDiscount({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Removes the currently applied discount on a customer.
  Future<DeletedDiscount> delete_discount({required String customer}) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer/discount');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedDiscount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerFundingInstructions {
  StripeApiClientV1CustomersCustomerFundingInstructions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieve funding instructions for a customer cash balance. If funding instructions do not yet exist for the customer, new funding instructions will be created. If funding instructions have already been created for a given customer, the same funding instructions will be retrieved. In other words, we will return the same funding instructions each time.
  Future<FundingInstructions> create_funding_instructions({
    required String customer,
    required PostCustomersCustomerFundingInstructionsBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/funding_instructions',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FundingInstructions.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerPaymentMethods {
  StripeApiClientV1CustomersCustomerPaymentMethods({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of PaymentMethods for a given Customer
  Future<GetCustomersCustomerPaymentMethodsResponse> list_payment_methods({
    required String customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Type_type? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/payment_methods',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersCustomerPaymentMethodsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a PaymentMethod object for a given Customer.
  Future<PaymentMethod> retrieve_payment_method({
    required String customer,
    required String paymentMethod,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/payment_methods/$paymentMethod',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethod.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerSourcesIdVerify {
  StripeApiClientV1CustomersCustomerSourcesIdVerify({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Verify a specified bank account for a given customer.
  Future<BankAccount> verify({
    required String customer,
    required String id,
    PostCustomersCustomerSourcesIdVerifyBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/sources/$id/verify',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return BankAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomerSourcesId {
  StripeApiClientV1CustomersCustomerSourcesId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1CustomersCustomerSourcesIdVerify get verify =>
      StripeApiClientV1CustomersCustomerSourcesIdVerify(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1CustomersCustomerSources {
  StripeApiClientV1CustomersCustomerSources({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List sources for a specified customer.
  Future<GetCustomersCustomerSourcesResponse> list({
    required String customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? object,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (object != null) {
      $queryParameters['object'] = object;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/sources',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersCustomerSourcesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// When you create a new credit card, you must specify a customer or recipient on which to create it.
  ///
  /// If the card’s owner has no default card, then the new card will become the default. However, if the owner already has a default, then it will not change. To change the default, you should [update the customer](/docs/api#update_customer) to have a new `default_source`.
  Future<PaymentSource> create({
    required String customer,
    required PostCustomersCustomerSourcesBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer/sources');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentSource.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieve a specified source for a given customer.
  Future<PaymentSource> retrieve({
    required String customer,
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/sources/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentSource.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Update a specified source for a given customer.
  Future<PostCustomersCustomerSourcesIdResponse> update({
    required String customer,
    required String id,
    PostCustomersCustomerSourcesIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer/sources/$id');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PostCustomersCustomerSourcesIdResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Delete a specified source for a given customer.
  Future<DeleteCustomersCustomerSourcesIdResponse> detach({
    required String customer,
    required String id,
    DeleteCustomersCustomerSourcesIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer/sources/$id');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeleteCustomersCustomerSourcesIdResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1CustomersCustomerSourcesId get id =>
      StripeApiClientV1CustomersCustomerSourcesId(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1CustomersCustomerTaxIds {
  StripeApiClientV1CustomersCustomerTaxIds({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of tax IDs for a customer.
  Future<GetCustomersCustomerTaxIdsResponse> list({
    required String customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/tax_ids',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersCustomerTaxIdsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new `tax_id` object for a customer.
  Future<TaxId> create({
    required String customer,
    required PostCustomersCustomerTaxIdsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer/tax_ids');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxId.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the `tax_id` object with the given identifier.
  Future<TaxId> retrieve({
    required String customer,
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer/tax_ids/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxId.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes an existing `tax_id` object.
  Future<DeletedTaxId> delete({
    required String customer,
    required String id,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer/tax_ids/$id');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedTaxId.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1CustomersCustomer {
  StripeApiClientV1CustomersCustomer({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1CustomersCustomerBalanceTransactions
  get balanceTransactions =>
      StripeApiClientV1CustomersCustomerBalanceTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomerCashBalance get cashBalance =>
      StripeApiClientV1CustomersCustomerCashBalance(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomerCashBalanceTransactions
  get cashBalanceTransactions =>
      StripeApiClientV1CustomersCustomerCashBalanceTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomerDiscount get discount =>
      StripeApiClientV1CustomersCustomerDiscount(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomerFundingInstructions
  get fundingInstructions =>
      StripeApiClientV1CustomersCustomerFundingInstructions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomerPaymentMethods get paymentMethods =>
      StripeApiClientV1CustomersCustomerPaymentMethods(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomerSources get sources =>
      StripeApiClientV1CustomersCustomerSources(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomerTaxIds get taxIds =>
      StripeApiClientV1CustomersCustomerTaxIds(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Customers {
  StripeApiClientV1Customers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.
  Future<GetCustomersResponse> list({
    Created_created? created,
    String? email,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    String? testClock,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (email != null) {
      $queryParameters['email'] = email;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (testClock != null) {
      $queryParameters['test_clock'] = testClock;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new customer object.
  Future<Customer> create({PostCustomersBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/customers');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Customer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a Customer object.
  Future<GetCustomersCustomerResponse> retrieve({
    required String customer,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/customers/$customer',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetCustomersCustomerResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged. For example, if you pass the **source** parameter, that becomes the customer’s active source (e.g., a card) to be used for all charges in the future. When you update a customer to a new valid card source by passing the **source** parameter: for each of the customer’s current subscriptions, if the subscription bills automatically and is in the `past_due` state, then the latest open invoice for the subscription with automatic collection enabled will be retried. This retry will not count as an automatic retry, and will not affect the next regularly scheduled payment for the invoice. Changing the **default_source** for a customer will not trigger this behavior.
  ///
  /// This request accepts mostly the same arguments as the customer creation call.
  Future<Customer> update({
    required String customer,
    PostCustomersCustomerBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Customer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.
  Future<DeletedCustomer> delete({required String customer}) async {
    final $uri = Uri.parse('$_baseUri/v1/customers/$customer');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedCustomer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1CustomersSearch get search =>
      StripeApiClientV1CustomersSearch(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CustomersCustomer get customer =>
      StripeApiClientV1CustomersCustomer(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1DisputesDisputeClose {
  StripeApiClientV1DisputesDisputeClose({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Closing the dispute for a charge indicates that you do not have any evidence to submit and are essentially dismissing the dispute, acknowledging it as lost.
  ///
  /// The status of the dispute will change from `needs_response` to `lost`. _Closing a dispute is irreversible_.
  Future<Dispute> close({
    required String dispute,
    PostDisputesDisputeCloseBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/disputes/$dispute/close');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Dispute.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1DisputesDispute {
  StripeApiClientV1DisputesDispute({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1DisputesDisputeClose get close =>
      StripeApiClientV1DisputesDisputeClose(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Disputes {
  StripeApiClientV1Disputes({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your disputes.
  Future<GetDisputesResponse> list({
    String? charge,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? paymentIntent,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (charge != null) {
      $queryParameters['charge'] = charge;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (paymentIntent != null) {
      $queryParameters['payment_intent'] = paymentIntent;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/disputes',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetDisputesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the dispute with the given ID.
  Future<Dispute> retrieve({
    required String dispute,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/disputes/$dispute',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Dispute.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// When you get a dispute, contacting your customer is always the best first step. If that doesn’t work, you can submit evidence to help us resolve the dispute in your favor. You can do this in your [dashboard](https://dashboard.stripe.com/disputes), but if you prefer, you can use the API to submit evidence programmatically.
  ///
  /// Depending on your dispute type, different evidence fields will give you a better chance of winning your dispute. To figure out which evidence fields to provide, see our [guide to dispute types](/docs/disputes/categories).
  Future<Dispute> update({
    required String dispute,
    PostDisputesDisputeBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/disputes/$dispute');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Dispute.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1DisputesDispute get dispute =>
      StripeApiClientV1DisputesDispute(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1EphemeralKeys {
  StripeApiClientV1EphemeralKeys({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a short-lived API key for a given resource.
  Future<EphemeralKey> create({PostEphemeralKeysBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/ephemeral_keys');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return EphemeralKey.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Invalidates a short-lived API key for a given resource.
  Future<EphemeralKey> delete({
    required String key,
    DeleteEphemeralKeysKeyBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/ephemeral_keys/$key');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return EphemeralKey.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Events {
  StripeApiClientV1Events({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List events, going back up to 30 days. Each event data is rendered according to Stripe API version at its creation time, specified in [event object](/docs/api/events/object) `api_version` attribute (not according to your current Stripe API version or `Stripe-Version` header).
  Future<GetEventsResponse> list({
    Created_created? created,
    bool? deliverySuccess,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    String? type,
    List<String>? types,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (deliverySuccess != null) {
      $queryParameters['delivery_success'] = deliverySuccess.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type;
    }
    if (types != null) {
      $queryParameters['types'] = types;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/events',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetEventsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an event. Supply the unique identifier of the event, which you might have received in a webhook.
  Future<Event> retrieve({required String id, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/events/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Event.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ExchangeRates {
  StripeApiClientV1ExchangeRates({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of objects that contain the rates at which foreign currencies are converted to one another. Only shows the currencies for which Stripe supports.
  Future<GetExchangeRatesResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/exchange_rates',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetExchangeRatesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the exchange rates from the given currency to every supported currency.
  Future<ExchangeRate> retrieve({
    required String rateId,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/exchange_rates/$rateId',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ExchangeRate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FileLinks {
  StripeApiClientV1FileLinks({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of file links.
  Future<GetFileLinksResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    bool? expired,
    String? file,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (expired != null) {
      $queryParameters['expired'] = expired.toString();
    }
    if (file != null) {
      $queryParameters['file'] = file;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/file_links',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetFileLinksResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new file link object.
  Future<FileLink> create({required PostFileLinksBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/file_links');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FileLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the file link with the given ID.
  Future<FileLink> retrieve({
    required String link,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/file_links/$link',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FileLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing file link object. Expired links can no longer be updated.
  Future<FileLink> update({
    required String link,
    PostFileLinksLinkBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/file_links/$link');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FileLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Files {
  StripeApiClientV1Files({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of the files that your account has access to. Stripe sorts and returns the files by their creation dates, placing the most recently created files at the top.
  Future<GetFilesResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    Purpose_purpose? purpose,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (purpose != null) {
      $queryParameters['purpose'] = purpose.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/files',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetFilesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// To upload a file to Stripe, you need to send a request of type `multipart/form-data`. Include the file you want to upload in the request, and the parameters for creating a file.
  ///
  /// All of Stripe’s officially supported Client libraries support sending `multipart/form-data`.
  Future<File> create({required PostFilesBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/files');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return File.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing file object. After you supply a unique file ID, Stripe returns the corresponding file object. Learn how to [access file contents](/docs/file-upload#download-file-contents).
  Future<File> retrieve({required String file, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/files/$file',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return File.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnectionsAccountsAccountDisconnect {
  StripeApiClientV1FinancialConnectionsAccountsAccountDisconnect({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Disables your access to a Financial Connections `Account`. You will no longer be able to access data associated with the account (e.g. balances, transactions).
  Future<FinancialConnectionsAccount> disconnect({
    required String account,
    PostFinancialConnectionsAccountsAccountDisconnectBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/accounts/$account/disconnect',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnectionsAccountsAccountOwners {
  StripeApiClientV1FinancialConnectionsAccountsAccountOwners({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists all owners for a given `Account`
  Future<GetFinancialConnectionsAccountsAccountOwnersResponse> list_owners({
    required String account,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    required String ownership,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    $queryParameters['ownership'] = ownership;
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/accounts/$account/owners',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetFinancialConnectionsAccountsAccountOwnersResponse.fromJson(
          $json,
        );

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnectionsAccountsAccountRefresh {
  StripeApiClientV1FinancialConnectionsAccountsAccountRefresh({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Refreshes the data associated with a Financial Connections `Account`.
  Future<FinancialConnectionsAccount> refresh({
    required String account,
    required PostFinancialConnectionsAccountsAccountRefreshBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/accounts/$account/refresh',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnectionsAccountsAccountSubscribe {
  StripeApiClientV1FinancialConnectionsAccountsAccountSubscribe({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Subscribes to periodic refreshes of data associated with a Financial Connections `Account`.
  Future<FinancialConnectionsAccount> subscribe({
    required String account,
    required PostFinancialConnectionsAccountsAccountSubscribeBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/accounts/$account/subscribe',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnectionsAccountsAccountUnsubscribe {
  StripeApiClientV1FinancialConnectionsAccountsAccountUnsubscribe({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Unsubscribes from periodic refreshes of data associated with a Financial Connections `Account`.
  Future<FinancialConnectionsAccount> unsubscribe({
    required String account,
    required PostFinancialConnectionsAccountsAccountUnsubscribeBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/accounts/$account/unsubscribe',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnectionsAccountsAccount {
  StripeApiClientV1FinancialConnectionsAccountsAccount({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1FinancialConnectionsAccountsAccountDisconnect
  get disconnect =>
      StripeApiClientV1FinancialConnectionsAccountsAccountDisconnect(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1FinancialConnectionsAccountsAccountOwners get owners =>
      StripeApiClientV1FinancialConnectionsAccountsAccountOwners(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1FinancialConnectionsAccountsAccountRefresh get refresh =>
      StripeApiClientV1FinancialConnectionsAccountsAccountRefresh(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1FinancialConnectionsAccountsAccountSubscribe get subscribe =>
      StripeApiClientV1FinancialConnectionsAccountsAccountSubscribe(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1FinancialConnectionsAccountsAccountUnsubscribe
  get unsubscribe =>
      StripeApiClientV1FinancialConnectionsAccountsAccountUnsubscribe(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1FinancialConnectionsAccounts {
  StripeApiClientV1FinancialConnectionsAccounts({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Financial Connections `Account` objects.
  Future<GetFinancialConnectionsAccountsResponse> list({
    AccountHolder_accountHolder? accountHolder,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? session,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (accountHolder != null) {
      $queryParameters['account_holder'] = accountHolder.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (session != null) {
      $queryParameters['session'] = session;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/accounts',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetFinancialConnectionsAccountsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an Financial Connections `Account`.
  Future<FinancialConnectionsAccount> retrieve({
    required String account,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/accounts/$account',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1FinancialConnectionsAccountsAccount get account =>
      StripeApiClientV1FinancialConnectionsAccountsAccount(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1FinancialConnectionsSessions {
  StripeApiClientV1FinancialConnectionsSessions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// To launch the Financial Connections authorization flow, create a `Session`. The session’s `client_secret` can be used to launch the flow using Stripe.js.
  Future<FinancialConnectionsSession> create({
    required PostFinancialConnectionsSessionsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/financial_connections/sessions');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a Financial Connections `Session`
  Future<FinancialConnectionsSession> retrieve({
    required String session,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/sessions/$session',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnectionsTransactions {
  StripeApiClientV1FinancialConnectionsTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Financial Connections `Transaction` objects.
  Future<GetFinancialConnectionsTransactionsResponse> list({
    required String account,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    TransactedAt_transactedAt? transactedAt,
    TransactionRefresh_transactionRefresh? transactionRefresh,
  }) async {
    final $queryParameters = <String, Object>{};
    $queryParameters['account'] = account;
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (transactedAt != null) {
      $queryParameters['transacted_at'] = transactedAt.toString();
    }
    if (transactionRefresh != null) {
      $queryParameters['transaction_refresh'] = transactionRefresh.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/transactions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetFinancialConnectionsTransactionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a Financial Connections `Transaction`
  Future<FinancialConnectionsTransaction> retrieve({
    required String transaction,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/financial_connections/transactions/$transaction',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return FinancialConnectionsTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1FinancialConnections {
  StripeApiClientV1FinancialConnections({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1FinancialConnectionsAccounts get accounts =>
      StripeApiClientV1FinancialConnectionsAccounts(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1FinancialConnectionsSessions get sessions =>
      StripeApiClientV1FinancialConnectionsSessions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1FinancialConnectionsTransactions get transactions =>
      StripeApiClientV1FinancialConnectionsTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ForwardingRequests {
  StripeApiClientV1ForwardingRequests({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists all ForwardingRequest objects.
  Future<GetForwardingRequestsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/forwarding/requests',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetForwardingRequestsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a ForwardingRequest object.
  Future<ForwardingRequest> create({
    required PostForwardingRequestsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/forwarding/requests');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ForwardingRequest.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a ForwardingRequest object.
  Future<ForwardingRequest> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/forwarding/requests/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ForwardingRequest.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Forwarding {
  StripeApiClientV1Forwarding({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ForwardingRequests get requests =>
      StripeApiClientV1ForwardingRequests(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1IdentityVerificationReports {
  StripeApiClientV1IdentityVerificationReports({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List all verification reports.
  Future<GetIdentityVerificationReportsResponse> list({
    String? clientReferenceId,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Type_type? type,
    String? verificationSession,
  }) async {
    final $queryParameters = <String, Object>{};
    if (clientReferenceId != null) {
      $queryParameters['client_reference_id'] = clientReferenceId;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    if (verificationSession != null) {
      $queryParameters['verification_session'] = verificationSession;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/identity/verification_reports',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIdentityVerificationReportsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an existing VerificationReport
  Future<IdentityVerificationReport> retrieve({
    required String report,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/identity/verification_reports/$report',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IdentityVerificationReport.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IdentityVerificationSessionsSessionCancel {
  StripeApiClientV1IdentityVerificationSessionsSessionCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// A VerificationSession object can be canceled when it is in `requires_input` [status](/docs/identity/how-sessions-work).
  ///
  /// Once canceled, future submission attempts are disabled. This cannot be undone. [Learn more](/docs/identity/verification-sessions#cancel).
  Future<IdentityVerificationSession> cancel({
    required String session,
    PostIdentityVerificationSessionsSessionCancelBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/identity/verification_sessions/$session/cancel',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IdentityVerificationSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IdentityVerificationSessionsSessionRedact {
  StripeApiClientV1IdentityVerificationSessionsSessionRedact({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Redact a VerificationSession to remove all collected information from Stripe. This will redact the VerificationSession and all objects related to it, including VerificationReports, Events, request logs, etc.
  ///
  /// A VerificationSession object can be redacted when it is in `requires_input` or `verified` [status](/docs/identity/how-sessions-work). Redacting a VerificationSession in `requires_action` state will automatically cancel it.
  ///
  /// The redaction process may take up to four days. When the redaction process is in progress, the VerificationSession’s `redaction.status` field will be set to `processing`; when the process is finished, it will change to `redacted` and an `identity.verification_session.redacted` event will be emitted.
  ///
  /// Redaction is irreversible. Redacted objects are still accessible in the Stripe API, but all the fields that contain personal data will be replaced by the string `\[redacted\]` or a similar placeholder. The `metadata` field will also be erased. Redacted objects cannot be updated or used for any purpose.
  ///
  /// [Learn more](/docs/identity/verification-sessions#redact).
  Future<IdentityVerificationSession> redact({
    required String session,
    PostIdentityVerificationSessionsSessionRedactBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/identity/verification_sessions/$session/redact',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IdentityVerificationSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IdentityVerificationSessionsSession {
  StripeApiClientV1IdentityVerificationSessionsSession({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1IdentityVerificationSessionsSessionCancel get cancel =>
      StripeApiClientV1IdentityVerificationSessionsSessionCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IdentityVerificationSessionsSessionRedact get redact =>
      StripeApiClientV1IdentityVerificationSessionsSessionRedact(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1IdentityVerificationSessions {
  StripeApiClientV1IdentityVerificationSessions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of VerificationSessions
  Future<GetIdentityVerificationSessionsResponse> list({
    String? clientReferenceId,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (clientReferenceId != null) {
      $queryParameters['client_reference_id'] = clientReferenceId;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/identity/verification_sessions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIdentityVerificationSessionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a VerificationSession object.
  ///
  /// After the VerificationSession is created, display a verification modal using the session `client_secret` or send your users to the session’s `url`.
  ///
  /// If your API key is in test mode, verification checks won’t actually process, though everything else will occur as if in live mode.
  ///
  /// Related guide: [Verify your users’ identity documents](/docs/identity/verify-identity-documents)
  Future<IdentityVerificationSession> create({
    required PostIdentityVerificationSessionsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/identity/verification_sessions');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IdentityVerificationSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a VerificationSession that was previously created.
  ///
  /// When the session status is `requires_input`, you can use this method to retrieve a valid `client_secret` or `url` to allow re-submission.
  Future<IdentityVerificationSession> retrieve({
    required String session,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/identity/verification_sessions/$session',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IdentityVerificationSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a VerificationSession object.
  ///
  /// When the session status is `requires_input`, you can use this method to update the verification check and options.
  Future<IdentityVerificationSession> update({
    required String session,
    PostIdentityVerificationSessionsSessionBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/identity/verification_sessions/$session',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IdentityVerificationSession.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1IdentityVerificationSessionsSession get session =>
      StripeApiClientV1IdentityVerificationSessionsSession(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Identity {
  StripeApiClientV1Identity({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1IdentityVerificationReports get verificationReports =>
      StripeApiClientV1IdentityVerificationReports(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IdentityVerificationSessions get verificationSessions =>
      StripeApiClientV1IdentityVerificationSessions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Invoiceitems {
  StripeApiClientV1Invoiceitems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your invoice items. Invoice items are returned sorted by creation date, with the most recently created invoice items appearing first.
  Future<GetInvoiceitemsResponse> list({
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    String? invoice,
    int? limit,
    bool? pending,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (invoice != null) {
      $queryParameters['invoice'] = invoice;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (pending != null) {
      $queryParameters['pending'] = pending.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/invoiceitems',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetInvoiceitemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates an item to be added to a draft invoice (up to 250 items per invoice). If no invoice is specified, the item will be on the next invoice created for the customer specified.
  Future<Invoiceitem> create({required PostInvoiceitemsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/invoiceitems');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoiceitem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the invoice item with the given ID.
  Future<Invoiceitem> retrieve({
    required String invoiceitem,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/invoiceitems/$invoiceitem',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoiceitem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the amount or description of an invoice item on an upcoming invoice. Updating an invoice item is only possible before the invoice it’s attached to is closed.
  Future<Invoiceitem> update({
    required String invoiceitem,
    PostInvoiceitemsInvoiceitemBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoiceitems/$invoiceitem');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoiceitem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes an invoice item, removing it from an invoice. Deleting invoice items is only possible when they’re not attached to invoices, or if it’s attached to a draft invoice.
  Future<DeletedInvoiceitem> delete({required String invoiceitem}) async {
    final $uri = Uri.parse('$_baseUri/v1/invoiceitems/$invoiceitem');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedInvoiceitem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesSearch {
  StripeApiClientV1InvoicesSearch({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Search for invoices you’ve previously created using Stripe’s [Search Query Language](/docs/search#search-query-language). Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up to an hour behind during outages. Search functionality is not available to merchants in India.
  Future<GetInvoicesSearchResponse> search({
    List<String>? expand,
    int? limit,
    String? page,
    required String query,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      $queryParameters['page'] = page;
    }
    $queryParameters['query'] = query;
    final $uri = Uri.parse(
      '$_baseUri/v1/invoices/search',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetInvoicesSearchResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesUpcomingLines {
  StripeApiClientV1InvoicesUpcomingLines({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving an upcoming invoice, you’ll get a **lines** property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  Future<GetInvoicesUpcomingLinesResponse> upcomingLines({
    AutomaticTax_automaticTax? automaticTax,
    String? coupon,
    String? currency,
    String? customer,
    CustomerDetails_customerDetails? customerDetails,
    List<Discounts_discountsItem>? discounts,
    String? endingBefore,
    List<String>? expand,
    List<InvoiceItems_invoiceItemsItem>? invoiceItems,
    Issuer_issuer? issuer,
    int? limit,
    String? onBehalfOf,
    String? schedule,
    String? startingAfter,
    String? subscription,
    SubscriptionBillingCycleAnchor_subscriptionBillingCycleAnchor?
    subscriptionBillingCycleAnchor,
    DateTime? subscriptionCancelAt,
    bool? subscriptionCancelAtPeriodEnd,
    bool? subscriptionCancelNow,
    List<String>? subscriptionDefaultTaxRates,
    List<SubscriptionItems_subscriptionItemsItem>? subscriptionItems,
    SubscriptionProrationBehavior_subscriptionProrationBehavior?
    subscriptionProrationBehavior,
    DateTime? subscriptionProrationDate,
    String? subscriptionResumeAt,
    DateTime? subscriptionStartDate,
    SubscriptionTrialEnd_subscriptionTrialEnd? subscriptionTrialEnd,
    bool? subscriptionTrialFromPlan,
  }) async {
    final $queryParameters = <String, Object>{};
    if (automaticTax != null) {
      $queryParameters['automatic_tax'] = automaticTax.toString();
    }
    if (coupon != null) {
      $queryParameters['coupon'] = coupon;
    }
    if (currency != null) {
      $queryParameters['currency'] = currency;
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (customerDetails != null) {
      $queryParameters['customer_details'] = customerDetails.toString();
    }
    $queryParameters['discounts'] = discounts ?? '';
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (invoiceItems != null) {
      $queryParameters['invoice_items'] = invoiceItems;
    }
    if (issuer != null) {
      $queryParameters['issuer'] = issuer.toString();
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    $queryParameters['on_behalf_of'] = onBehalfOf ?? '';
    if (schedule != null) {
      $queryParameters['schedule'] = schedule;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (subscription != null) {
      $queryParameters['subscription'] = subscription;
    }
    if (subscriptionBillingCycleAnchor != null) {
      $queryParameters['subscription_billing_cycle_anchor'] =
          subscriptionBillingCycleAnchor.toString();
    }
    $queryParameters['subscription_cancel_at'] =
        subscriptionCancelAt?.millisecondsSinceEpoch.toString() ?? '';
    if (subscriptionCancelAtPeriodEnd != null) {
      $queryParameters['subscription_cancel_at_period_end'] =
          subscriptionCancelAtPeriodEnd.toString();
    }
    if (subscriptionCancelNow != null) {
      $queryParameters['subscription_cancel_now'] =
          subscriptionCancelNow.toString();
    }
    $queryParameters['subscription_default_tax_rates'] =
        subscriptionDefaultTaxRates ?? '';
    if (subscriptionItems != null) {
      $queryParameters['subscription_items'] = subscriptionItems;
    }
    if (subscriptionProrationBehavior != null) {
      $queryParameters['subscription_proration_behavior'] =
          subscriptionProrationBehavior.toString();
    }
    if (subscriptionProrationDate != null) {
      $queryParameters['subscription_proration_date'] =
          subscriptionProrationDate.millisecondsSinceEpoch.toString();
    }
    if (subscriptionResumeAt != null) {
      $queryParameters['subscription_resume_at'] = r'now';
    }
    if (subscriptionStartDate != null) {
      $queryParameters['subscription_start_date'] =
          subscriptionStartDate.millisecondsSinceEpoch.toString();
    }
    if (subscriptionTrialEnd != null) {
      $queryParameters['subscription_trial_end'] =
          subscriptionTrialEnd.toString();
    }
    if (subscriptionTrialFromPlan != null) {
      $queryParameters['subscription_trial_from_plan'] =
          subscriptionTrialFromPlan.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/invoices/upcoming/lines',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetInvoicesUpcomingLinesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesUpcoming {
  StripeApiClientV1InvoicesUpcoming({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// At any time, you can preview the upcoming invoice for a customer. This will show you all the charges that are pending, including subscription renewal charges, invoice item charges, etc. It will also show you any discounts that are applicable to the invoice.
  ///
  /// Note that when you are viewing an upcoming invoice, you are simply viewing a preview – the invoice has not yet been created. As such, the upcoming invoice will not show up in invoice listing calls, and you cannot use the API to pay or edit the invoice. If you want to change the amount that your customer will be billed, you can add, remove, or update pending invoice items, or update the customer’s discount.
  ///
  /// You can preview the effects of updating a subscription, including a preview of what proration will take place. To ensure that the actual proration is calculated exactly the same as the previewed proration, you should pass a `proration_date` parameter when doing the actual subscription update. The value passed in should be the same as the `subscription\_proration\_date` returned on the upcoming invoice resource. The recommended way to get only the prorations being previewed is to consider only proration line items where `period\[start\]` is equal to the `subscription\_proration\_date` on the upcoming invoice resource.
  Future<Invoice> upcoming({
    AutomaticTax_automaticTax? automaticTax,
    String? coupon,
    String? currency,
    String? customer,
    CustomerDetails_customerDetails? customerDetails,
    List<Discounts_discountsItem>? discounts,
    List<String>? expand,
    List<InvoiceItems_invoiceItemsItem>? invoiceItems,
    Issuer_issuer? issuer,
    String? onBehalfOf,
    String? schedule,
    String? subscription,
    SubscriptionBillingCycleAnchor_subscriptionBillingCycleAnchor?
    subscriptionBillingCycleAnchor,
    DateTime? subscriptionCancelAt,
    bool? subscriptionCancelAtPeriodEnd,
    bool? subscriptionCancelNow,
    List<String>? subscriptionDefaultTaxRates,
    List<SubscriptionItems_subscriptionItemsItem>? subscriptionItems,
    SubscriptionProrationBehavior_subscriptionProrationBehavior?
    subscriptionProrationBehavior,
    DateTime? subscriptionProrationDate,
    String? subscriptionResumeAt,
    DateTime? subscriptionStartDate,
    SubscriptionTrialEnd_subscriptionTrialEnd? subscriptionTrialEnd,
    bool? subscriptionTrialFromPlan,
  }) async {
    final $queryParameters = <String, Object>{};
    if (automaticTax != null) {
      $queryParameters['automatic_tax'] = automaticTax.toString();
    }
    if (coupon != null) {
      $queryParameters['coupon'] = coupon;
    }
    if (currency != null) {
      $queryParameters['currency'] = currency;
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (customerDetails != null) {
      $queryParameters['customer_details'] = customerDetails.toString();
    }
    $queryParameters['discounts'] = discounts ?? '';
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (invoiceItems != null) {
      $queryParameters['invoice_items'] = invoiceItems;
    }
    if (issuer != null) {
      $queryParameters['issuer'] = issuer.toString();
    }
    $queryParameters['on_behalf_of'] = onBehalfOf ?? '';
    if (schedule != null) {
      $queryParameters['schedule'] = schedule;
    }
    if (subscription != null) {
      $queryParameters['subscription'] = subscription;
    }
    if (subscriptionBillingCycleAnchor != null) {
      $queryParameters['subscription_billing_cycle_anchor'] =
          subscriptionBillingCycleAnchor.toString();
    }
    $queryParameters['subscription_cancel_at'] =
        subscriptionCancelAt?.millisecondsSinceEpoch.toString() ?? '';
    if (subscriptionCancelAtPeriodEnd != null) {
      $queryParameters['subscription_cancel_at_period_end'] =
          subscriptionCancelAtPeriodEnd.toString();
    }
    if (subscriptionCancelNow != null) {
      $queryParameters['subscription_cancel_now'] =
          subscriptionCancelNow.toString();
    }
    $queryParameters['subscription_default_tax_rates'] =
        subscriptionDefaultTaxRates ?? '';
    if (subscriptionItems != null) {
      $queryParameters['subscription_items'] = subscriptionItems;
    }
    if (subscriptionProrationBehavior != null) {
      $queryParameters['subscription_proration_behavior'] =
          subscriptionProrationBehavior.toString();
    }
    if (subscriptionProrationDate != null) {
      $queryParameters['subscription_proration_date'] =
          subscriptionProrationDate.millisecondsSinceEpoch.toString();
    }
    if (subscriptionResumeAt != null) {
      $queryParameters['subscription_resume_at'] = r'now';
    }
    if (subscriptionStartDate != null) {
      $queryParameters['subscription_start_date'] =
          subscriptionStartDate.millisecondsSinceEpoch.toString();
    }
    if (subscriptionTrialEnd != null) {
      $queryParameters['subscription_trial_end'] =
          subscriptionTrialEnd.toString();
    }
    if (subscriptionTrialFromPlan != null) {
      $queryParameters['subscription_trial_from_plan'] =
          subscriptionTrialFromPlan.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/invoices/upcoming',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1InvoicesUpcomingLines get lines =>
      StripeApiClientV1InvoicesUpcomingLines(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1InvoicesInvoiceFinalize {
  StripeApiClientV1InvoicesInvoiceFinalize({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Stripe automatically finalizes drafts before sending and attempting payment on invoices. However, if you’d like to finalize a draft invoice manually, you can do so using this method.
  Future<Invoice> finalize_invoice({
    required String invoice,
    PostInvoicesInvoiceFinalizeBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice/finalize');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesInvoiceLines {
  StripeApiClientV1InvoicesInvoiceLines({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving an invoice, you’ll get a **lines** property containing the total count of line items and the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  Future<GetInvoicesInvoiceLinesResponse> list({
    required String invoice,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/invoices/$invoice/lines',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetInvoicesInvoiceLinesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an invoice’s line item. Some fields, such as `tax_amounts`, only live on the invoice line item, so they can only be updated through this endpoint. Other fields, such as `amount`, live on both the invoice item and the invoice line item, so updates on this endpoint will propagate to the invoice item as well. Updating an invoice’s line item is only possible before the invoice is finalized.
  Future<LineItem> update({
    required String invoice,
    required String lineItemId,
    PostInvoicesInvoiceLinesLineItemIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice/lines/$lineItemId');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return LineItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesInvoiceMarkUncollectible {
  StripeApiClientV1InvoicesInvoiceMarkUncollectible({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Marking an invoice as uncollectible is useful for keeping track of bad debts that can be written off for accounting purposes.
  Future<Invoice> mark_uncollectible({
    required String invoice,
    PostInvoicesInvoiceMarkUncollectibleBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice/mark_uncollectible');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesInvoicePay {
  StripeApiClientV1InvoicesInvoicePay({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Stripe automatically creates and then attempts to collect payment on invoices for customers on subscriptions according to your [subscriptions settings](https://dashboard.stripe.com/account/billing/automatic). However, if you’d like to attempt payment on an invoice out of the normal collection schedule or for some other reason, you can do so.
  Future<Invoice> pay({
    required String invoice,
    PostInvoicesInvoicePayBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice/pay');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesInvoiceSend {
  StripeApiClientV1InvoicesInvoiceSend({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Stripe will automatically send invoices to customers according to your [subscriptions settings](https://dashboard.stripe.com/account/billing/automatic). However, if you’d like to manually send an invoice to your customer out of the normal schedule, you can do so. When sending invoices that have already been paid, there will be no reference to the payment in the email.
  ///
  /// Requests made in test-mode result in no emails being sent, despite sending an `invoice.sent` event.
  Future<Invoice> send_invoice({
    required String invoice,
    PostInvoicesInvoiceSendBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice/send');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesInvoiceVoid {
  StripeApiClientV1InvoicesInvoiceVoid({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Mark a finalized invoice as void. This cannot be undone. Voiding an invoice is similar to [deletion](#delete_invoice), however it only applies to finalized invoices and maintains a papertrail where the invoice can still be found.
  ///
  /// Consult with local regulations to determine whether and how an invoice might be amended, canceled, or voided in the jurisdiction you’re doing business in. You might need to [issue another invoice](#create_invoice) or [credit note](#create_credit_note) instead. Stripe recommends that you consult with your legal counsel for advice specific to your business.
  Future<Invoice> void_invoice({
    required String invoice,
    PostInvoicesInvoiceVoidBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice/void');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1InvoicesInvoice {
  StripeApiClientV1InvoicesInvoice({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1InvoicesInvoiceFinalize get finalize =>
      StripeApiClientV1InvoicesInvoiceFinalize(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1InvoicesInvoiceLines get lines =>
      StripeApiClientV1InvoicesInvoiceLines(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1InvoicesInvoiceMarkUncollectible get markUncollectible =>
      StripeApiClientV1InvoicesInvoiceMarkUncollectible(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1InvoicesInvoicePay get pay =>
      StripeApiClientV1InvoicesInvoicePay(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1InvoicesInvoiceSend get send =>
      StripeApiClientV1InvoicesInvoiceSend(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1InvoicesInvoiceVoid get void_ =>
      StripeApiClientV1InvoicesInvoiceVoid(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Invoices {
  StripeApiClientV1Invoices({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// You can list all invoices, or list the invoices for a specific customer. The invoices are returned sorted by creation date, with the most recently created invoices appearing first.
  Future<GetInvoicesResponse> list({
    CollectionMethod_collectionMethod? collectionMethod,
    Created_created? created,
    String? customer,
    DueDate_dueDate? dueDate,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
    String? subscription,
  }) async {
    final $queryParameters = <String, Object>{};
    if (collectionMethod != null) {
      $queryParameters['collection_method'] = collectionMethod.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (dueDate != null) {
      $queryParameters['due_date'] = dueDate.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (subscription != null) {
      $queryParameters['subscription'] = subscription;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/invoices',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetInvoicesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// This endpoint creates a draft invoice for a given customer. The invoice remains a draft until you [finalize](#finalize_invoice) the invoice, which allows you to [pay](#pay_invoice) or [send](#send_invoice) the invoice to your customers.
  Future<Invoice> create({PostInvoicesBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the invoice with the given ID.
  Future<Invoice> retrieve({
    required String invoice,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/invoices/$invoice',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Draft invoices are fully editable. Once an invoice is [finalized](/docs/billing/invoices/workflow#finalized), monetary values, as well as `collection_method`, become uneditable.
  ///
  /// If you would like to stop the Stripe Billing engine from automatically finalizing, reattempting payments on, sending reminders for, or [automatically reconciling](/docs/billing/invoices/reconciliation) invoices, pass `auto_advance=false`.
  Future<Invoice> update({
    required String invoice,
    PostInvoicesInvoiceBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Invoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Permanently deletes a one-off invoice draft. This cannot be undone. Attempts to delete invoices that are no longer in a draft state will fail; once an invoice has been finalized or if an invoice is for a subscription, it must be [voided](#void_invoice).
  Future<DeletedInvoice> delete({required String invoice}) async {
    final $uri = Uri.parse('$_baseUri/v1/invoices/$invoice');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedInvoice.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1InvoicesSearch get search => StripeApiClientV1InvoicesSearch(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );

  StripeApiClientV1InvoicesUpcoming get upcoming =>
      StripeApiClientV1InvoicesUpcoming(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1InvoicesInvoice get invoice =>
      StripeApiClientV1InvoicesInvoice(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1IssuingAuthorizationsAuthorizationApprove {
  StripeApiClientV1IssuingAuthorizationsAuthorizationApprove({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// \[Deprecated\] Approves a pending Issuing `Authorization` object. This request should be made within the timeout window of the [real-time authorization](/docs/issuing/controls/real-time-authorizations) flow. This method is deprecated. Instead, [respond directly to the webhook request to approve an authorization](/docs/issuing/controls/real-time-authorizations#authorization-handling).
  @deprecated
  Future<IssuingAuthorization> approve({
    required String authorization,
    PostIssuingAuthorizationsAuthorizationApproveBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/authorizations/$authorization/approve',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingAuthorizationsAuthorizationDecline {
  StripeApiClientV1IssuingAuthorizationsAuthorizationDecline({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// \[Deprecated\] Declines a pending Issuing `Authorization` object. This request should be made within the timeout window of the [real time authorization](/docs/issuing/controls/real-time-authorizations) flow. This method is deprecated. Instead, [respond directly to the webhook request to decline an authorization](/docs/issuing/controls/real-time-authorizations#authorization-handling).
  @deprecated
  Future<IssuingAuthorization> decline({
    required String authorization,
    PostIssuingAuthorizationsAuthorizationDeclineBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/authorizations/$authorization/decline',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingAuthorizationsAuthorization {
  StripeApiClientV1IssuingAuthorizationsAuthorization({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1IssuingAuthorizationsAuthorizationApprove get approve =>
      StripeApiClientV1IssuingAuthorizationsAuthorizationApprove(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IssuingAuthorizationsAuthorizationDecline get decline =>
      StripeApiClientV1IssuingAuthorizationsAuthorizationDecline(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1IssuingAuthorizations {
  StripeApiClientV1IssuingAuthorizations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Issuing `Authorization` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetIssuingAuthorizationsResponse> list({
    String? card,
    String? cardholder,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (card != null) {
      $queryParameters['card'] = card;
    }
    if (cardholder != null) {
      $queryParameters['cardholder'] = cardholder;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/authorizations',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingAuthorizationsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an Issuing `Authorization` object.
  Future<IssuingAuthorization> retrieve({
    required String authorization,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/authorizations/$authorization',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified Issuing `Authorization` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<IssuingAuthorization> update({
    required String authorization,
    PostIssuingAuthorizationsAuthorizationBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/authorizations/$authorization',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1IssuingAuthorizationsAuthorization get authorization =>
      StripeApiClientV1IssuingAuthorizationsAuthorization(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1IssuingCardholders {
  StripeApiClientV1IssuingCardholders({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Issuing `Cardholder` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetIssuingCardholdersResponse> list({
    Created_created? created,
    String? email,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? phoneNumber,
    String? startingAfter,
    Status_status? status,
    Type_type? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (email != null) {
      $queryParameters['email'] = email;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (phoneNumber != null) {
      $queryParameters['phone_number'] = phoneNumber;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/cardholders',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingCardholdersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new Issuing `Cardholder` object that can be issued cards.
  Future<IssuingCardholder> create({
    required PostIssuingCardholdersBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/cardholders');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCardholder.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an Issuing `Cardholder` object.
  Future<IssuingCardholder> retrieve({
    required String cardholder,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/cardholders/$cardholder',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCardholder.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified Issuing `Cardholder` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<IssuingCardholder> update({
    required String cardholder,
    PostIssuingCardholdersCardholderBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/cardholders/$cardholder');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCardholder.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingCards {
  StripeApiClientV1IssuingCards({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Issuing `Card` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetIssuingCardsResponse> list({
    String? cardholder,
    Created_created? created,
    String? endingBefore,
    int? expMonth,
    int? expYear,
    List<String>? expand,
    String? last4,
    int? limit,
    String? personalizationDesign,
    String? startingAfter,
    Status_status? status,
    Type_type? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (cardholder != null) {
      $queryParameters['cardholder'] = cardholder;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expMonth != null) {
      $queryParameters['exp_month'] = expMonth.toString();
    }
    if (expYear != null) {
      $queryParameters['exp_year'] = expYear.toString();
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (last4 != null) {
      $queryParameters['last4'] = last4;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (personalizationDesign != null) {
      $queryParameters['personalization_design'] = personalizationDesign;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/cards',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingCardsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates an Issuing `Card` object.
  Future<IssuingCard> create({required PostIssuingCardsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/cards');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCard.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an Issuing `Card` object.
  Future<IssuingCard> retrieve({
    required String card,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/cards/$card',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCard.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified Issuing `Card` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<IssuingCard> update({
    required String card,
    PostIssuingCardsCardBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/cards/$card');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCard.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingDisputesDisputeSubmit {
  StripeApiClientV1IssuingDisputesDisputeSubmit({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Submits an Issuing `Dispute` to the card network. Stripe validates that all evidence fields required for the dispute’s reason are present. For more details, see [Dispute reasons and evidence](/docs/issuing/purchases/disputes#dispute-reasons-and-evidence).
  Future<IssuingDispute> submit({
    required String dispute,
    PostIssuingDisputesDisputeSubmitBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/disputes/$dispute/submit');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingDispute.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingDisputesDispute {
  StripeApiClientV1IssuingDisputesDispute({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1IssuingDisputesDisputeSubmit get submit =>
      StripeApiClientV1IssuingDisputesDisputeSubmit(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1IssuingDisputes {
  StripeApiClientV1IssuingDisputes({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Issuing `Dispute` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetIssuingDisputesResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
    String? transaction,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (transaction != null) {
      $queryParameters['transaction'] = transaction;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/disputes',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingDisputesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates an Issuing `Dispute` object. Individual pieces of evidence within the `evidence` object are optional at this point. Stripe only validates that required evidence is present during submission. Refer to [Dispute reasons and evidence](/docs/issuing/purchases/disputes#dispute-reasons-and-evidence) for more details about evidence requirements.
  Future<IssuingDispute> create({PostIssuingDisputesBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/disputes');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingDispute.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an Issuing `Dispute` object.
  Future<IssuingDispute> retrieve({
    required String dispute,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/disputes/$dispute',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingDispute.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified Issuing `Dispute` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Properties on the `evidence` object can be unset by passing in an empty string.
  Future<IssuingDispute> update({
    required String dispute,
    PostIssuingDisputesDisputeBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/disputes/$dispute');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingDispute.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1IssuingDisputesDispute get dispute =>
      StripeApiClientV1IssuingDisputesDispute(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1IssuingPersonalizationDesigns {
  StripeApiClientV1IssuingPersonalizationDesigns({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of personalization design objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetIssuingPersonalizationDesignsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    List<String>? lookupKeys,
    Preferences_preferences? preferences,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (lookupKeys != null) {
      $queryParameters['lookup_keys'] = lookupKeys;
    }
    if (preferences != null) {
      $queryParameters['preferences'] = preferences.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/personalization_designs',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingPersonalizationDesignsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a personalization design object.
  Future<IssuingPersonalizationDesign> create({
    required PostIssuingPersonalizationDesignsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/personalization_designs');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingPersonalizationDesign.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a personalization design object.
  Future<IssuingPersonalizationDesign> retrieve({
    required String personalizationDesign,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/personalization_designs/$personalizationDesign',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingPersonalizationDesign.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a card personalization object.
  Future<IssuingPersonalizationDesign> update({
    required String personalizationDesign,
    PostIssuingPersonalizationDesignsPersonalizationDesignBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/personalization_designs/$personalizationDesign',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingPersonalizationDesign.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingPhysicalBundles {
  StripeApiClientV1IssuingPhysicalBundles({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of physical bundle objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetIssuingPhysicalBundlesResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
    Type_type? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/physical_bundles',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingPhysicalBundlesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a physical bundle object.
  Future<IssuingPhysicalBundle> retrieve({
    required String physicalBundle,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/physical_bundles/$physicalBundle',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingPhysicalBundle.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingTokens {
  StripeApiClientV1IssuingTokens({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists all Issuing `Token` objects for a given card.
  Future<GetIssuingTokensResponse> list({
    required String card,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    $queryParameters['card'] = card;
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/tokens',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingTokensResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an Issuing `Token` object.
  Future<IssuingToken> retrieve({
    required String token,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/tokens/$token',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingToken.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Attempts to update the specified Issuing `Token` object to the status specified.
  Future<IssuingToken> update({
    required String token,
    required PostIssuingTokensTokenBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/tokens/$token');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingToken.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1IssuingTransactions {
  StripeApiClientV1IssuingTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Issuing `Transaction` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetIssuingTransactionsResponse> list({
    String? card,
    String? cardholder,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Type_type? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (card != null) {
      $queryParameters['card'] = card;
    }
    if (cardholder != null) {
      $queryParameters['cardholder'] = cardholder;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/transactions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetIssuingTransactionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an Issuing `Transaction` object.
  Future<IssuingTransaction> retrieve({
    required String transaction,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/issuing/transactions/$transaction',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified Issuing `Transaction` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<IssuingTransaction> update({
    required String transaction,
    PostIssuingTransactionsTransactionBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/issuing/transactions/$transaction');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Issuing {
  StripeApiClientV1Issuing({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1IssuingAuthorizations get authorizations =>
      StripeApiClientV1IssuingAuthorizations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IssuingCardholders get cardholders =>
      StripeApiClientV1IssuingCardholders(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IssuingCards get cards =>
      StripeApiClientV1IssuingCards(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1IssuingDisputes get disputes =>
      StripeApiClientV1IssuingDisputes(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IssuingPersonalizationDesigns get personalizationDesigns =>
      StripeApiClientV1IssuingPersonalizationDesigns(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IssuingPhysicalBundles get physicalBundles =>
      StripeApiClientV1IssuingPhysicalBundles(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1IssuingTokens get tokens => StripeApiClientV1IssuingTokens(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );

  StripeApiClientV1IssuingTransactions get transactions =>
      StripeApiClientV1IssuingTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Mandates {
  StripeApiClientV1Mandates({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves a Mandate object.
  Future<Mandate> retrieve({
    required String mandate,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/mandates/$mandate',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Mandate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsSearch {
  StripeApiClientV1PaymentIntentsSearch({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Search for PaymentIntents you’ve previously created using Stripe’s [Search Query Language](/docs/search#search-query-language). Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up to an hour behind during outages. Search functionality is not available to merchants in India.
  Future<GetPaymentIntentsSearchResponse> search({
    List<String>? expand,
    int? limit,
    String? page,
    required String query,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      $queryParameters['page'] = page;
    }
    $queryParameters['query'] = query;
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_intents/search',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPaymentIntentsSearchResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsIntentApplyCustomerBalance {
  StripeApiClientV1PaymentIntentsIntentApplyCustomerBalance({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Manually reconcile the remaining amount for a `customer_balance` PaymentIntent.
  Future<PaymentIntent> apply_customer_balance({
    required String intent,
    PostPaymentIntentsIntentApplyCustomerBalanceBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_intents/$intent/apply_customer_balance',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsIntentCancel {
  StripeApiClientV1PaymentIntentsIntentCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// You can cancel a PaymentIntent object when it’s in one of these statuses: `requires\_payment\_method`, `requires_capture`, `requires_confirmation`, `requires_action` or, [in rare cases](/docs/payments/intents), `processing`.
  ///
  /// After it’s canceled, no additional charges are made by the PaymentIntent and any operations on the PaymentIntent fail with an error. For PaymentIntents with a `status` of `requires_capture`, the remaining `amount_capturable` is automatically refunded.
  ///
  /// You can’t cancel the PaymentIntent for a Checkout Session. [Expire the Checkout Session](/docs/api/checkout/sessions/expire) instead.
  Future<PaymentIntent> cancel({
    required String intent,
    PostPaymentIntentsIntentCancelBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_intents/$intent/cancel');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsIntentCapture {
  StripeApiClientV1PaymentIntentsIntentCapture({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Capture the funds of an existing uncaptured PaymentIntent when its status is `requires_capture`.
  ///
  /// Uncaptured PaymentIntents are cancelled a set number of days (7 by default) after their creation.
  ///
  /// Learn more about [separate authorization and capture](/docs/payments/capture-later).
  Future<PaymentIntent> capture({
    required String intent,
    PostPaymentIntentsIntentCaptureBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_intents/$intent/capture');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsIntentConfirm {
  StripeApiClientV1PaymentIntentsIntentConfirm({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Confirm that your customer intends to pay with current or provided payment method. Upon confirmation, the PaymentIntent will attempt to initiate a payment. If the selected payment method requires additional authentication steps, the PaymentIntent will transition to the `requires_action` status and suggest additional actions via `next_action`. If payment fails, the PaymentIntent transitions to the `requires\_payment\_method` status or the `canceled` status if the confirmation limit is reached. If payment succeeds, the PaymentIntent will transition to the `succeeded` status (or `requires_capture`, if `capture_method` is set to `manual`). If the `confirmation_method` is `automatic`, payment may be attempted using our [client SDKs](/docs/stripe-js/reference#stripe-handle-card-payment) and the PaymentIntent’s [client_secret](#payment_intent_object-client_secret). After `next_action`s are handled by the client, no additional confirmation is required to complete the payment. If the `confirmation_method` is `manual`, all payment attempts must be initiated using a secret key. If any actions are required for the payment, the PaymentIntent will return to the `requires_confirmation` state after those actions are completed. Your server needs to then explicitly re-confirm the PaymentIntent to initiate the next payment attempt.
  Future<PaymentIntent> confirm({
    required String intent,
    PostPaymentIntentsIntentConfirmBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_intents/$intent/confirm');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsIntentIncrementAuthorization {
  StripeApiClientV1PaymentIntentsIntentIncrementAuthorization({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Perform an incremental authorization on an eligible [PaymentIntent](/docs/api/payment_intents/object). To be eligible, the PaymentIntent’s status must be `requires_capture` and [incremental\_authorization\_supported](/docs/api/charges/object#charge_object-payment_method_details-card_present-incremental_authorization_supported) must be `true`.
  ///
  /// Incremental authorizations attempt to increase the authorized amount on your customer’s card to the new, higher `amount` provided. Similar to the initial authorization, incremental authorizations can be declined. A single PaymentIntent can call this endpoint multiple times to further increase the authorized amount.
  ///
  /// If the incremental authorization succeeds, the PaymentIntent object returns with the updated [amount](/docs/api/payment_intents/object#payment_intent_object-amount). If the incremental authorization fails, a [card_declined](/docs/error-codes#card-declined) error returns, and no other fields on the PaymentIntent or Charge update. The PaymentIntent object remains capturable for the previously authorized amount.
  ///
  /// Each PaymentIntent can have a maximum of 10 incremental authorization attempts, including declines. After it’s captured, a PaymentIntent can no longer be incremented.
  ///
  /// Learn more about [incremental authorizations](/docs/terminal/features/incremental-authorizations).
  Future<PaymentIntent> increment_authorization({
    required String intent,
    required PostPaymentIntentsIntentIncrementAuthorizationBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_intents/$intent/increment_authorization',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsIntentVerifyMicrodeposits {
  StripeApiClientV1PaymentIntentsIntentVerifyMicrodeposits({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Verifies microdeposits on a PaymentIntent object.
  Future<PaymentIntent> verify_microdeposits({
    required String intent,
    PostPaymentIntentsIntentVerifyMicrodepositsBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_intents/$intent/verify_microdeposits',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentIntentsIntent {
  StripeApiClientV1PaymentIntentsIntent({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1PaymentIntentsIntentApplyCustomerBalance
  get applyCustomerBalance =>
      StripeApiClientV1PaymentIntentsIntentApplyCustomerBalance(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentIntentsIntentCancel get cancel =>
      StripeApiClientV1PaymentIntentsIntentCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentIntentsIntentCapture get capture =>
      StripeApiClientV1PaymentIntentsIntentCapture(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentIntentsIntentConfirm get confirm =>
      StripeApiClientV1PaymentIntentsIntentConfirm(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentIntentsIntentIncrementAuthorization
  get incrementAuthorization =>
      StripeApiClientV1PaymentIntentsIntentIncrementAuthorization(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentIntentsIntentVerifyMicrodeposits
  get verifyMicrodeposits =>
      StripeApiClientV1PaymentIntentsIntentVerifyMicrodeposits(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PaymentIntents {
  StripeApiClientV1PaymentIntents({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of PaymentIntents.
  Future<GetPaymentIntentsResponse> list({
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_intents',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPaymentIntentsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a PaymentIntent object.
  ///
  /// After the PaymentIntent is created, attach a payment method and [confirm](/docs/api/payment_intents/confirm) to continue the payment. Learn more about [the available payment flows with the Payment Intents API](/docs/payments/payment-intents).
  ///
  /// When you use `confirm=true` during creation, it’s equivalent to creating and confirming the PaymentIntent in the same call. You can use any parameters available in the [confirm API](/docs/api/payment_intents/confirm) when you supply `confirm=true`.
  Future<PaymentIntent> create({required PostPaymentIntentsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_intents');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a PaymentIntent that has previously been created.
  ///
  /// You can retrieve a PaymentIntent client-side using a publishable key when the `client_secret` is in the query string.
  ///
  /// If you retrieve a PaymentIntent with a publishable key, it only returns a subset of properties. Refer to the [payment intent](#payment_intent_object) object reference for more details.
  Future<PaymentIntent> retrieve({
    required String intent,
    String? clientSecret,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (clientSecret != null) {
      $queryParameters['client_secret'] = clientSecret;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_intents/$intent',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates properties on a PaymentIntent object without confirming.
  ///
  /// Depending on which properties you update, you might need to confirm the PaymentIntent again. For example, updating the `payment_method` always requires you to confirm the PaymentIntent again. If you prefer to update and confirm at the same time, we recommend updating properties through the [confirm API](/docs/api/payment_intents/confirm) instead.
  Future<PaymentIntent> update({
    required String intent,
    PostPaymentIntentsIntentBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_intents/$intent');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1PaymentIntentsSearch get search =>
      StripeApiClientV1PaymentIntentsSearch(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentIntentsIntent get intent =>
      StripeApiClientV1PaymentIntentsIntent(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PaymentLinksPaymentLinkLineItems {
  StripeApiClientV1PaymentLinksPaymentLinkLineItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving a payment link, there is an includable **line_items** property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  Future<GetPaymentLinksPaymentLinkLineItemsResponse> list_line_items({
    required String paymentLink,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_links/$paymentLink/line_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPaymentLinksPaymentLinkLineItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentLinksPaymentLink {
  StripeApiClientV1PaymentLinksPaymentLink({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1PaymentLinksPaymentLinkLineItems get lineItems =>
      StripeApiClientV1PaymentLinksPaymentLinkLineItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PaymentLinks {
  StripeApiClientV1PaymentLinks({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your payment links.
  Future<GetPaymentLinksResponse> list({
    bool? active,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_links',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPaymentLinksResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a payment link.
  Future<PaymentLink> create({required PostPaymentLinksBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_links');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieve a payment link.
  Future<PaymentLink> retrieve({
    required String paymentLink,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_links/$paymentLink',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a payment link.
  Future<PaymentLink> update({
    required String paymentLink,
    PostPaymentLinksPaymentLinkBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_links/$paymentLink');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentLink.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1PaymentLinksPaymentLink get paymentLink =>
      StripeApiClientV1PaymentLinksPaymentLink(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PaymentMethodConfigurations {
  StripeApiClientV1PaymentMethodConfigurations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List payment method configurations
  Future<GetPaymentMethodConfigurationsResponse> list({
    String? application,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    $queryParameters['application'] = application ?? '';
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_method_configurations',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPaymentMethodConfigurationsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a payment method configuration
  Future<PaymentMethodConfiguration> create({
    PostPaymentMethodConfigurationsBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_method_configurations');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethodConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieve payment method configuration
  Future<PaymentMethodConfiguration> retrieve({
    required String configuration,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_method_configurations/$configuration',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethodConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Update payment method configuration
  Future<PaymentMethodConfiguration> update({
    required String configuration,
    PostPaymentMethodConfigurationsConfigurationBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_method_configurations/$configuration',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethodConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentMethodDomainsPaymentMethodDomainValidate {
  StripeApiClientV1PaymentMethodDomainsPaymentMethodDomainValidate({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Some payment methods such as Apple Pay require additional steps to verify a domain. If the requirements weren’t satisfied when the domain was created, the payment method will be inactive on the domain. The payment method doesn’t appear in Elements for this domain until it is active.
  ///
  /// To activate a payment method on an existing payment method domain, complete the required validation steps specific to the payment method, and then validate the payment method domain with this endpoint.
  ///
  /// Related guides: [Payment method domains](/docs/payments/payment-methods/pmd-registration).
  Future<PaymentMethodDomain> validate({
    required String paymentMethodDomain,
    PostPaymentMethodDomainsPaymentMethodDomainValidateBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_method_domains/$paymentMethodDomain/validate',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethodDomain.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentMethodDomainsPaymentMethodDomain {
  StripeApiClientV1PaymentMethodDomainsPaymentMethodDomain({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1PaymentMethodDomainsPaymentMethodDomainValidate
  get validate =>
      StripeApiClientV1PaymentMethodDomainsPaymentMethodDomainValidate(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PaymentMethodDomains {
  StripeApiClientV1PaymentMethodDomains({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Lists the details of existing payment method domains.
  Future<GetPaymentMethodDomainsResponse> list({
    String? domainName,
    bool? enabled,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (domainName != null) {
      $queryParameters['domain_name'] = domainName;
    }
    if (enabled != null) {
      $queryParameters['enabled'] = enabled.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_method_domains',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPaymentMethodDomainsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a payment method domain.
  Future<PaymentMethodDomain> create({
    required PostPaymentMethodDomainsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_method_domains');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethodDomain.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing payment method domain.
  Future<PaymentMethodDomain> retrieve({
    required String paymentMethodDomain,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_method_domains/$paymentMethodDomain',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethodDomain.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing payment method domain.
  Future<PaymentMethodDomain> update({
    required String paymentMethodDomain,
    PostPaymentMethodDomainsPaymentMethodDomainBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_method_domains/$paymentMethodDomain',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethodDomain.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1PaymentMethodDomainsPaymentMethodDomain
  get paymentMethodDomain =>
      StripeApiClientV1PaymentMethodDomainsPaymentMethodDomain(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PaymentMethodsPaymentMethodAttach {
  StripeApiClientV1PaymentMethodsPaymentMethodAttach({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Attaches a PaymentMethod object to a Customer.
  ///
  /// To attach a new PaymentMethod to a customer for future payments, we recommend you use a [SetupIntent](/docs/api/setup_intents) or a PaymentIntent with [setup\_future\_usage](/docs/api/payment_intents/create#create_payment_intent-setup_future_usage). These approaches will perform any necessary steps to set up the PaymentMethod for future payments. Using the `/v1/payment_methods/:id/attach` endpoint without first using a SetupIntent or PaymentIntent with `setup\_future\_usage` does not optimize the PaymentMethod for future use, which makes later declines and payment friction more likely. See [Optimizing cards for future payments](/docs/payments/payment-intents#future-usage) for more information about setting up future payments.
  ///
  /// To use this PaymentMethod as the default for invoice or subscription payments, set [`invoice\_settings.default\_payment_method`](/docs/api/customers/update#update_customer-invoice_settings-default_payment_method), on the Customer to the PaymentMethod’s ID.
  Future<PaymentMethod> attach({
    required String paymentMethod,
    required PostPaymentMethodsPaymentMethodAttachBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_methods/$paymentMethod/attach',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethod.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentMethodsPaymentMethodDetach {
  StripeApiClientV1PaymentMethodsPaymentMethodDetach({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Detaches a PaymentMethod object from a Customer. After a PaymentMethod is detached, it can no longer be used for a payment or re-attached to a Customer.
  Future<PaymentMethod> detach({
    required String paymentMethod,
    PostPaymentMethodsPaymentMethodDetachBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_methods/$paymentMethod/detach',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethod.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PaymentMethodsPaymentMethod {
  StripeApiClientV1PaymentMethodsPaymentMethod({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1PaymentMethodsPaymentMethodAttach get attach =>
      StripeApiClientV1PaymentMethodsPaymentMethodAttach(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentMethodsPaymentMethodDetach get detach =>
      StripeApiClientV1PaymentMethodsPaymentMethodDetach(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PaymentMethods {
  StripeApiClientV1PaymentMethods({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of PaymentMethods for Treasury flows. If you want to list the PaymentMethods attached to a Customer for payments, you should use the [List a Customer’s PaymentMethods](/docs/api/payment_methods/customer_list) API instead.
  Future<GetPaymentMethodsResponse> list({
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Type_type? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_methods',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPaymentMethodsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a PaymentMethod object. Read the [Stripe.js reference](/docs/stripe-js/reference#stripe-create-payment-method) to learn how to create PaymentMethods via Stripe.js.
  ///
  /// Instead of creating a PaymentMethod directly, we recommend using the [PaymentIntents](/docs/payments/accept-a-payment) API to accept a payment immediately or the [SetupIntent](/docs/payments/save-and-reuse) API to collect payment method details ahead of a future payment.
  Future<PaymentMethod> create({PostPaymentMethodsBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_methods');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethod.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a PaymentMethod object attached to the StripeAccount. To retrieve a payment method attached to a Customer, you should use [Retrieve a Customer’s PaymentMethods](/docs/api/payment_methods/customer)
  Future<PaymentMethod> retrieve({
    required String paymentMethod,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payment_methods/$paymentMethod',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethod.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be updated.
  Future<PaymentMethod> update({
    required String paymentMethod,
    PostPaymentMethodsPaymentMethodBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payment_methods/$paymentMethod');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PaymentMethod.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1PaymentMethodsPaymentMethod get paymentMethod =>
      StripeApiClientV1PaymentMethodsPaymentMethod(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1PayoutsPayoutCancel {
  StripeApiClientV1PayoutsPayoutCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// You can cancel a previously created payout if its status is `pending`. Stripe refunds the funds to your available balance. You can’t cancel automatic Stripe payouts.
  Future<Payout> cancel({
    required String payout,
    PostPayoutsPayoutCancelBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payouts/$payout/cancel');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Payout.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PayoutsPayoutReverse {
  StripeApiClientV1PayoutsPayoutReverse({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Reverses a payout by debiting the destination bank account. At this time, you can only reverse payouts for connected accounts to US bank accounts. If the payout is manual and in the `pending` status, use `/v1/payouts/:id/cancel` instead.
  ///
  /// By requesting a reversal through `/v1/payouts/:id/reverse`, you confirm that the authorized signatory of the selected bank account authorizes the debit on the bank account and that no other authorization is required.
  Future<Payout> reverse({
    required String payout,
    PostPayoutsPayoutReverseBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payouts/$payout/reverse');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Payout.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PayoutsPayout {
  StripeApiClientV1PayoutsPayout({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1PayoutsPayoutCancel get cancel =>
      StripeApiClientV1PayoutsPayoutCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PayoutsPayoutReverse get reverse =>
      StripeApiClientV1PayoutsPayoutReverse(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Payouts {
  StripeApiClientV1Payouts({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of existing payouts sent to third-party bank accounts or payouts that Stripe sent to you. The payouts return in sorted order, with the most recently created payouts appearing first.
  Future<GetPayoutsResponse> list({
    ArrivalDate_arrivalDate? arrivalDate,
    Created_created? created,
    String? destination,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    String? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (arrivalDate != null) {
      $queryParameters['arrival_date'] = arrivalDate.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (destination != null) {
      $queryParameters['destination'] = destination;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payouts',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPayoutsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// To send funds to your own bank account, create a new payout object. Your [Stripe balance](#balance) must cover the payout amount. If it doesn’t, you receive an “Insufficient Funds” error.
  ///
  /// If your API key is in test mode, money won’t actually be sent, though every other action occurs as if you’re in live mode.
  ///
  /// If you create a manual payout on a Stripe account that uses multiple payment source types, you need to specify the source type balance that the payout draws from. The [balance object](#balance_object) details available and pending amounts by source type.
  Future<Payout> create({required PostPayoutsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/payouts');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Payout.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing payout. Supply the unique payout ID from either a payout creation request or the payout list. Stripe returns the corresponding payout information.
  Future<Payout> retrieve({
    required String payout,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/payouts/$payout',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Payout.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified payout by setting the values of the parameters you pass. We don’t change parameters that you don’t provide. This request only accepts the metadata as arguments.
  Future<Payout> update({
    required String payout,
    PostPayoutsPayoutBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/payouts/$payout');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Payout.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1PayoutsPayout get payout => StripeApiClientV1PayoutsPayout(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1Plans {
  StripeApiClientV1Plans({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your plans.
  Future<GetPlansResponse> list({
    bool? active,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? product,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (product != null) {
      $queryParameters['product'] = product;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/plans',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPlansResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// You can now model subscriptions more flexibly using the [Prices API](#prices). It replaces the Plans API and is backwards compatible to simplify your migration.
  Future<Plan> create({required PostPlansBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/plans');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Plan.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the plan with the given ID.
  Future<Plan> retrieve({required String plan, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/plans/$plan',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Plan.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified plan by setting the values of the parameters passed. Any parameters not provided are left unchanged. By design, you cannot change a plan’s ID, amount, currency, or billing cycle.
  Future<Plan> update({required String plan, PostPlansPlanBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/plans/$plan');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Plan.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deleting plans means new subscribers can’t be added. Existing subscribers aren’t affected.
  Future<DeletedPlan> delete({required String plan}) async {
    final $uri = Uri.parse('$_baseUri/v1/plans/$plan');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedPlan.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1PricesSearch {
  StripeApiClientV1PricesSearch({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Search for prices you’ve previously created using Stripe’s [Search Query Language](/docs/search#search-query-language). Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up to an hour behind during outages. Search functionality is not available to merchants in India.
  Future<GetPricesSearchResponse> search({
    List<String>? expand,
    int? limit,
    String? page,
    required String query,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      $queryParameters['page'] = page;
    }
    $queryParameters['query'] = query;
    final $uri = Uri.parse(
      '$_baseUri/v1/prices/search',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPricesSearchResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Prices {
  StripeApiClientV1Prices({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your active prices, excluding [inline prices](/docs/products-prices/pricing-models#inline-pricing). For the list of inactive prices, set `active` to false.
  Future<GetPricesResponse> list({
    bool? active,
    Created_created? created,
    String? currency,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    List<String>? lookupKeys,
    String? product,
    Recurring_recurring? recurring,
    String? startingAfter,
    Type_type? type,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (currency != null) {
      $queryParameters['currency'] = currency;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (lookupKeys != null) {
      $queryParameters['lookup_keys'] = lookupKeys;
    }
    if (product != null) {
      $queryParameters['product'] = product;
    }
    if (recurring != null) {
      $queryParameters['recurring'] = recurring.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/prices',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPricesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new price for an existing product. The price can be recurring or one-time.
  Future<Price> create({required PostPricesBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/prices');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Price.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the price with the given ID.
  Future<Price> retrieve({required String price, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/prices/$price',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Price.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified price by setting the values of the parameters passed. Any parameters not provided are left unchanged.
  Future<Price> update({
    required String price,
    PostPricesPriceBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/prices/$price');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Price.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1PricesSearch get search =>
      StripeApiClientV1PricesSearch(baseUri: _baseUri, httpClient: _httpClient);
}

class StripeApiClientV1ProductsSearch {
  StripeApiClientV1ProductsSearch({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Search for products you’ve previously created using Stripe’s [Search Query Language](/docs/search#search-query-language). Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up to an hour behind during outages. Search functionality is not available to merchants in India.
  Future<GetProductsSearchResponse> search({
    List<String>? expand,
    int? limit,
    String? page,
    required String query,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      $queryParameters['page'] = page;
    }
    $queryParameters['query'] = query;
    final $uri = Uri.parse(
      '$_baseUri/v1/products/search',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetProductsSearchResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Products {
  StripeApiClientV1Products({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your products. The products are returned sorted by creation date, with the most recently created products appearing first.
  Future<GetProductsResponse> list({
    bool? active,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    List<String>? ids,
    int? limit,
    bool? shippable,
    String? startingAfter,
    Type_type? type,
    String? url,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (ids != null) {
      $queryParameters['ids'] = ids;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (shippable != null) {
      $queryParameters['shippable'] = shippable.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (type != null) {
      $queryParameters['type'] = type.toString();
    }
    if (url != null) {
      $queryParameters['url'] = url;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/products',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetProductsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new product object.
  Future<Product> create({required PostProductsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/products');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Product.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing product. Supply the unique product ID from either a product creation request or the product list, and Stripe will return the corresponding product information.
  Future<Product> retrieve({required String id, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/products/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Product.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specific product by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<Product> update({required String id, PostProductsIdBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/products/$id');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Product.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Delete a product. Deleting a product is only possible if it has no prices associated with it. Additionally, deleting a product with `type=good` is only possible if it has no SKUs associated with it.
  Future<DeletedProduct> delete({required String id}) async {
    final $uri = Uri.parse('$_baseUri/v1/products/$id');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedProduct.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1ProductsSearch get search => StripeApiClientV1ProductsSearch(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1PromotionCodes {
  StripeApiClientV1PromotionCodes({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your promotion codes.
  Future<GetPromotionCodesResponse> list({
    bool? active,
    String? code,
    String? coupon,
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (code != null) {
      $queryParameters['code'] = code;
    }
    if (coupon != null) {
      $queryParameters['coupon'] = coupon;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/promotion_codes',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetPromotionCodesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// A promotion code points to a coupon. You can optionally restrict the code to a specific customer, redemption limit, and expiration date.
  Future<PromotionCode> create({required PostPromotionCodesBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/promotion_codes');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PromotionCode.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the promotion code with the given ID. In order to retrieve a promotion code by the customer-facing `code` use [list](/docs/api/promotion_codes/list) with the desired `code`.
  Future<PromotionCode> retrieve({
    required String promotionCode,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/promotion_codes/$promotionCode',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PromotionCode.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified promotion code by setting the values of the parameters passed. Most fields are, by design, not editable.
  Future<PromotionCode> update({
    required String promotionCode,
    PostPromotionCodesPromotionCodeBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/promotion_codes/$promotionCode');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PromotionCode.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1QuotesQuoteAccept {
  StripeApiClientV1QuotesQuoteAccept({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Accepts the specified quote.
  Future<Quote> accept({
    required String quote,
    PostQuotesQuoteAcceptBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/quotes/$quote/accept');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Quote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1QuotesQuoteCancel {
  StripeApiClientV1QuotesQuoteCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancels the quote.
  Future<Quote> cancel({
    required String quote,
    PostQuotesQuoteCancelBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/quotes/$quote/cancel');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Quote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1QuotesQuoteComputedUpfrontLineItems {
  StripeApiClientV1QuotesQuoteComputedUpfrontLineItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving a quote, there is an includable [**computed.upfront.line_items**](https://stripe.com/docs/api/quotes/object#quote_object-computed-upfront-line_items) property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of upfront line items.
  Future<GetQuotesQuoteComputedUpfrontLineItemsResponse>
  list_computed_upfront_line_items({
    required String quote,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/quotes/$quote/computed_upfront_line_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetQuotesQuoteComputedUpfrontLineItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1QuotesQuoteFinalize {
  StripeApiClientV1QuotesQuoteFinalize({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Finalizes the quote.
  Future<Quote> finalize_quote({
    required String quote,
    PostQuotesQuoteFinalizeBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/quotes/$quote/finalize');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Quote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1QuotesQuoteLineItems {
  StripeApiClientV1QuotesQuoteLineItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// When retrieving a quote, there is an includable **line_items** property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.
  Future<GetQuotesQuoteLineItemsResponse> list_line_items({
    required String quote,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/quotes/$quote/line_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetQuotesQuoteLineItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1QuotesQuotePdf {
  StripeApiClientV1QuotesQuotePdf({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Download the PDF for a finalized quote. Explanation for special handling can be found [here](https://docs.corp.stripe.com/quotes/overview#quote_pdf)
  Future<String> pdf({required String quote, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/quotes/$quote/pdf',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ($json as String);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1QuotesQuote {
  StripeApiClientV1QuotesQuote({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1QuotesQuoteAccept get accept =>
      StripeApiClientV1QuotesQuoteAccept(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1QuotesQuoteCancel get cancel =>
      StripeApiClientV1QuotesQuoteCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1QuotesQuoteComputedUpfrontLineItems
  get computedUpfrontLineItems =>
      StripeApiClientV1QuotesQuoteComputedUpfrontLineItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1QuotesQuoteFinalize get finalize =>
      StripeApiClientV1QuotesQuoteFinalize(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1QuotesQuoteLineItems get lineItems =>
      StripeApiClientV1QuotesQuoteLineItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1QuotesQuotePdf get pdf => StripeApiClientV1QuotesQuotePdf(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1Quotes {
  StripeApiClientV1Quotes({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your quotes.
  Future<GetQuotesResponse> list({
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
    String? testClock,
  }) async {
    final $queryParameters = <String, Object>{};
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (testClock != null) {
      $queryParameters['test_clock'] = testClock;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/quotes',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetQuotesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// A quote models prices and services for a customer. Default options for `header`, `description`, `footer`, and `expires_at` can be set in the dashboard via the [quote template](https://dashboard.stripe.com/settings/billing/quote).
  Future<Quote> create({PostQuotesBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/quotes');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Quote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the quote with the given ID.
  Future<Quote> retrieve({required String quote, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/quotes/$quote',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Quote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// A quote models prices and services for a customer.
  Future<Quote> update({
    required String quote,
    PostQuotesQuoteBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/quotes/$quote');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Quote.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1QuotesQuote get quote =>
      StripeApiClientV1QuotesQuote(baseUri: _baseUri, httpClient: _httpClient);
}

class StripeApiClientV1RadarEarlyFraudWarnings {
  StripeApiClientV1RadarEarlyFraudWarnings({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of early fraud warnings.
  Future<GetRadarEarlyFraudWarningsResponse> list({
    String? charge,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? paymentIntent,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (charge != null) {
      $queryParameters['charge'] = charge;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (paymentIntent != null) {
      $queryParameters['payment_intent'] = paymentIntent;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/radar/early_fraud_warnings',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetRadarEarlyFraudWarningsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an early fraud warning that has previously been created.
  ///
  /// Please refer to the [early fraud warning](#early_fraud_warning_object) object reference for more details.
  Future<RadarEarlyFraudWarning> retrieve({
    required String earlyFraudWarning,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/radar/early_fraud_warnings/$earlyFraudWarning',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return RadarEarlyFraudWarning.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1RadarValueListItems {
  StripeApiClientV1RadarValueListItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of `ValueListItem` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetRadarValueListItemsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    String? value,
    required String valueList,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (value != null) {
      $queryParameters['value'] = value;
    }
    $queryParameters['value_list'] = valueList;
    final $uri = Uri.parse(
      '$_baseUri/v1/radar/value_list_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetRadarValueListItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new `ValueListItem` object, which is added to the specified parent value list.
  Future<RadarValueListItem> create({
    required PostRadarValueListItemsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/radar/value_list_items');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return RadarValueListItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a `ValueListItem` object.
  Future<RadarValueListItem> retrieve({
    required String item,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/radar/value_list_items/$item',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return RadarValueListItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes a `ValueListItem` object, removing it from its parent value list.
  Future<DeletedRadarValueListItem> delete({required String item}) async {
    final $uri = Uri.parse('$_baseUri/v1/radar/value_list_items/$item');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedRadarValueListItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1RadarValueLists {
  StripeApiClientV1RadarValueLists({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of `ValueList` objects. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetRadarValueListsResponse> list({
    String? alias,
    String? contains,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (alias != null) {
      $queryParameters['alias'] = alias;
    }
    if (contains != null) {
      $queryParameters['contains'] = contains;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/radar/value_lists',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetRadarValueListsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new `ValueList` object, which can then be referenced in rules.
  Future<RadarValueList> create({required PostRadarValueListsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/radar/value_lists');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return RadarValueList.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a `ValueList` object.
  Future<RadarValueList> retrieve({
    required String valueList,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/radar/value_lists/$valueList',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return RadarValueList.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a `ValueList` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged. Note that `item_type` is immutable.
  Future<RadarValueList> update({
    required String valueList,
    PostRadarValueListsValueListBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/radar/value_lists/$valueList');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return RadarValueList.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes a `ValueList` object, also deleting any items contained within the value list. To be deleted, a value list must not be referenced in any rules.
  Future<DeletedRadarValueList> delete({required String valueList}) async {
    final $uri = Uri.parse('$_baseUri/v1/radar/value_lists/$valueList');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedRadarValueList.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Radar {
  StripeApiClientV1Radar({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1RadarEarlyFraudWarnings get earlyFraudWarnings =>
      StripeApiClientV1RadarEarlyFraudWarnings(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1RadarValueListItems get valueListItems =>
      StripeApiClientV1RadarValueListItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1RadarValueLists get valueLists =>
      StripeApiClientV1RadarValueLists(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1RefundsRefundCancel {
  StripeApiClientV1RefundsRefundCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancels a refund with a status of `requires_action`.
  ///
  /// You can’t cancel refunds in other states. Only refunds for payment methods that require customer action can enter the `requires_action` state.
  Future<Refund> cancel({
    required String refund,
    PostRefundsRefundCancelBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/refunds/$refund/cancel');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Refund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1RefundsRefund {
  StripeApiClientV1RefundsRefund({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1RefundsRefundCancel get cancel =>
      StripeApiClientV1RefundsRefundCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Refunds {
  StripeApiClientV1Refunds({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of all refunds you created. We return the refunds in sorted order, with the most recent refunds appearing first The 10 most recent refunds are always available by default on the Charge object.
  Future<GetRefundsResponse> list({
    String? charge,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? paymentIntent,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (charge != null) {
      $queryParameters['charge'] = charge;
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (paymentIntent != null) {
      $queryParameters['payment_intent'] = paymentIntent;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/refunds',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetRefundsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// When you create a new refund, you must specify a Charge or a PaymentIntent object on which to create it.
  ///
  /// Creating a new refund will refund a charge that has previously been created but not yet refunded. Funds will be refunded to the credit or debit card that was originally charged.
  ///
  /// You can optionally refund only part of a charge. You can do so multiple times, until the entire charge has been refunded.
  ///
  /// Once entirely refunded, a charge can’t be refunded again. This method will raise an error when called on an already-refunded charge, or when trying to refund more money than is left on a charge.
  Future<Refund> create({PostRefundsBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/refunds');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Refund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing refund.
  Future<Refund> retrieve({
    required String refund,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/refunds/$refund',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Refund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the refund that you specify by setting the values of the passed parameters. Any parameters that you don’t provide remain unchanged.
  ///
  /// This request only accepts `metadata` as an argument.
  Future<Refund> update({
    required String refund,
    PostRefundsRefundBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/refunds/$refund');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Refund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1RefundsRefund get refund => StripeApiClientV1RefundsRefund(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1ReportingReportRuns {
  StripeApiClientV1ReportingReportRuns({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Report Runs, with the most recent appearing first.
  Future<GetReportingReportRunsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/reporting/report_runs',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetReportingReportRunsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new object and begin running the report. (Certain report types require a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).)
  Future<ReportingReportRun> create({
    required PostReportingReportRunsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/reporting/report_runs');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ReportingReportRun.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing Report Run.
  Future<ReportingReportRun> retrieve({
    required String reportRun,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/reporting/report_runs/$reportRun',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ReportingReportRun.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ReportingReportTypes {
  StripeApiClientV1ReportingReportTypes({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a full list of Report Types.
  Future<GetReportingReportTypesResponse> list({List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/reporting/report_types',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetReportingReportTypesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a Report Type. (Certain report types require a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).)
  Future<ReportingReportType> retrieve({
    required String reportType,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/reporting/report_types/$reportType',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ReportingReportType.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Reporting {
  StripeApiClientV1Reporting({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ReportingReportRuns get reportRuns =>
      StripeApiClientV1ReportingReportRuns(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1ReportingReportTypes get reportTypes =>
      StripeApiClientV1ReportingReportTypes(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ReviewsReviewApprove {
  StripeApiClientV1ReviewsReviewApprove({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Approves a `Review` object, closing it and removing it from the list of reviews.
  Future<Review> approve({
    required String review,
    PostReviewsReviewApproveBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/reviews/$review/approve');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Review.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1ReviewsReview {
  StripeApiClientV1ReviewsReview({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1ReviewsReviewApprove get approve =>
      StripeApiClientV1ReviewsReviewApprove(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Reviews {
  StripeApiClientV1Reviews({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of `Review` objects that have `open` set to `true`. The objects are sorted in descending order by creation date, with the most recently created object appearing first.
  Future<GetReviewsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/reviews',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetReviewsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a `Review` object.
  Future<Review> retrieve({
    required String review,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/reviews/$review',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Review.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1ReviewsReview get review => StripeApiClientV1ReviewsReview(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1SetupAttempts {
  StripeApiClientV1SetupAttempts({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of SetupAttempts that associate with a provided SetupIntent.
  Future<GetSetupAttemptsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    required String setupIntent,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    $queryParameters['setup_intent'] = setupIntent;
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/setup_attempts',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSetupAttemptsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SetupIntentsIntentCancel {
  StripeApiClientV1SetupIntentsIntentCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// You can cancel a SetupIntent object when it’s in one of these statuses: `requires\_payment\_method`, `requires_confirmation`, or `requires_action`.
  ///
  /// After you cancel it, setup is abandoned and any operations on the SetupIntent fail with an error.
  Future<SetupIntent> cancel({
    required String intent,
    PostSetupIntentsIntentCancelBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/setup_intents/$intent/cancel');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SetupIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SetupIntentsIntentConfirm {
  StripeApiClientV1SetupIntentsIntentConfirm({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Confirm that your customer intends to set up the current or provided payment method. For example, you would confirm a SetupIntent when a customer hits the “Save” button on a payment method management page on your website.
  ///
  /// If the selected payment method does not require any additional steps from the customer, the SetupIntent will transition to the `succeeded` status.
  ///
  /// Otherwise, it will transition to the `requires_action` status and suggest additional actions via `next_action`. If setup fails, the SetupIntent will transition to the `requires\_payment\_method` status or the `canceled` status if the confirmation limit is reached.
  Future<SetupIntent> confirm({
    required String intent,
    PostSetupIntentsIntentConfirmBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/setup_intents/$intent/confirm');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SetupIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SetupIntentsIntentVerifyMicrodeposits {
  StripeApiClientV1SetupIntentsIntentVerifyMicrodeposits({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Verifies microdeposits on a SetupIntent object.
  Future<SetupIntent> verify_microdeposits({
    required String intent,
    PostSetupIntentsIntentVerifyMicrodepositsBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/setup_intents/$intent/verify_microdeposits',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SetupIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SetupIntentsIntent {
  StripeApiClientV1SetupIntentsIntent({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1SetupIntentsIntentCancel get cancel =>
      StripeApiClientV1SetupIntentsIntentCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SetupIntentsIntentConfirm get confirm =>
      StripeApiClientV1SetupIntentsIntentConfirm(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SetupIntentsIntentVerifyMicrodeposits
  get verifyMicrodeposits =>
      StripeApiClientV1SetupIntentsIntentVerifyMicrodeposits(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1SetupIntents {
  StripeApiClientV1SetupIntents({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of SetupIntents.
  Future<GetSetupIntentsResponse> list({
    bool? attachToSelf,
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? paymentMethod,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (attachToSelf != null) {
      $queryParameters['attach_to_self'] = attachToSelf.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (paymentMethod != null) {
      $queryParameters['payment_method'] = paymentMethod;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/setup_intents',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSetupIntentsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a SetupIntent object.
  ///
  /// After you create the SetupIntent, attach a payment method and [confirm](/docs/api/setup_intents/confirm) it to collect any required permissions to charge the payment method later.
  Future<SetupIntent> create({PostSetupIntentsBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/setup_intents');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SetupIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a SetupIntent that has previously been created.
  ///
  /// Client-side retrieval using a publishable key is allowed when the `client_secret` is provided in the query string.
  ///
  /// When retrieved with a publishable key, only a subset of properties will be returned. Please refer to the [SetupIntent](#setup_intent_object) object reference for more details.
  Future<SetupIntent> retrieve({
    required String intent,
    String? clientSecret,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (clientSecret != null) {
      $queryParameters['client_secret'] = clientSecret;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/setup_intents/$intent',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SetupIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a SetupIntent object.
  Future<SetupIntent> update({
    required String intent,
    PostSetupIntentsIntentBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/setup_intents/$intent');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SetupIntent.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1SetupIntentsIntent get intent =>
      StripeApiClientV1SetupIntentsIntent(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1ShippingRates {
  StripeApiClientV1ShippingRates({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your shipping rates.
  Future<GetShippingRatesResponse> list({
    bool? active,
    Created_created? created,
    String? currency,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (currency != null) {
      $queryParameters['currency'] = currency;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/shipping_rates',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetShippingRatesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new shipping rate object.
  Future<ShippingRate> create({required PostShippingRatesBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/shipping_rates');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ShippingRate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Returns the shipping rate object with the given ID.
  Future<ShippingRate> retrieve({
    required String shippingRateToken,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/shipping_rates/$shippingRateToken',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ShippingRate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing shipping rate object.
  Future<ShippingRate> update({
    required String shippingRateToken,
    PostShippingRatesShippingRateTokenBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/shipping_rates/$shippingRateToken');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ShippingRate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SigmaScheduledQueryRuns {
  StripeApiClientV1SigmaScheduledQueryRuns({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of scheduled query runs.
  Future<GetSigmaScheduledQueryRunsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/sigma/scheduled_query_runs',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSigmaScheduledQueryRunsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an scheduled query run.
  Future<ScheduledQueryRun> retrieve({
    required String scheduledQueryRun,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/sigma/scheduled_query_runs/$scheduledQueryRun',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ScheduledQueryRun.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Sigma {
  StripeApiClientV1Sigma({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1SigmaScheduledQueryRuns get scheduledQueryRuns =>
      StripeApiClientV1SigmaScheduledQueryRuns(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1SourcesSourceSourceTransactions {
  StripeApiClientV1SourcesSourceSourceTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// List source transactions for a given source.
  Future<GetSourcesSourceSourceTransactionsResponse> source_transactions({
    required String source,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/sources/$source/source_transactions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSourcesSourceSourceTransactionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SourcesSourceVerify {
  StripeApiClientV1SourcesSourceVerify({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Verify a given source.
  Future<Source> verify({
    required String source,
    required PostSourcesSourceVerifyBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/sources/$source/verify');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Source.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SourcesSource {
  StripeApiClientV1SourcesSource({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1SourcesSourceSourceTransactions get sourceTransactions =>
      StripeApiClientV1SourcesSourceSourceTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SourcesSourceVerify get verify =>
      StripeApiClientV1SourcesSourceVerify(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Sources {
  StripeApiClientV1Sources({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a new source object.
  Future<Source> create({PostSourcesBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/sources');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Source.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an existing source object. Supply the unique source ID from a source creation request and Stripe will return the corresponding up-to-date source object information.
  Future<Source> retrieve({
    required String source,
    String? clientSecret,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (clientSecret != null) {
      $queryParameters['client_secret'] = clientSecret;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/sources/$source',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Source.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified source by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  ///
  /// This request accepts the `metadata` and `owner` as arguments. It is also possible to update type specific information for selected payment methods. Please refer to our [payment method guides](/docs/sources) for more detail.
  Future<Source> update({
    required String source,
    PostSourcesSourceBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/sources/$source');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Source.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1SourcesSource get source => StripeApiClientV1SourcesSource(
    baseUri: _baseUri,
    httpClient: _httpClient,
  );
}

class StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecordSummaries {
  StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecordSummaries({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// For the specified subscription item, returns a list of summary objects. Each object in the list provides usage information that’s been summarized from multiple usage records and over a subscription billing period (e.g., 15 usage records in the month of September).
  ///
  /// The list is sorted in reverse-chronological order (newest first). The first list item represents the most current usage period that hasn’t ended yet. Since new usage records can still be added, the returned summary information for the subscription item’s ID should be seen as unstable until the subscription billing period ends.
  Future<GetSubscriptionItemsSubscriptionItemUsageRecordSummariesResponse>
  list({
    required String subscriptionItem,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_items/$subscriptionItem/usage_record_summaries',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSubscriptionItemsSubscriptionItemUsageRecordSummariesResponse.fromJson(
          $json,
        );

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecords {
  StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecords({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a usage record for a specified subscription item and date, and fills it with a quantity.
  ///
  /// Usage records provide `quantity` information that Stripe uses to track how much a customer is using your service. With usage information and the pricing model set up by the [metered billing](https://stripe.com/docs/billing/subscriptions/metered-billing) plan, Stripe helps you send accurate invoices to your customers.
  ///
  /// The default calculation for usage is to add up all the `quantity` values of the usage records within a billing period. You can change this default behavior with the billing plan’s `aggregate_usage` [parameter](/docs/api/plans/create#create_plan-aggregate_usage). When there is more than one usage record with the same timestamp, Stripe adds the `quantity` values together. In most cases, this is the desired resolution, however, you can change this behavior with the `action` parameter.
  ///
  /// The default pricing model for metered billing is [per-unit pricing](/docs/api/plans/object#plan_object-billing_scheme). For finer granularity, you can configure metered billing to have a [tiered pricing](https://stripe.com/docs/billing/subscriptions/tiers) model.
  Future<UsageRecord> create({
    required String subscriptionItem,
    required PostSubscriptionItemsSubscriptionItemUsageRecordsBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_items/$subscriptionItem/usage_records',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return UsageRecord.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SubscriptionItemsSubscriptionItem {
  StripeApiClientV1SubscriptionItemsSubscriptionItem({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecordSummaries
  get usageRecordSummaries =>
      StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecordSummaries(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecords
  get usageRecords =>
      StripeApiClientV1SubscriptionItemsSubscriptionItemUsageRecords(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1SubscriptionItems {
  StripeApiClientV1SubscriptionItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your subscription items for a given subscription.
  Future<GetSubscriptionItemsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    required String subscription,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    $queryParameters['subscription'] = subscription;
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSubscriptionItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Adds a new item to an existing subscription. No existing items will be changed or replaced.
  Future<SubscriptionItem> create({
    required PostSubscriptionItemsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscription_items');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the subscription item with the given ID.
  Future<SubscriptionItem> retrieve({
    required String item,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_items/$item',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the plan or quantity of an item on a current subscription.
  Future<SubscriptionItem> update({
    required String item,
    PostSubscriptionItemsItemBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscription_items/$item');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes an item from the subscription. Removing a subscription item from a subscription will not cancel the subscription.
  Future<DeletedSubscriptionItem> delete({
    required String item,
    DeleteSubscriptionItemsItemBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscription_items/$item');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedSubscriptionItem.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1SubscriptionItemsSubscriptionItem get subscriptionItem =>
      StripeApiClientV1SubscriptionItemsSubscriptionItem(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1SubscriptionSchedulesScheduleCancel {
  StripeApiClientV1SubscriptionSchedulesScheduleCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancels a subscription schedule and its associated subscription immediately (if the subscription schedule has an active subscription). A subscription schedule can only be canceled if its status is `not_started` or `active`.
  Future<SubscriptionSchedule> cancel({
    required String schedule,
    PostSubscriptionSchedulesScheduleCancelBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_schedules/$schedule/cancel',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionSchedule.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SubscriptionSchedulesScheduleRelease {
  StripeApiClientV1SubscriptionSchedulesScheduleRelease({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Releases the subscription schedule immediately, which will stop scheduling of its phases, but leave any existing subscription in place. A schedule can only be released if its status is `not_started` or `active`. If the subscription schedule is currently associated with a subscription, releasing it will remove its `subscription` property and set the subscription’s ID to the `released_subscription` property.
  Future<SubscriptionSchedule> release({
    required String schedule,
    PostSubscriptionSchedulesScheduleReleaseBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_schedules/$schedule/release',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionSchedule.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SubscriptionSchedulesSchedule {
  StripeApiClientV1SubscriptionSchedulesSchedule({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1SubscriptionSchedulesScheduleCancel get cancel =>
      StripeApiClientV1SubscriptionSchedulesScheduleCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SubscriptionSchedulesScheduleRelease get release =>
      StripeApiClientV1SubscriptionSchedulesScheduleRelease(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1SubscriptionSchedules {
  StripeApiClientV1SubscriptionSchedules({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves the list of your subscription schedules.
  Future<GetSubscriptionSchedulesResponse> list({
    CanceledAt_canceledAt? canceledAt,
    CompletedAt_completedAt? completedAt,
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    ReleasedAt_releasedAt? releasedAt,
    bool? scheduled,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (canceledAt != null) {
      $queryParameters['canceled_at'] = canceledAt.toString();
    }
    if (completedAt != null) {
      $queryParameters['completed_at'] = completedAt.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (releasedAt != null) {
      $queryParameters['released_at'] = releasedAt.toString();
    }
    if (scheduled != null) {
      $queryParameters['scheduled'] = scheduled.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_schedules',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSubscriptionSchedulesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new subscription schedule object. Each customer can have up to 500 active or scheduled subscriptions.
  Future<SubscriptionSchedule> create({
    PostSubscriptionSchedulesBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscription_schedules');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionSchedule.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing subscription schedule. You only need to supply the unique subscription schedule identifier that was returned upon subscription schedule creation.
  Future<SubscriptionSchedule> retrieve({
    required String schedule,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/subscription_schedules/$schedule',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionSchedule.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing subscription schedule.
  Future<SubscriptionSchedule> update({
    required String schedule,
    PostSubscriptionSchedulesScheduleBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscription_schedules/$schedule');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return SubscriptionSchedule.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1SubscriptionSchedulesSchedule get schedule =>
      StripeApiClientV1SubscriptionSchedulesSchedule(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1SubscriptionsSearch {
  StripeApiClientV1SubscriptionsSearch({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Search for subscriptions you’ve previously created using Stripe’s [Search Query Language](/docs/search#search-query-language). Don’t use search in read-after-write flows where strict consistency is necessary. Under normal operating conditions, data is searchable in less than a minute. Occasionally, propagation of new or updated data can be up to an hour behind during outages. Search functionality is not available to merchants in India.
  Future<GetSubscriptionsSearchResponse> search({
    List<String>? expand,
    int? limit,
    String? page,
    required String query,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (page != null) {
      $queryParameters['page'] = page;
    }
    $queryParameters['query'] = query;
    final $uri = Uri.parse(
      '$_baseUri/v1/subscriptions/search',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSubscriptionsSearchResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SubscriptionsSubscriptionExposedIdDiscount {
  StripeApiClientV1SubscriptionsSubscriptionExposedIdDiscount({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Removes the currently applied discount on a subscription.
  Future<DeletedDiscount> delete_discount({
    required String subscriptionExposedId,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/subscriptions/$subscriptionExposedId/discount',
    );
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedDiscount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SubscriptionsSubscriptionExposedId {
  StripeApiClientV1SubscriptionsSubscriptionExposedId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1SubscriptionsSubscriptionExposedIdDiscount get discount =>
      StripeApiClientV1SubscriptionsSubscriptionExposedIdDiscount(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1SubscriptionsSubscriptionResume {
  StripeApiClientV1SubscriptionsSubscriptionResume({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Initiates resumption of a paused subscription, optionally resetting the billing cycle anchor and creating prorations. If a resumption invoice is generated, it must be paid or marked uncollectible before the subscription will be unpaused. If payment succeeds the subscription will become `active`, and if payment fails the subscription will be `past_due`. The resumption invoice will void automatically if not paid by the expiration date.
  Future<Subscription> resume({
    required String subscription,
    PostSubscriptionsSubscriptionResumeBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscriptions/$subscription/resume');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Subscription.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1SubscriptionsSubscription {
  StripeApiClientV1SubscriptionsSubscription({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1SubscriptionsSubscriptionResume get resume =>
      StripeApiClientV1SubscriptionsSubscriptionResume(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Subscriptions {
  StripeApiClientV1Subscriptions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// By default, returns a list of subscriptions that have not been canceled. In order to list canceled subscriptions, specify `status=canceled`.
  Future<GetSubscriptionsResponse> list({
    AutomaticTax_automaticTax? automaticTax,
    CollectionMethod_collectionMethod? collectionMethod,
    Created_created? created,
    CurrentPeriodEnd_currentPeriodEnd? currentPeriodEnd,
    CurrentPeriodStart_currentPeriodStart? currentPeriodStart,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? plan,
    String? price,
    String? startingAfter,
    Status_status? status,
    String? testClock,
  }) async {
    final $queryParameters = <String, Object>{};
    if (automaticTax != null) {
      $queryParameters['automatic_tax'] = automaticTax.toString();
    }
    if (collectionMethod != null) {
      $queryParameters['collection_method'] = collectionMethod.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (currentPeriodEnd != null) {
      $queryParameters['current_period_end'] = currentPeriodEnd.toString();
    }
    if (currentPeriodStart != null) {
      $queryParameters['current_period_start'] = currentPeriodStart.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (plan != null) {
      $queryParameters['plan'] = plan;
    }
    if (price != null) {
      $queryParameters['price'] = price;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (testClock != null) {
      $queryParameters['test_clock'] = testClock;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/subscriptions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetSubscriptionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new subscription on an existing customer. Each customer can have up to 500 active or scheduled subscriptions.
  ///
  /// When you create a subscription with `collection\_method=charge\_automatically`, the first invoice is finalized as part of the request. The `payment_behavior` parameter determines the exact behavior of the initial payment.
  ///
  /// To start subscriptions where the first invoice always begins in a `draft` status, use [subscription schedules](/docs/billing/subscriptions/subscription-schedules#managing) instead. Schedules provide the flexibility to model more complex billing configurations that change over time.
  Future<Subscription> create({required PostSubscriptionsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/subscriptions');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Subscription.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the subscription with the given ID.
  Future<Subscription> retrieve({
    required String subscriptionExposedId,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/subscriptions/$subscriptionExposedId',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Subscription.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing subscription to match the specified parameters. When changing prices or quantities, we optionally prorate the price we charge next month to make up for any price changes. To preview how the proration is calculated, use the [upcoming invoice](/docs/api/invoices/upcoming) endpoint.
  ///
  /// By default, we prorate subscription changes. For example, if a customer signs up on May 1 for a 100 price, they’ll be billed 100 immediately. If on May 15 they switch to a 200 price, then on June 1 they’ll be billed 250 (200 for a renewal of her subscription, plus a 50 prorating adjustment for half of the previous month’s 100 difference). Similarly, a downgrade generates a credit that is applied to the next invoice. We also prorate when you make quantity changes.
  ///
  /// Switching prices does not normally change the billing date or generate an immediate charge unless:
  ///
  /// *   The billing interval is changed (for example, from monthly to yearly).
  /// *   The subscription moves from free to paid, or paid to free.
  /// *   A trial starts or ends.
  ///
  /// In these cases, we apply a credit for the unused time on the previous price, immediately charge the customer using the new price, and reset the billing date.
  ///
  /// If you want to charge for an upgrade immediately, pass `proration_behavior` as `always_invoice` to create prorations, automatically invoice the customer for those proration adjustments, and attempt to collect payment. If you pass `create_prorations`, the prorations are created but not automatically invoiced. If you want to bill the customer for the prorations before the subscription’s renewal date, you need to manually [invoice the customer](/docs/api/invoices/create).
  ///
  /// If you don’t want to prorate, set the `proration_behavior` option to `none`. With this option, the customer is billed 100 on May 1 and 200 on June 1. Similarly, if you set `proration_behavior` to `none` when switching between different billing intervals (for example, from monthly to yearly), we don’t generate any credits for the old subscription’s unused time. We still reset the billing date and bill immediately for the new subscription.
  ///
  /// Updating the quantity on a subscription many times in an hour may result in [rate limiting](/docs/rate-limits). If you need to bill for a frequently changing quantity, consider integrating [usage-based billing](/docs/billing/subscriptions/usage-based) instead.
  Future<Subscription> update({
    required String subscriptionExposedId,
    PostSubscriptionsSubscriptionExposedIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscriptions/$subscriptionExposedId');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Subscription.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Cancels a customer’s subscription immediately. The customer will not be charged again for the subscription.
  ///
  /// Note, however, that any pending invoice items that you’ve created will still be charged for at the end of the period, unless manually [deleted](#delete_invoiceitem). If you’ve set the subscription to cancel at the end of the period, any pending prorations will also be left in place and collected at the end of the period. But if the subscription is set to cancel immediately, pending prorations will be removed.
  ///
  /// By default, upon subscription cancellation, Stripe will stop automatic collection of all finalized invoices for the customer. This is intended to prevent unexpected payment attempts after the customer has canceled a subscription. However, you can resume automatic collection of the invoices manually after subscription cancellation to have us proceed. Or, you could check for unpaid invoices before allowing the customer to cancel the subscription at all.
  Future<Subscription> cancel({
    required String subscriptionExposedId,
    DeleteSubscriptionsSubscriptionExposedIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/subscriptions/$subscriptionExposedId');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Subscription.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1SubscriptionsSearch get search =>
      StripeApiClientV1SubscriptionsSearch(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SubscriptionsSubscriptionExposedId
  get subscriptionExposedId =>
      StripeApiClientV1SubscriptionsSubscriptionExposedId(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SubscriptionsSubscription get subscription =>
      StripeApiClientV1SubscriptionsSubscription(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TaxCalculationsCalculationLineItems {
  StripeApiClientV1TaxCalculationsCalculationLineItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves the line items of a persisted tax calculation as a collection.
  Future<GetTaxCalculationsCalculationLineItemsResponse> list_line_items({
    required String calculation,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax/calculations/$calculation/line_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTaxCalculationsCalculationLineItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxCalculationsCalculation {
  StripeApiClientV1TaxCalculationsCalculation({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TaxCalculationsCalculationLineItems get lineItems =>
      StripeApiClientV1TaxCalculationsCalculationLineItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TaxCalculations {
  StripeApiClientV1TaxCalculations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Calculates tax based on input and returns a Tax `Calculation` object.
  Future<TaxCalculation> create({required PostTaxCalculationsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/tax/calculations');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxCalculation.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TaxCalculationsCalculation get calculation =>
      StripeApiClientV1TaxCalculationsCalculation(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TaxRegistrations {
  StripeApiClientV1TaxRegistrations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of Tax `Registration` objects.
  Future<GetTaxRegistrationsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax/registrations',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTaxRegistrationsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new Tax `Registration` object.
  Future<TaxRegistration> create({
    required PostTaxRegistrationsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/tax/registrations');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxRegistration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Returns a Tax `Registration` object.
  Future<TaxRegistration> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax/registrations/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxRegistration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing Tax `Registration` object.
  ///
  /// A registration cannot be deleted after it has been created. If you wish to end a registration you may do so by setting `expires_at`.
  Future<TaxRegistration> update({
    required String id,
    PostTaxRegistrationsIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/tax/registrations/$id');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxRegistration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxSettings {
  StripeApiClientV1TaxSettings({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves Tax `Settings` for a merchant.
  Future<TaxSettings> retrieve({List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax/settings',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxSettings.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates Tax `Settings` parameters used in tax calculations. All parameters are editable but none can be removed once set.
  Future<TaxSettings> update({PostTaxSettingsBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/tax/settings');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxSettings.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxTransactionsCreateFromCalculation {
  StripeApiClientV1TaxTransactionsCreateFromCalculation({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a Tax `Transaction` from a calculation.
  Future<TaxTransaction> create_from_calculation({
    required PostTaxTransactionsCreateFromCalculationBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/tax/transactions/create_from_calculation',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxTransactionsCreateReversal {
  StripeApiClientV1TaxTransactionsCreateReversal({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Partially or fully reverses a previously created `Transaction`.
  Future<TaxTransaction> create_reversal({
    required PostTaxTransactionsCreateReversalBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/tax/transactions/create_reversal');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxTransactionsTransactionLineItems {
  StripeApiClientV1TaxTransactionsTransactionLineItems({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves the line items of a committed standalone transaction as a collection.
  Future<GetTaxTransactionsTransactionLineItemsResponse> list_line_items({
    required String transaction,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax/transactions/$transaction/line_items',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTaxTransactionsTransactionLineItemsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxTransactionsTransaction {
  StripeApiClientV1TaxTransactionsTransaction({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TaxTransactionsTransactionLineItems get lineItems =>
      StripeApiClientV1TaxTransactionsTransactionLineItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TaxTransactions {
  StripeApiClientV1TaxTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves a Tax `Transaction` object.
  Future<TaxTransaction> retrieve({
    required String transaction,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax/transactions/$transaction',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TaxTransactionsCreateFromCalculation
  get createFromCalculation =>
      StripeApiClientV1TaxTransactionsCreateFromCalculation(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TaxTransactionsCreateReversal get createReversal =>
      StripeApiClientV1TaxTransactionsCreateReversal(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TaxTransactionsTransaction get transaction =>
      StripeApiClientV1TaxTransactionsTransaction(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Tax {
  StripeApiClientV1Tax({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TaxCalculations get calculations =>
      StripeApiClientV1TaxCalculations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TaxRegistrations get registrations =>
      StripeApiClientV1TaxRegistrations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TaxSettings get settings =>
      StripeApiClientV1TaxSettings(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1TaxTransactions get transactions =>
      StripeApiClientV1TaxTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TaxCodes {
  StripeApiClientV1TaxCodes({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// A list of [all tax codes available](https://stripe.com/docs/tax/tax-categories) to add to Products in order to allow specific tax calculations.
  Future<GetTaxCodesResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax_codes',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTaxCodesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing tax code. Supply the unique tax code ID and Stripe will return the corresponding tax code information.
  Future<TaxCode> retrieve({required String id, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax_codes/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxCode.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxIds {
  StripeApiClientV1TaxIds({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of tax IDs.
  Future<GetTaxIdsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    Owner_owner? owner,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (owner != null) {
      $queryParameters['owner'] = owner.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax_ids',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTaxIdsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new account or customer `tax_id` object.
  Future<TaxId> create({required PostTaxIdsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/tax_ids');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxId.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves an account or customer `tax_id` object.
  Future<TaxId> retrieve({required String id, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax_ids/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxId.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes an existing account or customer `tax_id` object.
  Future<DeletedTaxId> delete({required String id}) async {
    final $uri = Uri.parse('$_baseUri/v1/tax_ids/$id');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedTaxId.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TaxRates {
  StripeApiClientV1TaxRates({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your tax rates. Tax rates are returned sorted by creation date, with the most recently created tax rates appearing first.
  Future<GetTaxRatesResponse> list({
    bool? active,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    bool? inclusive,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (active != null) {
      $queryParameters['active'] = active.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (inclusive != null) {
      $queryParameters['inclusive'] = inclusive.toString();
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax_rates',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTaxRatesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new tax rate.
  Future<TaxRate> create({required PostTaxRatesBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/tax_rates');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxRate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a tax rate with the given ID
  Future<TaxRate> retrieve({
    required String taxRate,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tax_rates/$taxRate',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxRate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates an existing tax rate.
  Future<TaxRate> update({
    required String taxRate,
    PostTaxRatesTaxRateBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/tax_rates/$taxRate');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TaxRate.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalConfigurations {
  StripeApiClientV1TerminalConfigurations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of `Configuration` objects.
  Future<GetTerminalConfigurationsResponse> list({
    String? endingBefore,
    List<String>? expand,
    bool? isAccountDefault,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (isAccountDefault != null) {
      $queryParameters['is_account_default'] = isAccountDefault.toString();
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/configurations',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTerminalConfigurationsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new `Configuration` object.
  Future<TerminalConfiguration> create({
    PostTerminalConfigurationsBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/configurations');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a `Configuration` object.
  Future<GetTerminalConfigurationsConfigurationResponse> retrieve({
    required String configuration,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/configurations/$configuration',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTerminalConfigurationsConfigurationResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a new `Configuration` object.
  Future<PostTerminalConfigurationsConfigurationResponse> update({
    required String configuration,
    PostTerminalConfigurationsConfigurationBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/configurations/$configuration',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PostTerminalConfigurationsConfigurationResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes a `Configuration` object.
  Future<DeletedTerminalConfiguration> delete({
    required String configuration,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/configurations/$configuration',
    );
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedTerminalConfiguration.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalConnectionTokens {
  StripeApiClientV1TerminalConnectionTokens({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// To connect to a reader the Stripe Terminal SDK needs to retrieve a short-lived connection token from Stripe, proxied through your server. On your backend, add an endpoint that creates and returns a connection token.
  Future<TerminalConnectionToken> create({
    PostTerminalConnectionTokensBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/connection_tokens');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalConnectionToken.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalLocations {
  StripeApiClientV1TerminalLocations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of `Location` objects.
  Future<GetTerminalLocationsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/locations',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTerminalLocationsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new `Location` object. For further details, including which address fields are required in each country, see the [Manage locations](/docs/terminal/fleet/locations) guide.
  Future<TerminalLocation> create({
    required PostTerminalLocationsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/locations');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalLocation.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a `Location` object.
  Future<GetTerminalLocationsLocationResponse> retrieve({
    required String location,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/locations/$location',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTerminalLocationsLocationResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a `Location` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<PostTerminalLocationsLocationResponse> update({
    required String location,
    PostTerminalLocationsLocationBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/locations/$location');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PostTerminalLocationsLocationResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes a `Location` object.
  Future<DeletedTerminalLocation> delete({required String location}) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/locations/$location');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedTerminalLocation.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalReadersReaderCancelAction {
  StripeApiClientV1TerminalReadersReaderCancelAction({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancels the current reader action.
  Future<TerminalReader> cancel_action({
    required String reader,
    PostTerminalReadersReaderCancelActionBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/readers/$reader/cancel_action',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalReadersReaderProcessPaymentIntent {
  StripeApiClientV1TerminalReadersReaderProcessPaymentIntent({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Initiates a payment flow on a Reader.
  Future<TerminalReader> process_payment_intent({
    required String reader,
    required PostTerminalReadersReaderProcessPaymentIntentBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/readers/$reader/process_payment_intent',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalReadersReaderProcessSetupIntent {
  StripeApiClientV1TerminalReadersReaderProcessSetupIntent({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Initiates a setup intent flow on a Reader.
  Future<TerminalReader> process_setup_intent({
    required String reader,
    required PostTerminalReadersReaderProcessSetupIntentBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/readers/$reader/process_setup_intent',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalReadersReaderRefundPayment {
  StripeApiClientV1TerminalReadersReaderRefundPayment({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Initiates a refund on a Reader
  Future<TerminalReader> refund_payment({
    required String reader,
    PostTerminalReadersReaderRefundPaymentBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/readers/$reader/refund_payment',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalReadersReaderSetReaderDisplay {
  StripeApiClientV1TerminalReadersReaderSetReaderDisplay({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Sets reader display to show cart details.
  Future<TerminalReader> set_reader_display({
    required String reader,
    required PostTerminalReadersReaderSetReaderDisplayBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/readers/$reader/set_reader_display',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TerminalReadersReader {
  StripeApiClientV1TerminalReadersReader({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TerminalReadersReaderCancelAction get cancelAction =>
      StripeApiClientV1TerminalReadersReaderCancelAction(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TerminalReadersReaderProcessPaymentIntent
  get processPaymentIntent =>
      StripeApiClientV1TerminalReadersReaderProcessPaymentIntent(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TerminalReadersReaderProcessSetupIntent
  get processSetupIntent =>
      StripeApiClientV1TerminalReadersReaderProcessSetupIntent(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TerminalReadersReaderRefundPayment get refundPayment =>
      StripeApiClientV1TerminalReadersReaderRefundPayment(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TerminalReadersReaderSetReaderDisplay get setReaderDisplay =>
      StripeApiClientV1TerminalReadersReaderSetReaderDisplay(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TerminalReaders {
  StripeApiClientV1TerminalReaders({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of `Reader` objects.
  Future<GetTerminalReadersResponse> list({
    DeviceType_deviceType? deviceType,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? location,
    String? serialNumber,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (deviceType != null) {
      $queryParameters['device_type'] = deviceType.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (location != null) {
      $queryParameters['location'] = location;
    }
    if (serialNumber != null) {
      $queryParameters['serial_number'] = serialNumber;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/readers',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTerminalReadersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new `Reader` object.
  Future<TerminalReader> create({required PostTerminalReadersBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/readers');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a `Reader` object.
  Future<GetTerminalReadersReaderResponse> retrieve({
    required String reader,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/terminal/readers/$reader',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTerminalReadersReaderResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates a `Reader` object by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  Future<PostTerminalReadersReaderResponse> update({
    required String reader,
    PostTerminalReadersReaderBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/readers/$reader');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return PostTerminalReadersReaderResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes a `Reader` object.
  Future<DeletedTerminalReader> delete({required String reader}) async {
    final $uri = Uri.parse('$_baseUri/v1/terminal/readers/$reader');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedTerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TerminalReadersReader get reader =>
      StripeApiClientV1TerminalReadersReader(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Terminal {
  StripeApiClientV1Terminal({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TerminalConfigurations get configurations =>
      StripeApiClientV1TerminalConfigurations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TerminalConnectionTokens get connectionTokens =>
      StripeApiClientV1TerminalConnectionTokens(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TerminalLocations get locations =>
      StripeApiClientV1TerminalLocations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TerminalReaders get readers =>
      StripeApiClientV1TerminalReaders(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersConfirmationTokens {
  StripeApiClientV1TestHelpersConfirmationTokens({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a test mode Confirmation Token server side for your integration tests.
  Future<ConfirmationToken> create({
    PostTestHelpersConfirmationTokensBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/test_helpers/confirmation_tokens');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return ConfirmationToken.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersCustomersCustomerFundCashBalance {
  StripeApiClientV1TestHelpersCustomersCustomerFundCashBalance({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Create an incoming testmode bank transfer
  Future<CustomerCashBalanceTransaction> fund_cash_balance({
    required String customer,
    required PostTestHelpersCustomersCustomerFundCashBalanceBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/customers/$customer/fund_cash_balance',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return CustomerCashBalanceTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersCustomersCustomer {
  StripeApiClientV1TestHelpersCustomersCustomer({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersCustomersCustomerFundCashBalance
  get fundCashBalance =>
      StripeApiClientV1TestHelpersCustomersCustomerFundCashBalance(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersCustomers {
  StripeApiClientV1TestHelpersCustomers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersCustomersCustomer get customer =>
      StripeApiClientV1TestHelpersCustomersCustomer(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationCapture {
  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationCapture({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Capture a test-mode authorization.
  Future<IssuingAuthorization> capture({
    required String authorization,
    PostTestHelpersIssuingAuthorizationsAuthorizationCaptureBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/authorizations/$authorization/capture',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationExpire {
  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationExpire({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Expire a test-mode Authorization.
  Future<IssuingAuthorization> expire({
    required String authorization,
    PostTestHelpersIssuingAuthorizationsAuthorizationExpireBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/authorizations/$authorization/expire',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationIncrement {
  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationIncrement({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Increment a test-mode Authorization.
  Future<IssuingAuthorization> increment({
    required String authorization,
    required PostTestHelpersIssuingAuthorizationsAuthorizationIncrementBody
    body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/authorizations/$authorization/increment',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationReverse {
  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationReverse({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Reverse a test-mode Authorization.
  Future<IssuingAuthorization> reverse({
    required String authorization,
    PostTestHelpersIssuingAuthorizationsAuthorizationReverseBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/authorizations/$authorization/reverse',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorization {
  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorization({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationCapture
  get capture =>
      StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationCapture(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationExpire
  get expire =>
      StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationExpire(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationIncrement
  get increment =>
      StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationIncrement(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationReverse
  get reverse =>
      StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorizationReverse(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingAuthorizations {
  StripeApiClientV1TestHelpersIssuingAuthorizations({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Create a test-mode authorization.
  Future<IssuingAuthorization> create({
    required PostTestHelpersIssuingAuthorizationsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/test_helpers/issuing/authorizations');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingAuthorization.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorization
  get authorization =>
      StripeApiClientV1TestHelpersIssuingAuthorizationsAuthorization(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingCardsCardShippingDeliver {
  StripeApiClientV1TestHelpersIssuingCardsCardShippingDeliver({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Updates the shipping status of the specified Issuing `Card` object to `delivered`.
  Future<IssuingCard> deliver_card({
    required String card,
    PostTestHelpersIssuingCardsCardShippingDeliverBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/cards/$card/shipping/deliver',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCard.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingCardsCardShippingFail {
  StripeApiClientV1TestHelpersIssuingCardsCardShippingFail({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Updates the shipping status of the specified Issuing `Card` object to `failure`.
  Future<IssuingCard> fail_card({
    required String card,
    PostTestHelpersIssuingCardsCardShippingFailBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/cards/$card/shipping/fail',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCard.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingCardsCardShippingReturn {
  StripeApiClientV1TestHelpersIssuingCardsCardShippingReturn({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Updates the shipping status of the specified Issuing `Card` object to `returned`.
  Future<IssuingCard> return_card({
    required String card,
    PostTestHelpersIssuingCardsCardShippingReturnBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/cards/$card/shipping/return',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCard.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingCardsCardShippingShip {
  StripeApiClientV1TestHelpersIssuingCardsCardShippingShip({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Updates the shipping status of the specified Issuing `Card` object to `shipped`.
  Future<IssuingCard> ship_card({
    required String card,
    PostTestHelpersIssuingCardsCardShippingShipBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/cards/$card/shipping/ship',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingCard.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingCardsCardShipping {
  StripeApiClientV1TestHelpersIssuingCardsCardShipping({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingCardsCardShippingDeliver get deliver =>
      StripeApiClientV1TestHelpersIssuingCardsCardShippingDeliver(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingCardsCardShippingFail get fail =>
      StripeApiClientV1TestHelpersIssuingCardsCardShippingFail(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingCardsCardShippingReturn get return_ =>
      StripeApiClientV1TestHelpersIssuingCardsCardShippingReturn(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingCardsCardShippingShip get ship =>
      StripeApiClientV1TestHelpersIssuingCardsCardShippingShip(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingCardsCard {
  StripeApiClientV1TestHelpersIssuingCardsCard({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingCardsCardShipping get shipping =>
      StripeApiClientV1TestHelpersIssuingCardsCardShipping(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingCards {
  StripeApiClientV1TestHelpersIssuingCards({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingCardsCard get card =>
      StripeApiClientV1TestHelpersIssuingCardsCard(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignActivate {
  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignActivate({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Updates the `status` of the specified testmode personalization design object to `active`.
  Future<IssuingPersonalizationDesign> activate({
    required String personalizationDesign,
    PostTestHelpersIssuingPersonalizationDesignsPersonalizationDesignActivateBody?
    body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/personalization_designs/$personalizationDesign/activate',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingPersonalizationDesign.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignDeactivate {
  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignDeactivate({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Updates the `status` of the specified testmode personalization design object to `inactive`.
  Future<IssuingPersonalizationDesign> deactivate({
    required String personalizationDesign,
    PostTestHelpersIssuingPersonalizationDesignsPersonalizationDesignDeactivateBody?
    body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/personalization_designs/$personalizationDesign/deactivate',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingPersonalizationDesign.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignReject {
  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignReject({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Updates the `status` of the specified testmode personalization design object to `rejected`.
  Future<IssuingPersonalizationDesign> reject({
    required String personalizationDesign,
    required PostTestHelpersIssuingPersonalizationDesignsPersonalizationDesignRejectBody
    body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/personalization_designs/$personalizationDesign/reject',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingPersonalizationDesign.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesign {
  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesign({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignActivate
  get activate =>
      StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignActivate(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignDeactivate
  get deactivate =>
      StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignDeactivate(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignReject
  get reject =>
      StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesignReject(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingPersonalizationDesigns {
  StripeApiClientV1TestHelpersIssuingPersonalizationDesigns({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesign
  get personalizationDesign =>
      StripeApiClientV1TestHelpersIssuingPersonalizationDesignsPersonalizationDesign(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingTransactionsCreateForceCapture {
  StripeApiClientV1TestHelpersIssuingTransactionsCreateForceCapture({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Allows the user to capture an arbitrary amount, also known as a forced capture.
  Future<IssuingTransaction> create_force_capture({
    required PostTestHelpersIssuingTransactionsCreateForceCaptureBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/transactions/create_force_capture',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingTransactionsCreateUnlinkedRefund {
  StripeApiClientV1TestHelpersIssuingTransactionsCreateUnlinkedRefund({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Allows the user to refund an arbitrary amount, also known as a unlinked refund.
  Future<IssuingTransaction> create_unlinked_refund({
    required PostTestHelpersIssuingTransactionsCreateUnlinkedRefundBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/transactions/create_unlinked_refund',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingTransactionsTransactionRefund {
  StripeApiClientV1TestHelpersIssuingTransactionsTransactionRefund({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Refund a test-mode Transaction.
  Future<IssuingTransaction> refund({
    required String transaction,
    PostTestHelpersIssuingTransactionsTransactionRefundBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/issuing/transactions/$transaction/refund',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return IssuingTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersIssuingTransactionsTransaction {
  StripeApiClientV1TestHelpersIssuingTransactionsTransaction({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingTransactionsTransactionRefund get refund =>
      StripeApiClientV1TestHelpersIssuingTransactionsTransactionRefund(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuingTransactions {
  StripeApiClientV1TestHelpersIssuingTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingTransactionsCreateForceCapture
  get createForceCapture =>
      StripeApiClientV1TestHelpersIssuingTransactionsCreateForceCapture(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingTransactionsCreateUnlinkedRefund
  get createUnlinkedRefund =>
      StripeApiClientV1TestHelpersIssuingTransactionsCreateUnlinkedRefund(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingTransactionsTransaction get transaction =>
      StripeApiClientV1TestHelpersIssuingTransactionsTransaction(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersIssuing {
  StripeApiClientV1TestHelpersIssuing({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersIssuingAuthorizations get authorizations =>
      StripeApiClientV1TestHelpersIssuingAuthorizations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingCards get cards =>
      StripeApiClientV1TestHelpersIssuingCards(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingPersonalizationDesigns
  get personalizationDesigns =>
      StripeApiClientV1TestHelpersIssuingPersonalizationDesigns(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuingTransactions get transactions =>
      StripeApiClientV1TestHelpersIssuingTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersRefundsRefundExpire {
  StripeApiClientV1TestHelpersRefundsRefundExpire({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Expire a refund with a status of `requires_action`.
  Future<Refund> expire({
    required String refund,
    PostTestHelpersRefundsRefundExpireBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/test_helpers/refunds/$refund/expire');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Refund.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersRefundsRefund {
  StripeApiClientV1TestHelpersRefundsRefund({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersRefundsRefundExpire get expire =>
      StripeApiClientV1TestHelpersRefundsRefundExpire(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersRefunds {
  StripeApiClientV1TestHelpersRefunds({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersRefundsRefund get refund =>
      StripeApiClientV1TestHelpersRefundsRefund(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTerminalReadersReaderPresentPaymentMethod {
  StripeApiClientV1TestHelpersTerminalReadersReaderPresentPaymentMethod({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Presents a payment method on a simulated reader. Can be used to simulate accepting a payment, saving a card or refunding a transaction.
  Future<TerminalReader> present_payment_method({
    required String reader,
    PostTestHelpersTerminalReadersReaderPresentPaymentMethodBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/terminal/readers/$reader/present_payment_method',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TerminalReader.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTerminalReadersReader {
  StripeApiClientV1TestHelpersTerminalReadersReader({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTerminalReadersReaderPresentPaymentMethod
  get presentPaymentMethod =>
      StripeApiClientV1TestHelpersTerminalReadersReaderPresentPaymentMethod(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTerminalReaders {
  StripeApiClientV1TestHelpersTerminalReaders({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTerminalReadersReader get reader =>
      StripeApiClientV1TestHelpersTerminalReadersReader(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTerminal {
  StripeApiClientV1TestHelpersTerminal({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTerminalReaders get readers =>
      StripeApiClientV1TestHelpersTerminalReaders(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTestClocksTestClockAdvance {
  StripeApiClientV1TestHelpersTestClocksTestClockAdvance({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Starts advancing a test clock to a specified time in the future. Advancement is done when status changes to `Ready`.
  Future<TestHelpersTestClock> advance({
    required String testClock,
    required PostTestHelpersTestClocksTestClockAdvanceBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/test_clocks/$testClock/advance',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TestHelpersTestClock.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTestClocksTestClock {
  StripeApiClientV1TestHelpersTestClocksTestClock({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTestClocksTestClockAdvance get advance =>
      StripeApiClientV1TestHelpersTestClocksTestClockAdvance(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTestClocks {
  StripeApiClientV1TestHelpersTestClocks({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your test clocks.
  Future<GetTestHelpersTestClocksResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/test_clocks',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTestHelpersTestClocksResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new test clock that can be attached to new customers and quotes.
  Future<TestHelpersTestClock> create({
    required PostTestHelpersTestClocksBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/test_helpers/test_clocks');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TestHelpersTestClock.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a test clock.
  Future<TestHelpersTestClock> retrieve({
    required String testClock,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/test_clocks/$testClock',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TestHelpersTestClock.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Deletes a test clock.
  Future<DeletedTestHelpersTestClock> delete({
    required String testClock,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/test_helpers/test_clocks/$testClock');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedTestHelpersTestClock.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TestHelpersTestClocksTestClock get testClock =>
      StripeApiClientV1TestHelpersTestClocksTestClock(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTreasuryInboundTransfersIdFail {
  StripeApiClientV1TestHelpersTreasuryInboundTransfersIdFail({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created InboundTransfer to the `failed` status. The InboundTransfer must already be in the `processing` state.
  Future<TreasuryInboundTransfer> fail({
    required String id,
    PostTestHelpersTreasuryInboundTransfersIdFailBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/inbound_transfers/$id/fail',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryInboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryInboundTransfersIdReturn {
  StripeApiClientV1TestHelpersTreasuryInboundTransfersIdReturn({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Marks the test mode InboundTransfer object as returned and links the InboundTransfer to a ReceivedDebit. The InboundTransfer must already be in the `succeeded` state.
  Future<TreasuryInboundTransfer> return_inbound_transfer({
    required String id,
    PostTestHelpersTreasuryInboundTransfersIdReturnBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/inbound_transfers/$id/return',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryInboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryInboundTransfersIdSucceed {
  StripeApiClientV1TestHelpersTreasuryInboundTransfersIdSucceed({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created InboundTransfer to the `succeeded` status. The InboundTransfer must already be in the `processing` state.
  Future<TreasuryInboundTransfer> succeed({
    required String id,
    PostTestHelpersTreasuryInboundTransfersIdSucceedBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/inbound_transfers/$id/succeed',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryInboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryInboundTransfersId {
  StripeApiClientV1TestHelpersTreasuryInboundTransfersId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTreasuryInboundTransfersIdFail get fail =>
      StripeApiClientV1TestHelpersTreasuryInboundTransfersIdFail(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryInboundTransfersIdReturn get return_ =>
      StripeApiClientV1TestHelpersTreasuryInboundTransfersIdReturn(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryInboundTransfersIdSucceed get succeed =>
      StripeApiClientV1TestHelpersTreasuryInboundTransfersIdSucceed(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTreasuryInboundTransfers {
  StripeApiClientV1TestHelpersTreasuryInboundTransfers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTreasuryInboundTransfersId get id =>
      StripeApiClientV1TestHelpersTreasuryInboundTransfersId(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdFail {
  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdFail({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created OutboundPayment to the `failed` status. The OutboundPayment must already be in the `processing` state.
  Future<TreasuryOutboundPayment> fail({
    required String id,
    PostTestHelpersTreasuryOutboundPaymentsIdFailBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/outbound_payments/$id/fail',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundPayment.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdPost {
  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdPost({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created OutboundPayment to the `posted` status. The OutboundPayment must already be in the `processing` state.
  Future<TreasuryOutboundPayment> post({
    required String id,
    PostTestHelpersTreasuryOutboundPaymentsIdPostBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/outbound_payments/$id/post',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundPayment.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdReturn {
  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdReturn({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created OutboundPayment to the `returned` status. The OutboundPayment must already be in the `processing` state.
  Future<TreasuryOutboundPayment> return_outbound_payment({
    required String id,
    PostTestHelpersTreasuryOutboundPaymentsIdReturnBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/outbound_payments/$id/return',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundPayment.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryOutboundPaymentsId {
  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdFail get fail =>
      StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdFail(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdPost get post =>
      StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdPost(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdReturn get return_ =>
      StripeApiClientV1TestHelpersTreasuryOutboundPaymentsIdReturn(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTreasuryOutboundPayments {
  StripeApiClientV1TestHelpersTreasuryOutboundPayments({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTreasuryOutboundPaymentsId get id =>
      StripeApiClientV1TestHelpersTreasuryOutboundPaymentsId(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferFail {
  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferFail({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created OutboundTransfer to the `failed` status. The OutboundTransfer must already be in the `processing` state.
  Future<TreasuryOutboundTransfer> fail({
    required String outboundTransfer,
    PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/outbound_transfers/$outboundTransfer/fail',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferPost {
  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferPost({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created OutboundTransfer to the `posted` status. The OutboundTransfer must already be in the `processing` state.
  Future<TreasuryOutboundTransfer> post({
    required String outboundTransfer,
    PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/outbound_transfers/$outboundTransfer/post',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferReturn {
  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferReturn({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Transitions a test mode created OutboundTransfer to the `returned` status. The OutboundTransfer must already be in the `processing` state.
  Future<TreasuryOutboundTransfer> return_outbound_transfer({
    required String outboundTransfer,
    PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/outbound_transfers/$outboundTransfer/return',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransfer {
  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransfer({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferFail
  get fail =>
      StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferFail(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferPost
  get post =>
      StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferPost(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferReturn
  get return_ =>
      StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransferReturn(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTreasuryOutboundTransfers {
  StripeApiClientV1TestHelpersTreasuryOutboundTransfers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransfer
  get outboundTransfer =>
      StripeApiClientV1TestHelpersTreasuryOutboundTransfersOutboundTransfer(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpersTreasuryReceivedCredits {
  StripeApiClientV1TestHelpersTreasuryReceivedCredits({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Use this endpoint to simulate a test mode ReceivedCredit initiated by a third party. In live mode, you can’t directly create ReceivedCredits initiated by third parties.
  Future<TreasuryReceivedCredit> create({
    required PostTestHelpersTreasuryReceivedCreditsBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/received_credits',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryReceivedCredit.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasuryReceivedDebits {
  StripeApiClientV1TestHelpersTreasuryReceivedDebits({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Use this endpoint to simulate a test mode ReceivedDebit initiated by a third party. In live mode, you can’t directly create ReceivedDebits initiated by third parties.
  Future<TreasuryReceivedDebit> create({
    required PostTestHelpersTreasuryReceivedDebitsBody body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/test_helpers/treasury/received_debits',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryReceivedDebit.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TestHelpersTreasury {
  StripeApiClientV1TestHelpersTreasury({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersTreasuryInboundTransfers get inboundTransfers =>
      StripeApiClientV1TestHelpersTreasuryInboundTransfers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryOutboundPayments get outboundPayments =>
      StripeApiClientV1TestHelpersTreasuryOutboundPayments(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryOutboundTransfers get outboundTransfers =>
      StripeApiClientV1TestHelpersTreasuryOutboundTransfers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryReceivedCredits get receivedCredits =>
      StripeApiClientV1TestHelpersTreasuryReceivedCredits(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasuryReceivedDebits get receivedDebits =>
      StripeApiClientV1TestHelpersTreasuryReceivedDebits(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TestHelpers {
  StripeApiClientV1TestHelpers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TestHelpersConfirmationTokens get confirmationTokens =>
      StripeApiClientV1TestHelpersConfirmationTokens(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersCustomers get customers =>
      StripeApiClientV1TestHelpersCustomers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersIssuing get issuing =>
      StripeApiClientV1TestHelpersIssuing(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersRefunds get refunds =>
      StripeApiClientV1TestHelpersRefunds(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTerminal get terminal =>
      StripeApiClientV1TestHelpersTerminal(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTestClocks get testClocks =>
      StripeApiClientV1TestHelpersTestClocks(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TestHelpersTreasury get treasury =>
      StripeApiClientV1TestHelpersTreasury(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Tokens {
  StripeApiClientV1Tokens({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Creates a single-use token that represents a bank account’s details. You can use this token with any API method in place of a bank account dictionary. You can only use this token once. To do so, attach it to a [Custom account](#accounts).
  Future<Token> create({PostTokensBody? body}) async {
    final $uri = Uri.parse('$_baseUri/v1/tokens');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Token.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the token with the given ID.
  Future<Token> retrieve({required String token, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/tokens/$token',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Token.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TopupsTopupCancel {
  StripeApiClientV1TopupsTopupCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancels a top-up. Only pending top-ups can be canceled.
  Future<Topup> cancel({
    required String topup,
    PostTopupsTopupCancelBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/topups/$topup/cancel');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Topup.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TopupsTopup {
  StripeApiClientV1TopupsTopup({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TopupsTopupCancel get cancel =>
      StripeApiClientV1TopupsTopupCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Topups {
  StripeApiClientV1Topups({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of top-ups.
  Future<GetTopupsResponse> list({
    Amount_amount? amount,
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (amount != null) {
      $queryParameters['amount'] = amount.toString();
    }
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/topups',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTopupsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Top up the balance of an account
  Future<Topup> create({required PostTopupsBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/topups');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Topup.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a top-up that has previously been created. Supply the unique top-up ID that was returned from your previous request, and Stripe will return the corresponding top-up information.
  Future<Topup> retrieve({required String topup, List<String>? expand}) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/topups/$topup',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Topup.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the metadata of a top-up. Other top-up details are not editable by design.
  Future<Topup> update({
    required String topup,
    PostTopupsTopupBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/topups/$topup');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Topup.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TopupsTopup get topup =>
      StripeApiClientV1TopupsTopup(baseUri: _baseUri, httpClient: _httpClient);
}

class StripeApiClientV1TransfersIdReversals {
  StripeApiClientV1TransfersIdReversals({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// You can see a list of the reversals belonging to a specific transfer. Note that the 10 most recent reversals are always available by default on the transfer object. If you need more than those 10, you can use this API method and the `limit` and `starting_after` parameters to page through additional reversals.
  Future<GetTransfersIdReversalsResponse> list({
    required String id,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/transfers/$id/reversals',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTransfersIdReversalsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// When you create a new reversal, you must specify a transfer to create it on.
  ///
  /// When reversing transfers, you can optionally reverse part of the transfer. You can do so as many times as you wish until the entire transfer has been reversed.
  ///
  /// Once entirely reversed, a transfer can’t be reversed again. This method will return an error when called on an already-reversed transfer, or when trying to reverse more money than is left on a transfer.
  Future<TransferReversal> create({
    required String id,
    PostTransfersIdReversalsBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/transfers/$id/reversals');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TransferReversal.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TransfersId {
  StripeApiClientV1TransfersId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TransfersIdReversals get reversals =>
      StripeApiClientV1TransfersIdReversals(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TransfersTransferReversals {
  StripeApiClientV1TransfersTransferReversals({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// By default, you can see the 10 most recent reversals stored directly on the transfer object, but you can also retrieve details about a specific reversal stored on the transfer.
  Future<TransferReversal> retrieve({
    required String id,
    required String transfer,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/transfers/$transfer/reversals/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TransferReversal.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified reversal by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  ///
  /// This request only accepts metadata and description as arguments.
  Future<TransferReversal> update({
    required String id,
    required String transfer,
    PostTransfersTransferReversalsIdBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/transfers/$transfer/reversals/$id');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TransferReversal.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TransfersTransfer {
  StripeApiClientV1TransfersTransfer({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TransfersTransferReversals get reversals =>
      StripeApiClientV1TransfersTransferReversals(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1Transfers {
  StripeApiClientV1Transfers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of existing transfers sent to connected accounts. The transfers are returned in sorted order, with the most recently created transfers appearing first.
  Future<GetTransfersResponse> list({
    Created_created? created,
    String? destination,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
    String? transferGroup,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (destination != null) {
      $queryParameters['destination'] = destination;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (transferGroup != null) {
      $queryParameters['transfer_group'] = transferGroup;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/transfers',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTransfersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// To send funds from your Stripe account to a connected account, you create a new transfer object. Your [Stripe balance](#balance) must be able to cover the transfer amount, or you’ll receive an “Insufficient Funds” error.
  Future<Transfer> create({required PostTransfersBody body}) async {
    final $uri = Uri.parse('$_baseUri/v1/transfers');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Transfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing transfer. Supply the unique transfer ID from either a transfer creation request or the transfer list, and Stripe will return the corresponding transfer information.
  Future<Transfer> retrieve({
    required String transfer,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/transfers/$transfer',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Transfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the specified transfer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  ///
  /// This request accepts only metadata as an argument.
  Future<Transfer> update({
    required String transfer,
    PostTransfersTransferBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/transfers/$transfer');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return Transfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TransfersId get id =>
      StripeApiClientV1TransfersId(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1TransfersTransfer get transfer =>
      StripeApiClientV1TransfersTransfer(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryCreditReversals {
  StripeApiClientV1TreasuryCreditReversals({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of CreditReversals.
  Future<GetTreasuryCreditReversalsResponse> list({
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    String? receivedCredit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (receivedCredit != null) {
      $queryParameters['received_credit'] = receivedCredit;
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/credit_reversals',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryCreditReversalsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Reverses a ReceivedCredit and creates a CreditReversal object.
  Future<TreasuryCreditReversal> create({
    required PostTreasuryCreditReversalsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/treasury/credit_reversals');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryCreditReversal.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing CreditReversal by passing the unique CreditReversal ID from either the CreditReversal creation request or CreditReversal list
  Future<TreasuryCreditReversal> retrieve({
    required String creditReversal,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/credit_reversals/$creditReversal',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryCreditReversal.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryDebitReversals {
  StripeApiClientV1TreasuryDebitReversals({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of DebitReversals.
  Future<GetTreasuryDebitReversalsResponse> list({
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    String? receivedDebit,
    Resolution_resolution? resolution,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (receivedDebit != null) {
      $queryParameters['received_debit'] = receivedDebit;
    }
    if (resolution != null) {
      $queryParameters['resolution'] = resolution.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/debit_reversals',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryDebitReversalsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Reverses a ReceivedDebit and creates a DebitReversal object.
  Future<TreasuryDebitReversal> create({
    required PostTreasuryDebitReversalsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/treasury/debit_reversals');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryDebitReversal.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a DebitReversal object.
  Future<TreasuryDebitReversal> retrieve({
    required String debitReversal,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/debit_reversals/$debitReversal',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryDebitReversal.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryFinancialAccountsFinancialAccountFeatures {
  StripeApiClientV1TreasuryFinancialAccountsFinancialAccountFeatures({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves Features information associated with the FinancialAccount.
  Future<TreasuryFinancialAccountFeatures> retrieve_features({
    required String financialAccount,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/financial_accounts/$financialAccount/features',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryFinancialAccountFeatures.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the Features associated with a FinancialAccount.
  Future<TreasuryFinancialAccountFeatures> update_features({
    required String financialAccount,
    PostTreasuryFinancialAccountsFinancialAccountFeaturesBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/financial_accounts/$financialAccount/features',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryFinancialAccountFeatures.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryFinancialAccountsFinancialAccount {
  StripeApiClientV1TreasuryFinancialAccountsFinancialAccount({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TreasuryFinancialAccountsFinancialAccountFeatures
  get features =>
      StripeApiClientV1TreasuryFinancialAccountsFinancialAccountFeatures(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryFinancialAccounts {
  StripeApiClientV1TreasuryFinancialAccounts({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of FinancialAccounts.
  Future<GetTreasuryFinancialAccountsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/financial_accounts',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryFinancialAccountsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates a new FinancialAccount. For now, each connected account can only have one FinancialAccount.
  Future<TreasuryFinancialAccount> create({
    required PostTreasuryFinancialAccountsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/treasury/financial_accounts');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryFinancialAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of a FinancialAccount.
  Future<TreasuryFinancialAccount> retrieve({
    required String financialAccount,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/financial_accounts/$financialAccount',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryFinancialAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the details of a FinancialAccount.
  Future<TreasuryFinancialAccount> update({
    required String financialAccount,
    PostTreasuryFinancialAccountsFinancialAccountBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/financial_accounts/$financialAccount',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryFinancialAccount.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TreasuryFinancialAccountsFinancialAccount
  get financialAccount =>
      StripeApiClientV1TreasuryFinancialAccountsFinancialAccount(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryInboundTransfersInboundTransferCancel {
  StripeApiClientV1TreasuryInboundTransfersInboundTransferCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancels an InboundTransfer.
  Future<TreasuryInboundTransfer> cancel({
    required String inboundTransfer,
    PostTreasuryInboundTransfersInboundTransferCancelBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/inbound_transfers/$inboundTransfer/cancel',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryInboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryInboundTransfersInboundTransfer {
  StripeApiClientV1TreasuryInboundTransfersInboundTransfer({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TreasuryInboundTransfersInboundTransferCancel get cancel =>
      StripeApiClientV1TreasuryInboundTransfersInboundTransferCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryInboundTransfers {
  StripeApiClientV1TreasuryInboundTransfers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of InboundTransfers sent from the specified FinancialAccount.
  Future<GetTreasuryInboundTransfersResponse> list({
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/inbound_transfers',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryInboundTransfersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates an InboundTransfer.
  Future<TreasuryInboundTransfer> create({
    required PostTreasuryInboundTransfersBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/treasury/inbound_transfers');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryInboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing InboundTransfer.
  Future<TreasuryInboundTransfer> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/inbound_transfers/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryInboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TreasuryInboundTransfersInboundTransfer
  get inboundTransfer =>
      StripeApiClientV1TreasuryInboundTransfersInboundTransfer(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryOutboundPaymentsIdCancel {
  StripeApiClientV1TreasuryOutboundPaymentsIdCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Cancel an OutboundPayment.
  Future<TreasuryOutboundPayment> cancel({
    required String id,
    PostTreasuryOutboundPaymentsIdCancelBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/outbound_payments/$id/cancel',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundPayment.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryOutboundPaymentsId {
  StripeApiClientV1TreasuryOutboundPaymentsId({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TreasuryOutboundPaymentsIdCancel get cancel =>
      StripeApiClientV1TreasuryOutboundPaymentsIdCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryOutboundPayments {
  StripeApiClientV1TreasuryOutboundPayments({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of OutboundPayments sent from the specified FinancialAccount.
  Future<GetTreasuryOutboundPaymentsResponse> list({
    Created_created? created,
    String? customer,
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (customer != null) {
      $queryParameters['customer'] = customer;
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/outbound_payments',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryOutboundPaymentsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates an OutboundPayment.
  Future<TreasuryOutboundPayment> create({
    required PostTreasuryOutboundPaymentsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/treasury/outbound_payments');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundPayment.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing OutboundPayment by passing the unique OutboundPayment ID from either the OutboundPayment creation request or OutboundPayment list.
  Future<TreasuryOutboundPayment> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/outbound_payments/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundPayment.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TreasuryOutboundPaymentsId get id =>
      StripeApiClientV1TreasuryOutboundPaymentsId(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryOutboundTransfersOutboundTransferCancel {
  StripeApiClientV1TreasuryOutboundTransfersOutboundTransferCancel({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// An OutboundTransfer can be canceled if the funds have not yet been paid out.
  Future<TreasuryOutboundTransfer> cancel({
    required String outboundTransfer,
    PostTreasuryOutboundTransfersOutboundTransferCancelBody? body,
  }) async {
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/outbound_transfers/$outboundTransfer/cancel',
    );
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryOutboundTransfersOutboundTransfer {
  StripeApiClientV1TreasuryOutboundTransfersOutboundTransfer({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TreasuryOutboundTransfersOutboundTransferCancel get cancel =>
      StripeApiClientV1TreasuryOutboundTransfersOutboundTransferCancel(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryOutboundTransfers {
  StripeApiClientV1TreasuryOutboundTransfers({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of OutboundTransfers sent from the specified FinancialAccount.
  Future<GetTreasuryOutboundTransfersResponse> list({
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/outbound_transfers',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryOutboundTransfersResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Creates an OutboundTransfer.
  Future<TreasuryOutboundTransfer> create({
    required PostTreasuryOutboundTransfersBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/treasury/outbound_transfers');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing OutboundTransfer by passing the unique OutboundTransfer ID from either the OutboundTransfer creation request or OutboundTransfer list.
  Future<TreasuryOutboundTransfer> retrieve({
    required String outboundTransfer,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/outbound_transfers/$outboundTransfer',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryOutboundTransfer.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  StripeApiClientV1TreasuryOutboundTransfersOutboundTransfer
  get outboundTransfer =>
      StripeApiClientV1TreasuryOutboundTransfersOutboundTransfer(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1TreasuryReceivedCredits {
  StripeApiClientV1TreasuryReceivedCredits({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of ReceivedCredits.
  Future<GetTreasuryReceivedCreditsResponse> list({
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    LinkedFlows_linkedFlows? linkedFlows,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (linkedFlows != null) {
      $queryParameters['linked_flows'] = linkedFlows.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/received_credits',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryReceivedCreditsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing ReceivedCredit by passing the unique ReceivedCredit ID from the ReceivedCredit list.
  Future<TreasuryReceivedCredit> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/received_credits/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryReceivedCredit.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryReceivedDebits {
  StripeApiClientV1TreasuryReceivedDebits({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of ReceivedDebits.
  Future<GetTreasuryReceivedDebitsResponse> list({
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    String? startingAfter,
    Status_status? status,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/received_debits',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryReceivedDebitsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing ReceivedDebit by passing the unique ReceivedDebit ID from the ReceivedDebit list
  Future<TreasuryReceivedDebit> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/received_debits/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryReceivedDebit.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryTransactionEntries {
  StripeApiClientV1TreasuryTransactionEntries({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves a list of TransactionEntry objects.
  Future<GetTreasuryTransactionEntriesResponse> list({
    Created_created? created,
    EffectiveAt_effectiveAt? effectiveAt,
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    OrderBy_orderBy? orderBy,
    String? startingAfter,
    String? transaction,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (effectiveAt != null) {
      $queryParameters['effective_at'] = effectiveAt.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (orderBy != null) {
      $queryParameters['order_by'] = orderBy.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (transaction != null) {
      $queryParameters['transaction'] = transaction;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/transaction_entries',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryTransactionEntriesResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves a TransactionEntry object.
  Future<TreasuryTransactionEntry> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/transaction_entries/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryTransactionEntry.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1TreasuryTransactions {
  StripeApiClientV1TreasuryTransactions({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Retrieves a list of Transaction objects.
  Future<GetTreasuryTransactionsResponse> list({
    Created_created? created,
    String? endingBefore,
    List<String>? expand,
    required String financialAccount,
    int? limit,
    OrderBy_orderBy? orderBy,
    String? startingAfter,
    Status_status? status,
    StatusTransitions_statusTransitions? statusTransitions,
  }) async {
    final $queryParameters = <String, Object>{};
    if (created != null) {
      $queryParameters['created'] = created.toString();
    }
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    $queryParameters['financial_account'] = financialAccount;
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (orderBy != null) {
      $queryParameters['order_by'] = orderBy.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    if (status != null) {
      $queryParameters['status'] = status.toString();
    }
    if (statusTransitions != null) {
      $queryParameters['status_transitions'] = statusTransitions.toString();
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/transactions',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetTreasuryTransactionsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the details of an existing Transaction.
  Future<TreasuryTransaction> retrieve({
    required String id,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/treasury/transactions/$id',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return TreasuryTransaction.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1Treasury {
  StripeApiClientV1Treasury({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1TreasuryCreditReversals get creditReversals =>
      StripeApiClientV1TreasuryCreditReversals(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryDebitReversals get debitReversals =>
      StripeApiClientV1TreasuryDebitReversals(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryFinancialAccounts get financialAccounts =>
      StripeApiClientV1TreasuryFinancialAccounts(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryInboundTransfers get inboundTransfers =>
      StripeApiClientV1TreasuryInboundTransfers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryOutboundPayments get outboundPayments =>
      StripeApiClientV1TreasuryOutboundPayments(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryOutboundTransfers get outboundTransfers =>
      StripeApiClientV1TreasuryOutboundTransfers(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryReceivedCredits get receivedCredits =>
      StripeApiClientV1TreasuryReceivedCredits(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryReceivedDebits get receivedDebits =>
      StripeApiClientV1TreasuryReceivedDebits(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryTransactionEntries get transactionEntries =>
      StripeApiClientV1TreasuryTransactionEntries(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1TreasuryTransactions get transactions =>
      StripeApiClientV1TreasuryTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

class StripeApiClientV1WebhookEndpoints {
  StripeApiClientV1WebhookEndpoints({
    required _$http.Client httpClient,
    required Uri baseUri,
  }) : _httpClient = httpClient,
       _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  /// Returns a list of your webhook endpoints.
  Future<GetWebhookEndpointsResponse> list({
    String? endingBefore,
    List<String>? expand,
    int? limit,
    String? startingAfter,
  }) async {
    final $queryParameters = <String, Object>{};
    if (endingBefore != null) {
      $queryParameters['ending_before'] = endingBefore;
    }
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    if (limit != null) {
      $queryParameters['limit'] = limit.toString();
    }
    if (startingAfter != null) {
      $queryParameters['starting_after'] = startingAfter;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/webhook_endpoints',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return GetWebhookEndpointsResponse.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// A webhook endpoint must have a `url` and a list of `enabled_events`. You may optionally specify the Boolean `connect` parameter. If set to true, then a Connect webhook endpoint that notifies the specified `url` about events from all connected accounts is created; otherwise an account webhook endpoint that notifies the specified `url` only about events from your account is created. You can also create webhook endpoints in the [webhooks settings](https://dashboard.stripe.com/account/webhooks) section of the Dashboard.
  Future<WebhookEndpoint> create({
    required PostWebhookEndpointsBody body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/webhook_endpoints');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    $request.body = _$convert.jsonEncode(body);
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return WebhookEndpoint.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Retrieves the webhook endpoint with the given ID.
  Future<WebhookEndpoint> retrieve({
    required String webhookEndpoint,
    List<String>? expand,
  }) async {
    final $queryParameters = <String, Object>{};
    if (expand != null) {
      $queryParameters['expand'] = expand;
    }
    final $uri = Uri.parse(
      '$_baseUri/v1/webhook_endpoints/$webhookEndpoint',
    ).replace(queryParameters: $queryParameters);
    final $request = _$http.Request('GET', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return WebhookEndpoint.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// Updates the webhook endpoint. You may edit the `url`, the list of `enabled_events`, and the status of your endpoint.
  Future<WebhookEndpoint> update({
    required String webhookEndpoint,
    PostWebhookEndpointsWebhookEndpointBody? body,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/webhook_endpoints/$webhookEndpoint');
    final $request = _$http.Request('POST', $uri);
    $request.headers['accept'] = 'application/json';
    if (body != null) {
      $request.body = _$convert.jsonEncode(body);
    }
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return WebhookEndpoint.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }

  /// You can also delete webhook endpoints via the [webhook endpoint management](https://dashboard.stripe.com/account/webhooks) page of the Stripe dashboard.
  Future<DeletedWebhookEndpoint> delete({
    required String webhookEndpoint,
  }) async {
    final $uri = Uri.parse('$_baseUri/v1/webhook_endpoints/$webhookEndpoint');
    final $request = _$http.Request('DELETE', $uri);
    $request.headers['accept'] = 'application/json';
    final $response = await _httpClient.send($request);
    final $body = await $response.stream.bytesToString();
    switch ($response.statusCode) {
      /// Successful response.
      case 200:
        final $json = _$convert.jsonDecode($body);
        return DeletedWebhookEndpoint.fromJson($json);

      /// Error response.
      case _:
        final $json = _$convert.jsonDecode($body);
        throw Error.fromJson($json);
    }
  }
}

class StripeApiClientV1 {
  StripeApiClientV1({required _$http.Client httpClient, required Uri baseUri})
    : _httpClient = httpClient,
      _baseUri = baseUri;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1Account get account =>
      StripeApiClientV1Account(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1AccountLinks get accountLinks =>
      StripeApiClientV1AccountLinks(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1AccountSessions get accountSessions =>
      StripeApiClientV1AccountSessions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Accounts get accounts =>
      StripeApiClientV1Accounts(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1ApplePay get applePay =>
      StripeApiClientV1ApplePay(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1ApplicationFees get applicationFees =>
      StripeApiClientV1ApplicationFees(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Apps get apps =>
      StripeApiClientV1Apps(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Balance get balance =>
      StripeApiClientV1Balance(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1BalanceTransactions get balanceTransactions =>
      StripeApiClientV1BalanceTransactions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Billing get billing =>
      StripeApiClientV1Billing(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1BillingPortal get billingPortal =>
      StripeApiClientV1BillingPortal(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Charges get charges =>
      StripeApiClientV1Charges(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Checkout get checkout =>
      StripeApiClientV1Checkout(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Climate get climate =>
      StripeApiClientV1Climate(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1ConfirmationTokens get confirmationTokens =>
      StripeApiClientV1ConfirmationTokens(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1CountrySpecs get countrySpecs =>
      StripeApiClientV1CountrySpecs(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Coupons get coupons =>
      StripeApiClientV1Coupons(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1CreditNotes get creditNotes =>
      StripeApiClientV1CreditNotes(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1CustomerSessions get customerSessions =>
      StripeApiClientV1CustomerSessions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Customers get customers =>
      StripeApiClientV1Customers(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Disputes get disputes =>
      StripeApiClientV1Disputes(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1EphemeralKeys get ephemeralKeys =>
      StripeApiClientV1EphemeralKeys(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Events get events =>
      StripeApiClientV1Events(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1ExchangeRates get exchangeRates =>
      StripeApiClientV1ExchangeRates(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1FileLinks get fileLinks =>
      StripeApiClientV1FileLinks(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Files get files =>
      StripeApiClientV1Files(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1FinancialConnections get financialConnections =>
      StripeApiClientV1FinancialConnections(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Forwarding get forwarding =>
      StripeApiClientV1Forwarding(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Identity get identity =>
      StripeApiClientV1Identity(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Invoiceitems get invoiceitems =>
      StripeApiClientV1Invoiceitems(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Invoices get invoices =>
      StripeApiClientV1Invoices(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Issuing get issuing =>
      StripeApiClientV1Issuing(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Mandates get mandates =>
      StripeApiClientV1Mandates(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1PaymentIntents get paymentIntents =>
      StripeApiClientV1PaymentIntents(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentLinks get paymentLinks =>
      StripeApiClientV1PaymentLinks(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1PaymentMethodConfigurations
  get paymentMethodConfigurations =>
      StripeApiClientV1PaymentMethodConfigurations(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentMethodDomains get paymentMethodDomains =>
      StripeApiClientV1PaymentMethodDomains(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1PaymentMethods get paymentMethods =>
      StripeApiClientV1PaymentMethods(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Payouts get payouts =>
      StripeApiClientV1Payouts(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Plans get plans =>
      StripeApiClientV1Plans(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Prices get prices =>
      StripeApiClientV1Prices(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Products get products =>
      StripeApiClientV1Products(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1PromotionCodes get promotionCodes =>
      StripeApiClientV1PromotionCodes(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Quotes get quotes =>
      StripeApiClientV1Quotes(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Radar get radar =>
      StripeApiClientV1Radar(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Refunds get refunds =>
      StripeApiClientV1Refunds(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Reporting get reporting =>
      StripeApiClientV1Reporting(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Reviews get reviews =>
      StripeApiClientV1Reviews(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1SetupAttempts get setupAttempts =>
      StripeApiClientV1SetupAttempts(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SetupIntents get setupIntents =>
      StripeApiClientV1SetupIntents(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1ShippingRates get shippingRates =>
      StripeApiClientV1ShippingRates(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Sigma get sigma =>
      StripeApiClientV1Sigma(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Sources get sources =>
      StripeApiClientV1Sources(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1SubscriptionItems get subscriptionItems =>
      StripeApiClientV1SubscriptionItems(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1SubscriptionSchedules get subscriptionSchedules =>
      StripeApiClientV1SubscriptionSchedules(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Subscriptions get subscriptions =>
      StripeApiClientV1Subscriptions(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );

  StripeApiClientV1Tax get tax =>
      StripeApiClientV1Tax(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1TaxCodes get taxCodes =>
      StripeApiClientV1TaxCodes(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1TaxIds get taxIds =>
      StripeApiClientV1TaxIds(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1TaxRates get taxRates =>
      StripeApiClientV1TaxRates(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Terminal get terminal =>
      StripeApiClientV1Terminal(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1TestHelpers get testHelpers =>
      StripeApiClientV1TestHelpers(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Tokens get tokens =>
      StripeApiClientV1Tokens(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Topups get topups =>
      StripeApiClientV1Topups(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Transfers get transfers =>
      StripeApiClientV1Transfers(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1Treasury get treasury =>
      StripeApiClientV1Treasury(baseUri: _baseUri, httpClient: _httpClient);

  StripeApiClientV1WebhookEndpoints get webhookEndpoints =>
      StripeApiClientV1WebhookEndpoints(
        baseUri: _baseUri,
        httpClient: _httpClient,
      );
}

final class StripeApiClient {
  StripeApiClient({_$http.Client? httpClient, Uri? baseUri})
    : _httpClient = httpClient ?? _$http.Client(),
      _baseUri = baseUri ?? StripeApiServers.defaultServer;

  final _$http.Client _httpClient;

  /// The base URI for the API
  final Uri _baseUri;

  StripeApiClientV1 get v1 =>
      StripeApiClientV1(baseUri: _baseUri, httpClient: _httpClient);
}
