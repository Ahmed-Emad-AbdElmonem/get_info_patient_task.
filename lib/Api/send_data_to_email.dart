import 'dart:convert';
import 'package:http/http.dart' as http;

Future Sendata({
  required String name,
  required String email,
  required String phone,
   String? location,
}) async {
  final serviceId = 'service_z2bdmu8';
  final templateId = 'template_c7hz4p4';
  final userId = '3zEHDC7DhMXOPcGkV';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_message': phone,
          'user_subject': name,
          
          'user_location':location,
        }
      }));
}
