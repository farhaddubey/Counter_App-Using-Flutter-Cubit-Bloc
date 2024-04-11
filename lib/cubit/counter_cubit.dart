import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  // As Cubit is a abstract class that must be overridden
  // And to do that Constructor is invoked and super with it's initial state value 0 passed
  void increment(){
    // state = state +1; Not working as state is not a setter it's a getter hence using emit '
    print('Before: $state');
    emit(state+1);
    print('After: $state');
  }

}