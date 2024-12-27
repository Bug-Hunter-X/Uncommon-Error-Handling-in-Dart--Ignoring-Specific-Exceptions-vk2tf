```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Handle the successful response
      final jsonData = json.decode(response.body);
      // Process jsonData here
    } else {
      // Handle the error response
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions during the API call
    print('Error fetching data: $e');
    // Re-throw the exception to be handled by calling function
    rethrow;
  }
}
```