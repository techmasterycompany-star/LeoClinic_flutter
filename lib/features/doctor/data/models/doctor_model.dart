class DoctorModel {
  final String id;
  final String name;
  final String speciality;
  final String? image;
  final double? consultationFee;

  const DoctorModel({
    required this.id,
    required this.name,
    this.speciality = '',
    this.image,
    this.consultationFee,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    String firstNonEmpty(List<String> keys) {
      for (final key in keys) {
        final value = json[key];
        if (value is String && value.isNotEmpty) return value;
      }
      return '';
    }

    double? readDouble(List<String> keys) {
      for (final key in keys) {
        final value = json[key];
        if (value is num) return value.toDouble();
        if (value is String) return double.tryParse(value);
      }
      return null;
    }

    return DoctorModel(
      id: firstNonEmpty(['id', '_id']),
      name: firstNonEmpty(['name', 'fullName']),
      speciality: _readSpeciality(json),
      image: firstNonEmpty(['image', 'profileImage', 'photo']),
      consultationFee: readDouble(['consultationFee', 'price', 'fee']),
    );
  }

  static String _readSpeciality(Map<String, dynamic> json) {
    final direct = json['speciality'] ?? json['specialty'];
    if (direct is String && direct.isNotEmpty) return direct;
    if (direct is Map) {
      final name = direct['name'];
      return name is String ? name : '';
    }
    final user = json['user'];
    if (user is Map) {
      final nested = user['speciality'] ?? user['specialty'];
      if (nested is String) return nested;
      if (nested is Map && nested['name'] is String) return nested['name'];
    }
    return '';
  }
}

List<DoctorModel> parseDoctorsList(dynamic data) {
  List<dynamic> rawDocs;

  if (data is List) {
    rawDocs = data;
  } else if (data is Map && data['data'] is List) {
    rawDocs = data['data'];
  } else if (data is Map && data['data'] is Map) {
    final inner = data['data'];
    if (inner is Map && inner['doctors'] is List) {
      rawDocs = inner['doctors'];
    } else if (inner is Map && inner['items'] is List) {
      rawDocs = inner['items'];
    } else {
      rawDocs = const [];
    }
  } else {
    rawDocs = const [];
  }

  return rawDocs
      .map((item) => DoctorModel.fromJson(
          item is Map<String, dynamic> ? item : const <String, dynamic>{}))
      .toList();
}