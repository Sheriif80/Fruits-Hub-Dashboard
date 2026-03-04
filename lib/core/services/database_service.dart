abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentID,
  });
  Future<dynamic> getData({
    required String path,
    String? docID,
    Map<String, dynamic>? query,
  });
  Stream<dynamic> getStreamData({
    required String path,
    Map<String, dynamic>? query,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String docID,
  });

  Future<bool> ifDataExists({required String path, required String docID});
}
