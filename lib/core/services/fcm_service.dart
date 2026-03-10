import 'dart:convert';
import 'dart:developer';
import 'package:fruits_hub_dashboard/core/utils/app_keys.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class FcmService {
  // 1. دالة لاستخراج التصريح الأمني من جوجل صالح لمدة ساعة
  static Future<String> _getAccessToken() async {
    final accountCredentials = ServiceAccountCredentials.fromJson(
      AppKeys.fcmServiceAccountJson,
    );
    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    final client = await clientViaServiceAccount(accountCredentials, scopes);
    final accessToken = client.credentials.accessToken.data;
    client.close();

    return accessToken;
  }

  // 2. الدالة الأساسية لإرسال الإشعار
  static Future<void> sendNotification({
    required String deviceToken,
    required String title,
    required String body,
  }) async {
    try {
      final String serverToken = await _getAccessToken();

      // ⚠️ تنبيه هام: استبدل YOUR_PROJECT_ID باسم مشروعك في فايربيز
      // هتلاقيه مكتوب في ملف الـ JSON اللي إنت نسخته فوق عند كلمة "project_id"
      const String projectId = 'fruits-hub-e20b7';

      final String endpoint =
          'https://fcm.googleapis.com/v1/projects/$projectId/messages:send';

      // تجهيز شكل الإشعار
      final Map<String, dynamic> message = {
        'message': {
          'token': deviceToken,
          'notification': {'title': title, 'body': body},
          'data': {
            'type':
                'order_update', // ممكن تبعت داتا إضافية تستقبلها في التطبيق التاني
          },
        },
      };

      // إرسال الطلب لفايربيز
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverToken',
        },
        body: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        log('✅ Notification sent successfully to: $deviceToken');
      } else {
        log('❌ Failed to send notification: ${response.body}');
      }
    } catch (e) {
      log('❌ Error sending notification: $e');
    }
  }
}
