import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());
    final result = await imagesRepo.uploadImage(addProductInputEntity.image);

    result.fold(
      (err) {
        emit(AddProductError(err.message));
      },
      (url) async {
        addProductInputEntity.imageURL = url;
        final result = await productsRepo.addProduct(addProductInputEntity);

        result.fold(
          (err) {
            emit(AddProductError(err.message));
          },
          (_) {
            emit(AddProductSuccess("Product added successfully"));
          },
        );
      },
    );
  }
}
