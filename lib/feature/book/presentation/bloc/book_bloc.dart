import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:steven_app/feature/book/domain/entities/book.dart';

part 'book_event.dart';

part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final List<Book> _bookList = [];

  BookBloc() : super(BookInitialState()) {
    on<AddBookEvent>((event, emit) async {
      emit(LoadingBookState());
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emit(ShowBookListState(_bookList..add(event.book)));
    });
    on<RemoveBookEvent>((event, emit) {
      emit(LoadingBookState());
      Future.delayed(const Duration(milliseconds: 500));
      if (_bookList.length > 1) {
        emit(ShowBookListState(_bookList
          ..remove(event.book)
          ..toList()));
      } else {
        emit(ShowBookListState(_bookList..clear()));
      }
    });
    on<ClearOneBookEvent>((event, emit) {
      emit(LoadingBookState());
      Future.delayed(const Duration(milliseconds: 500));
      if (_bookList.length > 1) {
        emit(ShowBookListState(_bookList..removeLast()));
      } else {
        emit(ShowBookListState(_bookList..clear()));
      }
    });
    on<ClearAllBookEvent>((event, emit) {
      emit(LoadingBookState());
      Future.delayed(const Duration(milliseconds: 500));
      emit(ShowBookListState(_bookList..clear()));
    });
  }
}
