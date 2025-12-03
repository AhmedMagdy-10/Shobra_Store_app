import 'package:dartz/dartz.dart';
import 'package:shobra_store_app/core/repo/failure.dart';
import 'package:shobra_store_app/feature/data/model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProduct();

  Future<Either<Failure, List<ProductModel>>> getProductType({
    required String productType,
  });
}
