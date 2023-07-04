
import 'package:bloc/bloc.dart';
import 'package:diorequest/features/data/repository.dart';
import 'package:diorequest/features/pages/home_page/data/home_model.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(status:FormzStatus.pure, isDelete:false)) {
    HomeRepository homeRepository=HomeRepository();
    on<HomeLoadEvent>((event, emit) async{
      emit(state.copyWith(status:FormzStatus.submissionInProgress));
      final respons=await homeRepository.homeLoded();
      emit(state.copyWith(status:FormzStatus.submissionSuccess,homeModel:respons));
    });

    on<HomeDeleteEvent>((event, emit) async{
      emit(state.copyWith(status:FormzStatus.submissionInProgress,isDelete:false));
      final respons=await homeRepository.delete(event.homeModel!.id.toString());
      emit(state.copyWith(status:FormzStatus.submissionSuccess,homeModelDelete:respons,isDelete:true));
    });
  }
}
