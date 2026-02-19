import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    final String fileName = b.basename(file.path);
    final String extensionName = b.extension(file.path);
    final fileReference = storageReference.child(
      '$path/$fileName.$extensionName',
    );
    await fileReference.putFile(file);
    final fileUrl = fileReference.getDownloadURL();
    return fileUrl;
  }
}
