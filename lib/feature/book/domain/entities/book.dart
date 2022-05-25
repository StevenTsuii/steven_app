import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String name;
  final double price;

  const Book(this.name, this.price);

  @override
  List<Object?> get props => [name, price];
}
