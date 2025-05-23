import 'package:equatable/equatable.dart';

final class SplashState extends Equatable {
  final bool isLoading;
  const SplashState({required this.isLoading});

  SplashState copyWith({bool? isLoading}) {
    return SplashState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading];
}
