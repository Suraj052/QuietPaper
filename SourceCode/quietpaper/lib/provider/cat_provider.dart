import 'package:flutter/material.dart';
import 'package:quietpaper/model/cat_model.dart';
import 'package:quietpaper/service/cat_service.dart';

class CatProvider extends ChangeNotifier
{
    final _service = ApiService();
    bool isLoading = false;
    List<CatModel> _catmodels = [];
    List<CatModel> get catmodels => _catmodels;

    Future<void> getProvider() async
    {
      isLoading = true;
      notifyListeners();

      final response = await _service.getRepo();
      _catmodels = response;

      isLoading = false;
      notifyListeners();
    }
}