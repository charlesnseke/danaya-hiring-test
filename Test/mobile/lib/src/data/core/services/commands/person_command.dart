class CommandPerson {

  String identityNumber ;
  String firstName ;
  String lastName ;
  String  dateOfBirth ;



  CommandPerson({
    required this.identityNumber,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
  });

  Map<String , dynamic> toJson() =>{

    "identityNumber": identityNumber,
    "firstName": firstName,
    "lastName": lastName ,
    "dateOfBirth": dateOfBirth,
  };
}
