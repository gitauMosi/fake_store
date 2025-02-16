// To parse this JSON data, do
//
//     final usersData = usersDataFromJson(jsonString);

import 'dart:convert';

UsersData usersDataFromJson(String str) => UsersData.fromJson(json.decode(str));

String usersDataToJson(UsersData data) => json.encode(data.toJson());

class UsersData {
    String status;
    String message;
    List<User> users;

    UsersData({
        required this.status,
        required this.message,
        required this.users,
    });

    UsersData copyWith({
        String? status,
        String? message,
        List<User>? users,
    }) => 
        UsersData(
            status: status ?? this.status,
            message: message ?? this.message,
            users: users ?? this.users,
        );

    factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        status: json["status"],
        message: json["message"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    int id;
    String email;
    String username;
    String password;
    Name name;
    Address address;
    String phone;

    User({
        required this.id,
        required this.email,
        required this.username,
        required this.password,
        required this.name,
        required this.address,
        required this.phone,
    });

    User copyWith({
        int? id,
        String? email,
        String? username,
        String? password,
        Name? name,
        Address? address,
        String? phone,
    }) => 
        User(
            id: id ?? this.id,
            email: email ?? this.email,
            username: username ?? this.username,
            password: password ?? this.password,
            name: name ?? this.name,
            address: address ?? this.address,
            phone: phone ?? this.phone,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: Name.fromJson(json["name"]),
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name.toJson(),
        "address": address.toJson(),
        "phone": phone,
    };
}

class Address {
    String city;
    String street;
    String number;
    String zipcode;
    Geolocation geolocation;

    Address({
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
        required this.geolocation,
    });

    Address copyWith({
        String? city,
        String? street,
        String? number,
        String? zipcode,
        Geolocation? geolocation,
    }) => 
        Address(
            city: city ?? this.city,
            street: street ?? this.street,
            number: number ?? this.number,
            zipcode: zipcode ?? this.zipcode,
            geolocation: geolocation ?? this.geolocation,
        );

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        street: json["street"],
        number: json["number"],
        zipcode: json["zipcode"],
        geolocation: Geolocation.fromJson(json["geolocation"]),
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
        "number": number,
        "zipcode": zipcode,
        "geolocation": geolocation.toJson(),
    };
}

class Geolocation {
    double lat;
    double long;

    Geolocation({
        required this.lat,
        required this.long,
    });

    Geolocation copyWith({
        double? lat,
        double? long,
    }) => 
        Geolocation(
            lat: lat ?? this.lat,
            long: long ?? this.long,
        );

    factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
    };
}

class Name {
    String firstname;
    String lastname;

    Name({
        required this.firstname,
        required this.lastname,
    });

    Name copyWith({
        String? firstname,
        String? lastname,
    }) => 
        Name(
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
        );

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        firstname: json["firstname"],
        lastname: json["lastname"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
    };
}
