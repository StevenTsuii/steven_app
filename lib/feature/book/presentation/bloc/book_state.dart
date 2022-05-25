part of 'book_bloc.dart';

@immutable
abstract class BookState extends Equatable {}

class BookInitialState extends BookState {
  @override
  List<Object?> get props => [];
}

class LoadingBookState extends BookState {
  @override
  List<Object?> get props => [];
}

class ShowBookListState extends BookState {
  final List<Book> books;
  ShowBookListState(this.books);

  @override
  List<Object?> get props => [books];
}
