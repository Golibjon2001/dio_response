part of 'add_bloc.dart';

@immutable
class AddState extends Equatable {
  final AddModel? addModel;
  final FormzStatus? status;

  AddState({required this.addModel,required this.status});

  AddState copyWith({
    final AddModel? addModel,
    final FormzStatus? status,
})=>AddState(addModel:addModel??this.addModel,status:status??this.status);

  List<Object?> get props =>[addModel,status];
}
