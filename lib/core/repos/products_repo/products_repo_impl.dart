import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  @override
  Future<Either<Failures, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
}
