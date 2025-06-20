import 'package:get/get.dart';
import 'package:salon_sac/models/app_category.dart';
import 'package:salon_sac/services/api_services.dart';

class CategoryRepository extends GetxService {
  late final ApiServices _apiServices;

  @override
  void onInit() {
    super.onInit();
    _apiServices = Get.find<ApiServices>();
  }

  Future<List<AppCategory>> getCategories() async {
    final response = await _apiServices.get(ApiConstants.categories);
    if (response.statusCode == 200) {
      var listOfData = response.data as List;
      return listOfData
          .map((category) => AppCategory.fromJson(category))
          .toList();
    }
    throw Exception('Kategoriler getirilirken bir hata oluştu');
  }

  Future<AppCategory> createCategory(AppCategory category) async{
    final response = await _apiServices.post(ApiConstants.categories, data: category.toJson());
    if (response.statusCode == 201) {
      return AppCategory.fromJson(response.data);
    }
    throw Exception('Kategoriler eklenirken bir hata oluştu');
  }
}
