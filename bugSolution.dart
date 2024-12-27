```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      // Process jsonData
    } else if (response.statusCode == 404) {
      // Handle 404 Not Found specifically.
      throw Exception('Resource not found (404)');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('Invalid JSON format: $e');
  } on http.ClientException catch (e) {
    // Handle network errors separately
    print('Network error: $e');
     // Attempt retry logic here if needed.
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw only unexpected exceptions.
  }
}
```