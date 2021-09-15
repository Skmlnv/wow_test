class SendCodeModel {
  String? status;
  String? tokenType;
  String? accessToken;
  String? refreshToken;
  Error? error;

  SendCodeModel(
      {this.status,
      this.tokenType,
      this.accessToken,
      this.refreshToken,
      this.error});

  SendCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    tokenType = json['token_type'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token_type'] = this.tokenType;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Error {
  int? code;
  String? message;

  Error({
    this.code,
    this.message,
  });

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
