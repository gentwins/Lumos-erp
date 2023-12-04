import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AuthenticationCall {
  static Future<ApiCallResponse> call({
    String? userName = '',
    String? password = '',
    String? companyCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_name": "${userName}",
  "password": "${password}",
  "company_code": "${companyCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Authentication',
      apiUrl: 'https://dev.lumosis.vn/ords/dev_q7/mobile_api/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class GusListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GUS LIST',
      apiUrl: 'https://dev.lumosis.vn/ords/dev_q7/mobile_api/get_user_group',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class MenuListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? gusId,
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "gus_id": ${gusId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MENU LIST',
      apiUrl: 'https://dev.lumosis.vn/ords/dev_q7/mobile_api/get_menu',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class PihListCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? gusId,
    int? ounId,
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "gus_id": ${gusId},
  "oun_id": ${ounId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PIH LIST',
      apiUrl: 'https://dev.lumosis.vn/ords/dev_q7/mobile_api/mob_inv_001',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class CheckKkCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? gusId,
    int? ounId,
    int? pihId,
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "gus_id": ${gusId},
  "oun_id": ${ounId},
  "pih_id": ${pihId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CHECK KK',
      apiUrl:
          'https://dev.lumosis.vn/ords/dev_q7/mobile_api/mob_inv_001_detail',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class ScanCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? gusId,
    int? ounId,
    int? pihId,
    String? scanCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "gus_id": ${gusId},
  "oun_id": ${ounId},
  "pih_id": ${pihId},
  "code": "${scanCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SCAN',
      apiUrl: 'https://dev.lumosis.vn/ords/dev_q7/mobile_api/mob_inv_001_scan',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
