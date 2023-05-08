import 'package:dio/dio.dart';
import 'package:tflite_image_classification/model/disease_model.dart';

class DiseaseAPI {
  static Future<List<Disease>> getAllDiseases() async {
    final response = await Dio().get(
        'https://my-json-server.typicode.com/dhaifan999/mini-project-alterra/disease');

    List<Disease> diseases = (response.data as List)
        .map(
          (e) => Disease(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              overcome: e['overcome']),
        )
        .toList();

    return diseases;
  }
}
