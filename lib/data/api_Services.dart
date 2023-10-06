import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subspace/models/blog.dart';

class ApiService {
  Future<BlogModel?> fetchBlogs() async {
    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        // print('Response data: ${response.body}');
        final Map<String, dynamic> decode = jsonDecode(response.body);
        BlogModel blogModel = BlogModel.fromJson(decode);
        return blogModel;
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        return null;
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error Uday: $e');
      return null;
    }
  }
}
