/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaS10aWdvLm5ld3dlYi52bi9jbGllbnQvYXV0aC9sb2dpbiIsImlhdCI6MTY5MTgwMDg1MiwiZXhwIjoxNzIzMzM2ODUyLCJuYmYiOjE2OTE4MDA4NTIsImp0aSI6IjdnVjRKSmFKc0FyUGdUaGQiLCJzdWIiOjQ3MDE5LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.rQr2cX0-bBG168ovp3ZG3vZiYcOg1Z2dhLKjjvcG5G4"
/// user_id : 47019
/// user_type : "CUSTOMER"
/// role_id : 4
/// role_code : "GUEST"
/// role_name : "Khách hàng"
/// account_status : "pending"
/// group_code : "GUEST"

class SignInModel {
  SignInModel({
      this.token, 
      this.userId, 
      this.userType, 
      this.roleId, 
      this.roleCode, 
      this.roleName, 
      this.accountStatus, 
      this.groupCode,});

  SignInModel.fromJson(dynamic json) {
    token = json['token'];
    userId = json['user_id'];
    userType = json['user_type'];
    roleId = json['role_id'];
    roleCode = json['role_code'];
    roleName = json['role_name'];
    accountStatus = json['account_status'];
    groupCode = json['group_code'];
  }
  String? token;
  num? userId;
  String? userType;
  num? roleId;
  String? roleCode;
  String? roleName;
  String? accountStatus;
  String? groupCode;
SignInModel copyWith({  String? token,
  num? userId,
  String? userType,
  num? roleId,
  String? roleCode,
  String? roleName,
  String? accountStatus,
  String? groupCode,
}) => SignInModel(  token: token ?? this.token,
  userId: userId ?? this.userId,
  userType: userType ?? this.userType,
  roleId: roleId ?? this.roleId,
  roleCode: roleCode ?? this.roleCode,
  roleName: roleName ?? this.roleName,
  accountStatus: accountStatus ?? this.accountStatus,
  groupCode: groupCode ?? this.groupCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['user_id'] = userId;
    map['user_type'] = userType;
    map['role_id'] = roleId;
    map['role_code'] = roleCode;
    map['role_name'] = roleName;
    map['account_status'] = accountStatus;
    map['group_code'] = groupCode;
    return map;
  }

}