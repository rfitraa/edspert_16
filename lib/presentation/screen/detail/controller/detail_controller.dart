import 'package:edspert_16/data/model/detail_book_model.dart';
import 'package:edspert_16/domain/usecase/get_detail_book_usecase.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final GetDetailBookUsecase getDetailBookUsecase;
  DetailController({required this.getDetailBookUsecase});

  Rx<DetailBookModel> detailBook = Rx(DetailBookModel());

  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  void getDetailBook(String isbn13) async {
    _isLoading.value = true;
    try {
      final result = await getDetailBookUsecase.call(isbn13);
      detailBook(result);
      update();
      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
    }
  }
}
