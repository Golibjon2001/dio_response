part of 'edite_bloc.dart';

@immutable
abstract class EditeEvent extends Equatable{}

  class EditeHomeEvent extends EditeEvent{
  final HomeModel homeModel;
  EditeHomeEvent({required this.homeModel});
  @override
  List<Object?> get props => [homeModel];
}

