part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeLoadEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}
class HomeDeleteEvent extends HomeEvent{
  final HomeModel? homeModel;
  HomeDeleteEvent({required this.homeModel});
  @override
  List<Object?> get props => [homeModel];

}
