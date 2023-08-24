class DashboardModel {
  int? deliveredCount;
  String? message;
  int? pendingCount;
  Response? response;
  int? status;

  DashboardModel(
      {this.deliveredCount,
        this.message,
        this.pendingCount,
        this.response,
        this.status});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    deliveredCount = json['DeliveredCount'];
    message = json['Message'];
    pendingCount = json['PendingCount'];
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeliveredCount'] = this.deliveredCount;
    data['Message'] = this.message;
    data['PendingCount'] = this.pendingCount;
    if (this.response != null) {
      data['Response'] = this.response!.toJson();
    }
    data['Status'] = this.status;
    return data;
  }
}

class Response {
  List<ListEmployeeOrder>? listEmployeeOrder;

  Response({this.listEmployeeOrder});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['listEmployeeOrder'] != null) {
      listEmployeeOrder = <ListEmployeeOrder>[];
      json['listEmployeeOrder'].forEach((v) {
        listEmployeeOrder!.add(new ListEmployeeOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listEmployeeOrder != null) {
      data['listEmployeeOrder'] =
          this.listEmployeeOrder!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListEmployeeOrder {
  String? hotelName;
  String? orderDate;
  String? orderNo;
  String? orderStatus;

  ListEmployeeOrder(
      {this.hotelName, this.orderDate, this.orderNo, this.orderStatus});

  ListEmployeeOrder.fromJson(Map<String, dynamic> json) {
    hotelName = json['HotelName'];
    orderDate = json['OrderDate'];
    orderNo = json['OrderNo'];
    orderStatus = json['OrderStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HotelName'] = this.hotelName;
    data['OrderDate'] = this.orderDate;
    data['OrderNo'] = this.orderNo;
    data['OrderStatus'] = this.orderStatus;
    return data;
  }
}
