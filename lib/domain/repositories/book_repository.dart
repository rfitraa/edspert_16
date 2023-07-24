import 'package:edspert_16/data/model/book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getAllNewBooks();
}