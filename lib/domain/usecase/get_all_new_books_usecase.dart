import 'package:edspert_16/data/model/book_model.dart';
import 'package:edspert_16/domain/repositories/book_repository.dart';

class GetAllNewBooksUseCase{
  final BookRepository repository;
  const GetAllNewBooksUseCase({required this.repository});

  Future<List<BookModel>> call() async => repository.getAllNewBooks();
}
  
