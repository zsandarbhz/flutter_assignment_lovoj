class ChangePasswordModel {
  String? message;
  int? status;

  ChangePasswordModel({this.message, this.status});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}

