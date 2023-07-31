import 'package:dio/dio.dart';
import 'package:edspert_16/data/datasource/book_remote_datasource.dart';
import 'package:edspert_16/data/repositories/book_repository_implementation.dart';
import 'package:edspert_16/domain/usecase/get_all_new_books_usecase.dart';
import 'package:edspert_16/presentation/screen/detail/page/detail_page.dart';
import 'package:edspert_16/presentation/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = HomeController(
    getAllNewBooksUseCase: GetAllNewBooksUseCase(
      repository: BookRepositoryImpl(
        remoteDataSource: BookRemoteDataSource(client: Dio()),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GetBuilder<HomeController>(
            init: homeController,
            initState: (_) => homeController.getAllNewBooks(),
            builder: (controller) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: controller.listBooks.value.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemBuilder: (context, index) {
                  final book = controller.listBooks.value[index];

                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(isbn13: book.isbn13),
                        )),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Image.network(
                            book.image,
                            width: 100,
                          ),
                          Expanded(child: Text(book.title)),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
