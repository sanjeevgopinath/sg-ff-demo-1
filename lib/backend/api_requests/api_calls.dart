import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class FusionPostCall {
  static Future<ApiCallResponse> call({
    String? paymentMethodLookupCode = '',
    double? exchangeRate,
    String? description = '',
    String? vendorId = '',
    String? invoiceTypeLookupCode = '',
    String? invoiceAmount = '',
    String? source = '',
    String? requestorId = '',
    String? termsName = '',
    String? invoiceDate = '',
    String? prePayApplyAmount = '',
    String? rateType = '',
    String? vendorSiteCode = '',
    String? prepayDistNum = '',
    String? invoiceReceivedDate = '',
    String? ibpbTransactionNum = '',
    bool? assetsTrackingFlag,
  }) async {
    final ffApiRequestBody = '''
{
  "PaymentMethodLookupCode": "$paymentMethodLookupCode",
  "ExchangeRate": "$exchangeRate",
  "Description": "$description",
  "VendorId": "$vendorId",
  "InvoiceTypeLookupCode": "$invoiceTypeLookupCode",
  "InvoiceAmount": "$invoiceAmount",
  "Source": "$source",
  "RequestorId": "$requestorId",
  "TermsName": "$termsName",
  "InvoiceDate": "$invoiceDate",
  "PrePayApplyAmount": null,
  "RateType": "$rateType",
  "VendorSiteCode": null,
  "PrepayDistNum": null,
  "InvoiceReceivedDate": "$invoiceReceivedDate",
  "IbpbTransactionNum": "$ibpbTransactionNum",
  "AssetsTrackingFlag": "$assetsTrackingFlag"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FusionPost',
      apiUrl:
          'https://aboitizpower-oic-uat-axhknnpmgslz-px.integration.ocp.oraclecloud.com:443/ic/api/integration/v1/flows/rest/FIN_312_INVCAS_PTRS_INBOUN/1.0/createInvo',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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
