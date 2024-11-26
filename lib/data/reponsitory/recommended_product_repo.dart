import 'package:get/get.dart';
import 'package:testtt/data/api/api_client.dart';
import 'package:testtt/utils/app_constant.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMEND_PRODUCT_URI);
  }
}
