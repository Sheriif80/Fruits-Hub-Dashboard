import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'storage_service.dart';
import 'package:path/path.dart' as p;

class SupabaseStorageService implements StorageService {
  final SupabaseClient _client;

  SupabaseStorageService({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  @override
  Future<String> uploadFile(File file, String path) async {
    try {
      final fileExtension = p.extension(file.path);

      final fileName = "${DateTime.now().millisecondsSinceEpoch}$fileExtension";

      final fullPath = "$path/$fileName";

      await _client.storage.from('product-images').upload(fullPath, file);
      final String publicURL = _client.storage
          .from('product-images')
          .getPublicUrl(fullPath);

      return publicURL;
    } catch (e, stack) {
      print(e);
      print(stack);
      rethrow;
    }
  }
}
