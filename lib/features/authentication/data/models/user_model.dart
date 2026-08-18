class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String contactNumber;
  final bool isVerified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.contactNumber,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      contactNumber: json['contact_number'],
      isVerified: json['is_verified'],
    );
  }
}