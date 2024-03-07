import 'dart:convert';
import 'package:http/http.dart' as http;

class IdentifySnake {
  final snakeSpeciesList = [
    "common krait",
    "green pit viper",
    "green vine snake",
    "hump nosed viper",
    "indian cobra",
    "indian rock python",
    "rat snake",
    "russell's viper",
    "saw scaled viper",
    "sri lanka cat snake",
  ];

  Future sendImage(String imageFile) async {
    String result;
    // Pass the image path to the api endpoint Url
    // var request = http.MultipartRequest('POST', Uri.parse('http://13.53.168.135:8080/predict'));
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://54.221.155.78:8080/predict'));

    var picture = await http.MultipartFile.fromPath('file', imageFile);

    request.files.add(picture);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      result = await response.stream.bytesToString();
      return getSnakeDetailList(result);
    } else {
      print(response.reasonPhrase);
    }
    // return result;
  }

  List<Object> getSnakeDetailList(result) {
    Map<String, dynamic> jsonResult = json.decode(result);
    String snakeName = snakeSpeciesList[jsonResult['predicted_class']];
    double accuracy = jsonResult['confidence_level'] * 100;
    print("Name : $snakeName confidence : ${accuracy.round()}");
    return [snakeName, accuracy.round()];
  }
}
