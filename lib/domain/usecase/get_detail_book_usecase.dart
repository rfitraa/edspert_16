import 'package:edspert_16/data/model/detail_book_model.dart';
import 'package:edspert_16/domain/repositories/book_repository.dart';

class GetDetailBookUsecase{
  final BookRepository repository;
  const GetDetailBookUsecase({required this.repository});

  Future<DetailBookModel> call(String isbn13) async => repository.getDetailBook(isbn13);
}