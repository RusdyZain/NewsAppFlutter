import 'package:flutter/material.dart';
import 'package:newsapps/helpers/api.dart';
import 'package:newsapps/utils/const.dart';
import 'package:newsapps/models/topNews_model.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;
  TopNewsModel? resNews;

  getTopNews() async {
    final res = await api('${baseUrl}top-headlines?country=us&apiKey=$apiKey');

    if (res.status == 200) {
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }
    isLoading = false;
    notifyListeners();
  }
}
