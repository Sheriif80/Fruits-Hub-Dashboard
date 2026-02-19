import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/app_end_points.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl({required this.storageService});
  @override
  Future<Either<Failures, String>> uploadImage(File image) async {
    try {
      final String url = await storageService.uploadFile(
        image,
        AppEndPoints.images,
      );
      return right(url);
    } catch (e) {
      return left(ServerFailure("Failed to upload image, details:[$e] "));
    }
  }
}
