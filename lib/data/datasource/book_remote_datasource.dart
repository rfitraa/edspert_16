import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_16/constant/constant.dart';
import 'package:edspert_16/data/model/book_model.dart';
import 'package:edspert_16/data/model/book_response_model.dart';
import 'package:edspert_16/data/model/detail_book_model.dart';

class BookRemoteDataSource {
  final Dio client;

  const BookRemoteDataSource({required this.client});

  Future<List<BookModel>> getAllNewBooks() async {
    try {
      final url = '${Constant.baseUrl}/new';

      final result = await client.get(url);

      final bookResponse = BookResponseModel.fromJson(result.data);

      return bookResponse.books;
    } catch (e) {
      log('Error at BookRemoteDataSource : ${e.toString()}');
      return [];
    }
  }

  Future<DetailBookModel> getDetailBook(String isbn13) async {
    try {
      final url = '${Constant.baseUrl}/books/$isbn13';

      final result = await client.get(url);

      final detailBookResponse = DetailBookModel.fromJson(result.data);

      return detailBookResponse;
    } catch (e) {
      return DetailBookModel();
    }
  }
}
