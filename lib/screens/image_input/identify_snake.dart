import 'dart:convert';
import 'package:http/http.dart' as http;

class IdentifySnake {
  final snakeSpeciesList = [
    "Ahaetulla nasuta",
    "Ahaetulla prasina",
    "Albino cobra",
    "Arani",
    "Buff-striped keel back",
    "CGR",
    "Checkered keel back",
    "Chrysopelea ornata",
    "Cobra",
    "Common krait",
    "Daboia russelii",
    "Flowery wolf snake",
    "Forsten's cat snake",
    "Green pit viper",
    "Green vine snake",
    "Hump-nosed viper",
    "Pipe snake",
    "Python",
    "Rat snake",
    "Russell's viper",
    "Sri Lanka cat snake",
    "Trinket snake",
    "Wolf snake"
  ];

  Future sendImage(String imageFile) async {
    var result = null;
    // Pass the image path to the api endpoint Url
    var request = http.MultipartRequest('POST', Uri.parse('http://13.50.238.163:8501/predict'));

    var picture = await http.MultipartFile.fromPath('image', imageFile);

    request.files.add(picture);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      result = await response.stream.bytesToString();
      return getSnakeDetailList(result);
    } else {
      print(response.reasonPhrase);
    }
    return result;
  }

  List<Object> getSnakeDetailList(result) {
    Map<String, dynamic> jsonResult = json.decode(result);
    String snakeName = snakeSpeciesList[jsonResult['predicted_class']];
    double accuracy = jsonResult['confidence_level'] * 100;
    print("Name : $snakeName confidence : ${accuracy.round()}");
    return [snakeName, accuracy.round()];
  }
}