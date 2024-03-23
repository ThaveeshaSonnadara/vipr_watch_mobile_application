import 'dart:convert';
import 'package:http/http.dart' as http;

class IdentifySnake {
  final snakeSpeciesList = [
    "Common Krait",
    "Green Pit Viper",
    "Green Vine Snake",
    "Hump nosed viper",
    "Indian Cobra",
    "Indian Rock Python",
    "Rat Snake",
    "Russell's Viper",
    "Saw scaled Viper",
    "Sri Lanka Cat Snake",
  ];

  Future sendImage(String imageFile) async {
    var result = null;

    // Pass the image path to the api endpoint Url
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://54.210.211.13:8080/predict'));

    var picture = await http.MultipartFile.fromPath('file', imageFile);

    request.files.add(picture);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      // return the data to the application
      result = await response.stream.bytesToString();
      return getSnakeDetailList(result);
    } else {
      print(response.reasonPhrase);
    }
  }

  // get the data return by the api and store that data in a list
  List<Object> getSnakeDetailList(result) {
    Map<String, dynamic> jsonResult = json.decode(result);
    String snakeName = snakeSpeciesList[jsonResult['predicted_class']];
    double accuracy = jsonResult['confidence_level'] * 100;
    print("Name : $snakeName confidence : ${accuracy.round()}");
    return [snakeName, accuracy.round()];
  }
}
