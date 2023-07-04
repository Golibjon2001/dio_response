part of 'edite_bloc.dart';

@immutable
class EditeState extends Equatable {
  final HomeModel? homeModel;
  final FormzStatus status;
  final bool isEdite;
  const EditeState({required this.homeModel,required this.status,required this.isEdite});

  EditeState copyWith({
    final HomeModel? homeModel,
    final FormzStatus? status,
    final bool? isEdite,
})=>EditeState(homeModel: homeModel??this.homeModel, status: status??this.status, isEdite: isEdite??this.isEdite);
  @override
  List<Object?> get props => [homeModel,status,isEdite];
}
