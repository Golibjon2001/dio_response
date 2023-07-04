import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diorequest/features/data/repository.dart';
import 'package:diorequest/features/pages/add_page/data/add_model.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddState(addModel:AddModel(), status:FormzStatus.pure)) {
    HomeRepository homeRepository=HomeRepository();
    on<AddLoadEvent>((event, emit)async{
      emit(state.copyWith(status:FormzStatus.submissionInProgress));
      final respons=await homeRepository.add(event.addModel);
      emit(state.copyWith(status:FormzStatus.submissionSuccess,addModel:respons));
    });
  }
}
