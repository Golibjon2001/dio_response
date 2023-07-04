part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final FormzStatus? status;
  final List<HomeModel>? homeModel;
  final HomeModel? homeModelDelete;
  final bool isDelete;

  const HomeState({this.homeModel, required this.status,required this.isDelete,this.homeModelDelete});

  HomeState copyWith({
    final FormzStatus? status,
    final HomeModel? homeModelDelete,
    final List<HomeModel>? homeModel,
    final bool? isDelete,
  }) =>
      HomeState(
        homeModelDelete:homeModelDelete??this.homeModelDelete,
        status: status ?? this.status,
        homeModel: homeModel ?? this.homeModel,
        isDelete:isDelete?? this.isDelete,
      );

  List<Object?> get props =>[status,homeModel,isDelete,homeModelDelete];

}
