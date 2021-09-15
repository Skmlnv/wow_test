class SendSMSModel {
  String? status;
  Error? error;

  SendSMSModel({
    this.status,
    this.error,
  });

  SendSMSModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
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
