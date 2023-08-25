part of 'home_cubit.dart';

class HomeState extends Equatable {
  final String name;

  const HomeState({
    this.name = "",
  });

  HomeState copyWith({
    String? name,
  }) {
    return HomeState(
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [name];
}
