part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final FormzStatus? status;
  final List<HomeModel>? homeModel;
  final bool isDelete;

  const HomeState({required this.homeModel, required this.status,required this.isDelete});

  HomeState copyWith({
    final FormzStatus? status,
    final List<HomeModel>? homeModel,
    final bool? isDelete,
  }) =>
      HomeState(
        status: status ?? this.status,
        homeModel: homeModel ?? this.homeModel,
        isDelete:isDelete?? this.isDelete,
      );

  List<Object?> get props =>[status,homeModel,isDelete];

}
