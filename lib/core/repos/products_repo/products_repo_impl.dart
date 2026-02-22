import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/app_end_points.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  ProductsRepoImpl({required this.databaseService});
  final DatabaseService databaseService;
  @override
  Future<Either<Failures, void>> addProduct(
    ProductEntity addProductInputEntity,
  ) async {
    try {
      await databaseService.addData(
        path: AppEndPoints.addProductsCollection,
        data: ProductModel.fromEntity(addProductInputEntity).toMap(),
      );
      return right(null);
    } catch (e, stackTrace) {
      print("Firestore error: $e");
      print(stackTrace);
      rethrow;
      // return left(ServerFailure("Failed to add product, details:[$e] "));
    }
  }
}
