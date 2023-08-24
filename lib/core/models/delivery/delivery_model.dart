class DeliveryModel {
  String? message;
  DeliveryResponse? response;
  int? status;

  DeliveryModel({this.message, this.response, this.status});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    response = json['Response'] != null
        ? new DeliveryResponse.fromJson(json['Response'])
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

class DeliveryResponse {
  List<AllotedDetailList>? allotedDetailList;

  DeliveryResponse({this.allotedDetailList});

  DeliveryResponse.fromJson(Map<String, dynamic> json) {
    if (json['AllotedDetailList'] != null) {
      allotedDetailList = <AllotedDetailList>[];
      json['AllotedDetailList'].forEach((v) {
        allotedDetailList!.add(new AllotedDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allotedDetailList != null) {
      data['AllotedDetailList'] =
          this.allotedDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllotedDetailList {
  String? address;
  String? city;
  String? date;
  String? hotelName;
  String? image;
  String? mobileNo;
  String? oTP;
  String? orderNo;
  String? pinCode;
  String? state;
  String? status;

  AllotedDetailList(
      {this.address,
        this.city,
        this.date,
        this.hotelName,
        this.image,
        this.mobileNo,
        this.oTP,
        this.orderNo,
        this.pinCode,
        this.state,
        this.status});

  AllotedDetailList.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    city = json['City'];
    date = json['Date'];
    hotelName = json['HotelName'];
    image = json['Image'];
    mobileNo = json['MobileNo'];
    oTP = json['OTP'];
    orderNo = json['OrderNo'];
    pinCode = json['PinCode'];
    state = json['State'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Address'] = this.address;
    data['City'] = this.city;
    data['Date'] = this.date;
    data['HotelName'] = this.hotelName;
    data['Image'] = this.image;
    data['MobileNo'] = this.mobileNo;
    data['OTP'] = this.oTP;
    data['OrderNo'] = this.orderNo;
    data['PinCode'] = this.pinCode;
    data['State'] = this.state;
    data['Status'] = this.status;
    return data;
  }
}
