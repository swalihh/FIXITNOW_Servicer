class BookingModel {
  int? id;
  String? buildingName;
  String? city;
  String? road;
  String? phone;
  String? date;
  String? time;
  String? description;
  int? serviceAmount;
  String? status;
  String? username;

  BookingModel({
    this.id,
    this.buildingName,
    this.city,
    this.road,
    this.phone,
    this.date,
    this.time,
    this.description,
    this.serviceAmount,
    this.status,
    this.username,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) { 
    return BookingModel(
      id: json['id'],
      buildingName: json['buildingname'],
      city: json['city'],
      road: json['road'],
      phone: json['phone'],
      date: json['date'],
      time: json['time'],
      description: json['description'],
      serviceAmount: json['serviceamount'],
      status: json['status'],
      username: json['username'],
    );
  }

  // Method to convert the object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buildingname': buildingName,
      'city': city,
      'road': road,
      'phone': phone,
      'date': date,
      'time': time,
      'description': description,
      'serviceamount': serviceAmount,
      'status': status,
      'username': username,
    };
  }
}
