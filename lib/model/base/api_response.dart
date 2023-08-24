class ApiResponse {
  String? message;
  dynamic data;
  bool? status;

  ApiResponse({this.message,  this.status, this.data,});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['status'] = this.status;
    return data;
  }

  set setResponse(dynamic newData){
    data = newData;
  }
}
