import 'package:edspert_16/data/datasource/book_remote_datasource.dart';
import 'package:edspert_16/data/model/book_model.dart';
import 'package:edspert_16/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository{
  final BookRemoteDataSource remoteDataSource;

  const BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<BookModel>> getAllNewBooks() async => await remoteDataSource.getAllNewBooks();
}