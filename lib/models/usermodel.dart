class Usermodel {
    String username;
    String email;
    String phone;
    String password;

    Usermodel({
        required this.username,
        required this.email,
        required this.phone,
        required this.password,
    });

    factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
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
