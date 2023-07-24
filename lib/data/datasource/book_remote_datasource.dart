import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_16/data/model/book_model.dart';
import 'package:edspert_16/data/model/book_response_model.dart';

class BookRemoteDataSource {
  final Dio client;

  const BookRemoteDataSource({required this.client});

  Future<List<BookModel>> getAllNewBooks() async {
    try {
      const url = 'https://api.itbook.store/1.0/new';

      final result = await client.get(url);

      final bookResponse = BookResponseModel.fromJson(result.data);

      return bookResponse.books;
    } catch (e) {
      log('Error at BookRemoteDataSource : ${e.toString()}');
      return [];
    }
  }
}
