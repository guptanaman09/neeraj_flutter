///Created by Naman Gupta on 26/4/21.

// To parse this JSON data, do
//
//     final agentDetail = agentDetailFromMap(jsonString);

import 'dart:convert';

AgentDetail agentDetailFromMap(String str) =>
    AgentDetail.fromMap(json.decode(str));

String agentDetailToMap(AgentDetail data) => json.encode(data.toMap());

class AgentDetail {
  AgentDetail({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  Result? result;
  dynamic targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  factory AgentDetail.fromMap(Map<String, dynamic> json) => AgentDetail(
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
        targetUrl: json["targetUrl"],
        success: json["success"] == null ? null : json["success"],
        error: json["error"],
        unAuthorizedRequest: json["unAuthorizedRequest"] == null
            ? null
            : json["unAuthorizedRequest"],
        abp: json["__abp"] == null ? null : json["__abp"],
      );

  Map<String, dynamic> toMap() => {
        "result": result == null ? null : result!.toMap(),
        "targetUrl": targetUrl,
        "success": success == null ? null : success,
        "error": error,
        "unAuthorizedRequest":
            unAuthorizedRequest == null ? null : unAuthorizedRequest,
        "__abp": abp == null ? null : abp,
      };
}

class Result {
  Result({
    this.isSuccessful,
    this.responseMessage,
    this.agentdetailByEmailModels,
  });

  bool? isSuccessful;
  dynamic responseMessage;
  AgentdetailByEmailModels? agentdetailByEmailModels;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        isSuccessful:
            json["isSuccessful"] == null ? null : json["isSuccessful"],
        responseMessage: json["responseMessage"],
        agentdetailByEmailModels: json["agentdetailByEmailModels"] == null
            ? null
            : AgentdetailByEmailModels.fromMap(
                json["agentdetailByEmailModels"]),
      );

  Map<String, dynamic> toMap() => {
        "isSuccessful": isSuccessful == null ? null : isSuccessful,
        "responseMessage": responseMessage,
        "agentdetailByEmailModels": agentdetailByEmailModels == null
            ? null
            : agentdetailByEmailModels!.toMap(),
      };
}

class AgentdetailByEmailModels {
  AgentdetailByEmailModels({
    this.tqsyscode,
    this.accounttype,
    this.agenttype,
    this.agentcode,
    this.address,
    this.email,
    this.telephone,
    this.agNName,
  });

  String? tqsyscode;
  String? accounttype;
  String? agenttype;
  String? agentcode;
  String? address;
  String? email;
  String? telephone;
  String? agNName;

  factory AgentdetailByEmailModels.fromMap(Map<String, dynamic> json) =>
      AgentdetailByEmailModels(
        tqsyscode: json["tqsyscode"] == null ? null : json["tqsyscode"],
        accounttype: json["accounttype"] == null ? null : json["accounttype"],
        agenttype: json["agenttype"] == null ? null : json["agenttype"],
        agentcode: json["agentcode"] == null ? null : json["agentcode"],
        address: json["address"] == null ? null : json["address"],
        email: json["email"] == null ? null : json["email"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        agNName: json["agN_NAME"] == null ? null : json["agN_NAME"],
      );

  Map<String, dynamic> toMap() => {
        "tqsyscode": tqsyscode == null ? null : tqsyscode,
        "accounttype": accounttype == null ? null : accounttype,
        "agenttype": agenttype == null ? null : agenttype,
        "agentcode": agentcode == null ? null : agentcode,
        "address": address == null ? null : address,
        "email": email == null ? null : email,
        "telephone": telephone == null ? null : telephone,
        "agN_NAME": agNName == null ? null : agNName,
      };
}
