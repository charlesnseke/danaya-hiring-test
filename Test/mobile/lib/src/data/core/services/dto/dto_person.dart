class DtoPerson {
  int id ;
  String identityNumber, firstName, lastName, dateOfBirth;


  DtoPerson({
    required this.id,
    required this.identityNumber,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,

  });

  factory DtoPerson.fromJson(Map<String,dynamic>json){
    return DtoPerson(
      id: json['id'] as int? ?? -1,
      identityNumber: json['identityNumber'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',

    );
  }

}