import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'storage_service.dart';

class SupabaseStorageService implements StorageService {
  final SupabaseClient _client;

  SupabaseStorageService({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  @override
  Future<String> uploadFile(File file, String path) async {
    try {
      final bucketName = 'product-images';

      // upload
      await _client.storage.from(bucketName).upload(path, file);

      // return public url
      final publicUrl = _client.storage.from(bucketName).getPublicUrl(path);

      return publicUrl;
    } catch (e) {
      throw Exception('Supabase upload failed: $e');
    }
  }
}
