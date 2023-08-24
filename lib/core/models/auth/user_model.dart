class UserModel {
  bool? success;
  String? message;
  String? token;
  UserData? user;
  String? deviceToken;

  UserModel(
      {this.success, this.message, this.token, this.user, this.deviceToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}

class UserData {
  String? sId;
  String? storeId;
  String? storeNumber;
  String? email;
  String? mobileNumber;
  String? name;
  String? storeType;
  String? role;
  List<dynamic>? associate;
  List<dynamic>? associated;
  bool? personalProfileStatus;
  bool? businessProfileStatus;
  bool? profilePhotoStatus;
  bool? profileSignatureStatus;
  bool? profileFactoryStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserData(
      {this.sId,
        this.storeId,
        this.storeNumber,
        this.email,
        this.mobileNumber,
        this.name,
        this.storeType,
        this.role,
        this.associate,
        this.associated,
        this.personalProfileStatus,
        this.businessProfileStatus,
        this.profilePhotoStatus,
        this.profileSignatureStatus,
        this.profileFactoryStatus,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    storeId = json['storeId'];
    storeNumber = json['storeNumber'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    name = json['name'];
    storeType = json['storeType'];
    role = json['role'];
    if (json['Associate'] != null) {
      associate = <dynamic>[];
      json['Associate'].forEach((v) {
        // associate!.add(new Null.fromJson(v));
      });
    }
    if (json['Associated'] != null) {
      associated = <dynamic>[];
      json['Associated'].forEach((v) {
        // associated!.add(new Null.fromJson(v));
      });
    }
    personalProfileStatus = json['personalProfileStatus'];
    businessProfileStatus = json['businessProfileStatus'];
    profilePhotoStatus = json['profilePhotoStatus'];
    profileSignatureStatus = json['profileSignatureStatus'];
    profileFactoryStatus = json['profileFactoryStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['storeId'] = this.storeId;
    data['storeNumber'] = this.storeNumber;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['name'] = this.name;
    data['storeType'] = this.storeType;
    data['role'] = this.role;
    if (this.associate != null) {
      data['Associate'] = this.associate!.map((v) => v.toJson()).toList();
    }
    if (this.associated != null) {
      data['Associated'] = this.associated!.map((v) => v.toJson()).toList();
    }
    data['personalProfileStatus'] = this.personalProfileStatus;
    data['businessProfileStatus'] = this.businessProfileStatus;
    data['profilePhotoStatus'] = this.profilePhotoStatus;
    data['profileSignatureStatus'] = this.profileSignatureStatus;
    data['profileFactoryStatus'] = this.profileFactoryStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
