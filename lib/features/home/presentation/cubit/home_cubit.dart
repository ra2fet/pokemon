import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void clearName() {
    emit(state.copyWith(name: ""));
  }
}
