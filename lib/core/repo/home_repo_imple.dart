import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shobra_store_app/core/repo/api_helper.dart';
import 'package:shobra_store_app/core/repo/failure.dart';
import 'package:shobra_store_app/core/repo/home_repo.dart';
import 'package:shobra_store_app/feature/data/model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiHelper apiHelper;

  HomeRepoImpl(this.apiHelper);

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProduct() async {
    try {
      var data = await apiHelper.get(endPoints: 'products');

      List<dynamic> productsList = data as List;

      List<ProductModel> products = [];
      for (var eachProduct in productsList) {
        products.add(ProductModel.fromJson(eachProduct));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductType({
    required String productType,
  }) async {
    try {
      var data = await apiHelper.get(
        endPoints: 'products/category/$productType',
      );

      List<dynamic> productsList = data as List;

      List<ProductModel> products = [];
      for (var eachProduct in productsList) {
        products.add(ProductModel.fromJson(eachProduct));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
