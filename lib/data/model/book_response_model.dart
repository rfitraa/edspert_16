import 'package:edspert_16/data/model/book_model.dart';

class BookResponseModel {
    final String error;
    final String total;
    final List<BookModel> books;

    BookResponseModel({
        required this.error,
        required this.total,
        required this.books,
    });

    factory BookResponseModel.fromJson(Map<String, dynamic> json) => BookResponseModel(
        error: json["error"],
        total: json["total"],
        books: List<BookModel>.from(json["books"].map((x) => BookModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
    };
}