import 'package:flutter/material.dart';
import 'package:newsapps/helpers/api.dart';
import 'package:newsapps/utils/const.dart';
import 'package:newsapps/models/TopNewsModel.dart';

class NewsProvider with ChangeNotifier {
  bool isLoading = true;

  bool isLoadingSearch = true;
  bool isDataEmpty = true;

  TopNewsModel? resNews;
  TopNewsModel? resSearch;

  setLoading(data) {
    isLoading = false;
    notifyListeners();
  }

  getTopNews() async {
    final res = await api('${baseUrl}top-headlines?country=us&apiKey=$apiKey');

    if (res.statusCode == 200) {
      resNews = TopNewsModel.fromJson(res.data);
    } else {
      resNews = TopNewsModel();
    }
    isLoading = false;
    notifyListeners();
  }

  search(String search) async {
    isDataEmpty = false;
    isLoadingSearch = true;
    notifyListeners();

    final res =
        await api('${baseUrl}q=$search&sortBy=popularity&apiKey=$apiKey');

    if (res.statusCode == 200) {
      resSearch = TopNewsModel.fromJson(res.data);
    } else {
      resSearch = TopNewsModel();
    }

    isLoadingSearch = false;
    notifyListeners();
  }
}
