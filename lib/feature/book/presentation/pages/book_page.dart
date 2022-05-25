import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steven_app/feature/book/domain/entities/book.dart';

import '../bloc/book_bloc.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        BlocConsumer<BookBloc, BookState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingBookState) {
              return _buildLoadingUI();
            } else if (state is ShowBookListState) {
              return _buildBookListUI(state);
            } else {
              return _buildErrorUI(context);
            }
          },
        ),
        _buildFloatingActionButtons(context),
      ]),
    );
  }

  Positioned _buildFloatingActionButtons(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                _addBook(context);
              },
              tooltip: 'Add Book',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 8,
            ),
            FloatingActionButton(
              onPressed: () {
                _clearOneBook(context);
              },
              tooltip: 'Remove Book',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              height: 8,
            ),
            FloatingActionButton(
              onPressed: () {
                _clearAllBook(context);
              },
              tooltip: 'Clear all',
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }

  void _addBook(BuildContext context) {
    context.read<BookBloc>().add(AddBookEvent(Book(
        "H${DateTime.now().hour} M${DateTime.now().minute}S${DateTime.now().second}",
        100)));
  }

  void _removeBook(BuildContext context, Book book) {
    context.read<BookBloc>().add(RemoveBookEvent(book));
  }

  void _clearOneBook(BuildContext context) {
    context.read<BookBloc>().add(ClearOneBookEvent());
  }

  void _clearAllBook(BuildContext context) {
    context.read<BookBloc>().add(ClearAllBookEvent());
  }

  Center _buildLoadingUI() {
    return const Center(child: CircularProgressIndicator());
  }

  ListView _buildBookListUI(ShowBookListState state) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: state.books.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              context.read<BookBloc>().add(RemoveBookEvent(state.books[index]));
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Name: ${state.books[index].name} - \$${state.books[index].price}",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          );
        }));
  }

  Text _buildErrorUI(BuildContext context) {
    return Text(
      "Something wrong...",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
