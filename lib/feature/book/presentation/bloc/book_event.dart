part of 'book_bloc.dart';

@immutable
abstract class BookEvent {}

class AddBookEvent extends BookEvent {
  final Book book;

  AddBookEvent(this.book);
}

class RemoveBookEvent extends BookEvent {
  final Book book;

  RemoveBookEvent(this.book);
}

class ClearOneBookEvent extends BookEvent {}

class ClearAllBookEvent extends BookEvent {}
