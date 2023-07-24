class BookModel {
    final String title;
    final String subtitle;
    final String isbn13;
    final String price;
    final String image;
    final String url;

    BookModel({
        required this.title,
        required this.subtitle,
        required this.isbn13,
        required this.price,
        required this.image,
        required this.url,
    });

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
    };
}