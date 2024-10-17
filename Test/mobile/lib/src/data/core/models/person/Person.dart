import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/dto/dto_person.dart';

part 'Person.freezed.dart';
part 'Person.g.dart';

@freezed
class Person with _$Person {
  const Person._();

  const factory Person({
    @Default(-1) int id,
    @Default("") String identityNumber,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String dateOfBirth,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  factory Person.fromDtoPerson(DtoPerson dto) {
    return Person(
      id: dto.id,
      identityNumber: dto.identityNumber,
      firstName: dto.firstName,
      lastName: dto.lastName,
      dateOfBirth: dto.dateOfBirth, // Assurez-vous d'avoir ce champ dans DtoPerson
    );
  }
}
