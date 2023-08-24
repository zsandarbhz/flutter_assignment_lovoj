class OtpVerifyModel {
  String? message;
  OtpResponse? response;
  int? status;

  OtpVerifyModel({this.message, this.response, this.status});

  OtpVerifyModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    response = json['Response'] != null
        ? new OtpResponse.fromJson(json['Response'])
        : null;
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    if (this.response != null) {
      data['Response'] = this.response!.toJson();
    }
    data['Status'] = this.status;
    return data;
  }
}

class OtpResponse {
  String? deviceId;
  String? deviceToken;
  String? loginFrom;
  String? mobileNo;
  String? password;
  String? token;
  String? entityId;
  String? firstName;
  String? lastName;
  String? middleName;

  OtpResponse(
      {this.deviceId,
        this.deviceToken,
        this.loginFrom,
        this.mobileNo,
        this.password,
        this.token,
        this.entityId,
        this.firstName,
        this.lastName,
        this.middleName});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    deviceId = json['DeviceId'];
    deviceToken = json['DeviceToken'];
    loginFrom = json['LoginFrom'];
    mobileNo = json['MobileNo'];
    password = json['Password'];
    token = json['Token'];
    entityId = json['entityId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceId'] = this.deviceId;
    data['DeviceToken'] = this.deviceToken;
    data['LoginFrom'] = this.loginFrom;
    data['MobileNo'] = this.mobileNo;
    data['Password'] = this.password;
    data['Token'] = this.token;
    data['entityId'] = this.entityId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    return data;
  }
}
