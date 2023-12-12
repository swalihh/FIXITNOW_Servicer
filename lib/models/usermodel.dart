class UserModel {
  final dynamic id;
  final String username;
  final String email;
  final String phone;
  final String password;
  final String otp;
  final String fullname;
  final String description;
  final String serviceCategory;
  final String verificationDocument;
  final dynamic amount;
  final String location;
  final String servicerImage;
  final String servicerDocument;
  final String status;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.otp,
    required this.fullname,
    required this.description,
    required this.serviceCategory,
    required this.verificationDocument,
    required this.amount,
    required this.location,
    required this.servicerImage,
    required this.servicerDocument,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print('-------------------------------------------------------modle');
    print(json);
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      otp: json['otp'],
      fullname: json['fullname'],
      description: json['description'],
      serviceCategory: json['servicecatagory'],
      verificationDocument: json['verificationdocument'],
      amount: json['amount'],
      location: json['location'],
      servicerImage: json['servicerimage'],
      servicerDocument: json['servicerdocument'],
      status: json['status'],
    );
  }
}
