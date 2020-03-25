import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  //
  // ايامنا وحشاك ولا ناسي يالي انت من غيرك بقاسي
  // كان نفسي اعيش عمري معاك علي طول
  Future<List<dynamic>> search(String qry) async {
    final url = 'http://osamaadel.pythonanywhere.com/?query=$qry';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return null;
      }
      //final List<String> loadedHadithes = [];
      //print(extractedData);

      return [
        extractedData['Corrected'],
        extractedData['Tfidf'],
        extractedData['Query']
      ];
      // return extractedData['Tfidf'];
    } catch (error) {
      throw (error);
    }
  }
}
