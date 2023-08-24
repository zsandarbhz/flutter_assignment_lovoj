class CreatePasswordModel {
  String? message;
  CreatePasswordResponse? response;
  int? status;

  CreatePasswordModel({this.message, this.response, this.status});

  CreatePasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    response = json['Response'] != null
        ? new CreatePasswordResponse.fromJson(json['Response'])
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

class CreatePasswordResponse {
  String? newPassword;

  CreatePasswordResponse({this.newPassword});

  CreatePasswordResponse.fromJson(Map<String, dynamic> json) {
    newPassword = json['NewPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NewPassword'] = this.newPassword;
    return data;
  }
}
