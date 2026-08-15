class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String role;
  final String contactNumber;
  final DoctorProfileModel? doctorProfile;
  final PatientProfileModel? patientProfile;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.contactNumber,
    this.doctorProfile,
    this.patientProfile,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'contact_number': contactNumber,

      if (doctorProfile != null)
        'doctorProfile': doctorProfile!.toJson(),

      if (patientProfile != null)
        'patientProfile': patientProfile!.toJson(),
    };
  }
}

class DoctorProfileModel {
  final String specialityId;
  final int price;
  final String bio;

  DoctorProfileModel({
    required this.specialityId,
    required this.price,
    required this.bio,
  });

  Map<String, dynamic> toJson() {
    return {
      'specialty_id': specialityId,
      'price': price,
      'bio': bio,
    };
  }
}

class PatientProfileModel {
  final String dateOfBirth;
  final String address;

  PatientProfileModel({
    required this.dateOfBirth,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'date_of_birth': dateOfBirth,
      'address': address,
    };
  }
}