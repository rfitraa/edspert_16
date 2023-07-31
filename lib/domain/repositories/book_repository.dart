import 'package:edspert_16/data/model/book_model.dart';
import 'package:edspert_16/data/model/detail_book_model.dart';

abstract class BookRepository {
  Future<List<BookModel>> getAllNewBooks();
  Future<DetailBookModel> getDetailBook(String isbn13);
}