part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();
}

final class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashAnimationStarting extends SplashState {
  final double width;

  const SplashAnimationStarting({required this.width});
  @override
  List<Object?> get props => [width];
}

class SplashAnimationCompleted extends SplashState {
  @override
  List<Object?> get props => [];
}
