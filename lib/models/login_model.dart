class LoginModel {

  Data? data;
  String? token;

  LoginModel({ this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? phone;
  String? username;
  bool? active;
  int? birthday;
  int? created;
  String? password;
  String? token;
  int? lastLogin;
  String? photo;

  Data(
      {this.sId,
      this.email,
      this.phone,
      this.username,
      this.active,
      this.birthday,
      this.created,
      this.password,
      this.token,
      this.lastLogin,
      this.photo});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    active = json['active'];
    created = json['createdAt'];
    password = json['password'];
    token = json['token'];
    lastLogin = json['last_login'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['username'] = this.username;
    data['active'] = this.active;
    data['createdAt'] = this.created;
    data['password'] = this.password;
    data['token'] = this.token;
    data['last_login'] = this.lastLogin;
    data['photo'] = this.photo;
    return data;
  }
}