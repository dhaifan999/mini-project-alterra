import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_image_classification/model/api/disease_api.dart';
import 'package:tflite_image_classification/model/disease_model.dart';

enum DiseaseViewState {
  none,
  loading,
  error,
}

class DiseaseViewModel with ChangeNotifier {
  DiseaseViewState _state = DiseaseViewState.none;
  DiseaseViewState get state => _state;

  List<Disease> _diseases = [];
  List<Disease> get diseases => _diseases;

  // ignore: non_constant_identifier_names
  ChangeState(DiseaseViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllDiseases() async {
    ChangeState(DiseaseViewState.loading);

    try {
      final c = await DiseaseAPI.getAllDiseases();
      _diseases = c;
      notifyListeners();
      ChangeState(DiseaseViewState.none);
    } catch (e) {
      ChangeState(DiseaseViewState.error);
    }
  }
}
