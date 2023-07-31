import 'package:dio/dio.dart';
import 'package:edspert_16/data/datasource/book_remote_datasource.dart';
import 'package:edspert_16/data/repositories/book_repository_implementation.dart';
import 'package:edspert_16/domain/usecase/get_detail_book_usecase.dart';
import 'package:edspert_16/presentation/screen/detail/controller/detail_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final String isbn13;
  DetailPage({super.key, required this.isbn13});

  final detailController = DetailController(
    getDetailBookUsecase: GetDetailBookUsecase(
      repository: BookRepositoryImpl(
        remoteDataSource: BookRemoteDataSource(client: Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<DetailController>(
          init: detailController,
          initState: (_) => detailController.getDetailBook(isbn13),
          builder: (controller) {
            final detailBook = controller.detailBook.value;

            // Check if the data is still loading
            if (controller.isLoading) {
              // Show a loading indicator while waiting for the data
              return CircularProgressIndicator();
            } else {
              // Data is loaded, display the content
              if (kDebugMode) {
                print("DetailPage - Image: ${detailBook.image}");
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(detailBook.image ?? ''),
                  Text(detailBook.title ?? "Judul"),
                  Text(detailBook.subtitle ?? "Subtitle"),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(detailBook.authors ?? "Author"),
                  Text(detailBook.desc ?? "Description")
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
