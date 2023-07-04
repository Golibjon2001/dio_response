
import 'package:bloc/bloc.dart';
import 'package:diorequest/features/data/repository.dart';
import 'package:diorequest/features/pages/home_page/data/home_model.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'edite_event.dart';
part 'edite_state.dart';

class EditeBloc extends Bloc<EditeEvent, EditeState> {
  EditeBloc() : super(EditeState(homeModel:HomeModel(), status:FormzStatus.pure, isEdite:false)) {
    HomeRepository homeRepository=HomeRepository();
    on<EditeHomeEvent>((event, emit) async{
      emit(state.copyWith(status:FormzStatus.submissionInProgress));
      final respons=await homeRepository.edite(event.homeModel);
      emit(state.copyWith(status:FormzStatus.submissionSuccess,homeModel:respons,isEdite:true));
    });
  }
}
