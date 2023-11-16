class UserModel {
    String username;
    String email;
    String phone;
    String password;

    UserModel({
        required this.username,
        required this.email,
        required this.phone,
        required this.password,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
    };
}
