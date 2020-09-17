part of 'random_bloc.dart';

@immutable
 class RandomState extends Equatable {
  final int random;

  RandomState({this.random});

  @override
  // TODO: implement props
  List<Object> get props => [random];

}


