part of 'add_bloc.dart';

@immutable
abstract class AddEvent extends Equatable{}

  class AddLoadEvent extends AddEvent{
  final AddModel addModel;
  AddLoadEvent({required this.addModel});
  @override
  List<Object?> get props => [];

  }

