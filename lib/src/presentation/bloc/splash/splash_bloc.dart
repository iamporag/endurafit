import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<StartAnimation>((event, emit) async{
      emit(SplashAnimationStarting(width: 0));
      await Future.delayed(Duration(milliseconds: 500));
      emit(SplashAnimationStarting(width: 600));
      await Future.delayed(Duration(seconds: 2));
      emit(SplashAnimationCompleted());
    });
  }
}
