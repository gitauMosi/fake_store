import 'dart:convert';

CategoryData categoryDataFromJson(String str) => CategoryData.fromJson(json.decode(str));

String categoryDataToJson(CategoryData data) => json.encode(data.toJson());

class CategoryData {
  String status;
  String message;
  List<String> categories;

  CategoryData({
    required this.status,
    required this.message,
    required this.categories,
  });

  CategoryData copyWith({
    String? status,
    String? message,
    List<String>? categories,
  }) =>
      CategoryData(
        status: status ?? this.status,
        message: message ?? this.message,
        categories: categories ?? this.categories,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        status: json["status"] ?? "", // Adding fallback to prevent errors if status is missing
        message: json["message"] ?? "", // Fallback for message as well
        categories: List<String>.from(json["categories"]?.map((x) => x ?? "") ?? []),
        // Handling null or empty categories safely
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}
