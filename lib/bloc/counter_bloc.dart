
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scatter_smileys/bloc/counter_event.dart';
import 'package:scatter_smileys/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState> {
  CounterBloc():super(CounterState(count: 0)){
    on<IncrementCounter>((event, emit){
       emit(CounterState(count: state.count+1));
    });

    on<DecrementCounter>((event, emit){
      emit(CounterState(count: state.count-1));
    });

    on<ResetCounter>((event,emit){
      emit(CounterState(count:0 ));
    });
  }

}