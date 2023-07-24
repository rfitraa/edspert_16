import 'package:edspert_16/data/model/book_model.dart';
import 'package:edspert_16/domain/usecase/get_all_new_books_usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetAllNewBooksUseCase getAllNewBooksUseCase;
  HomeController({required this.getAllNewBooksUseCase});

  Rx<List<BookModel>> listBooks = Rx([]);

  void getAllNewBooks() async {
    final books = await getAllNewBooksUseCase.call();
    listBooks(books);
    update();
  }
}
