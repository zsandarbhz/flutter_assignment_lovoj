class ForgetPasswordModel {
  String? message;
  ForgetPasswordResponse? response;
  int? status;

  ForgetPasswordModel({this.message, this.response, this.status});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    response = json['Response'] != null
        ? new ForgetPasswordResponse.fromJson(json['Response'])
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

class ForgetPasswordResponse {
  List<IdList>? idList;

  ForgetPasswordResponse({this.idList});

  ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    if (json['IdList'] != null) {
      idList = <IdList>[];
      json['IdList'].forEach((v) {
        idList!.add(new IdList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.idList != null) {
      data['IdList'] = this.idList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IdList {
  String? firstName;
  String? lastName;
  String? middleName;
  String? mobileNo;
  String? otp;

  IdList(
      {this.firstName,
        this.lastName,
        this.middleName,
        this.mobileNo,
        this.otp});

  IdList.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    middleName = json['MiddleName'];
    mobileNo = json['MobileNo'];
    otp = json['Otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['MiddleName'] = this.middleName;
    data['MobileNo'] = this.mobileNo;
    data['Otp'] = this.otp;
    return data;
  }
}
