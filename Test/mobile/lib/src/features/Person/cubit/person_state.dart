import 'package:equatable/equatable.dart';
import 'package:testtech/src/data/core/models/person/Person.dart';

abstract class PersonState extends Equatable {
  const PersonState();
}

class PersonInitial extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonLoading extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonFetchSuccess extends PersonState {
 final List<Person> person ;
 const PersonFetchSuccess({required this.person});
  @override
  List<Object?> get props => [person];

}

class PersonCreatedSuccess extends PersonState {
  final String message ;
  const PersonCreatedSuccess({required this.message});
  @override
  List<Object?> get props => [message];

}

class PersonVerifySuccess extends PersonState {
  final double score;
  PersonVerifySuccess({required this.score});

  @override

  List<Object?> get props => [score];}

class PersonFetchError extends PersonState {
  final String message ;
  const PersonFetchError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
