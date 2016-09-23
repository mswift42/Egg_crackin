import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';

import 'package:eggcrackin/services/Recipe.dart';

@Injectable()
class RecipeService {
  final String _food2forkapikey = '7987c43afcf8a03a964bbcb0c9152c84';
  List<Recipe> recipes = [];
  List<Recipe> _nextPage = [];

  List<Recipe> _prevPage = [];
  int _currentpage = 1;
  bool food2forkIsDown = false;
  bool _noResults = false;

  String get food2forkapikey => _food2forkapikey;

  void incCurrentPage() {
    _currentpage++;
  }

  void decCurrentPage() {
    _currentpage--;
  }

  int get currentpage => _currentpage;

  String queryUrl(String query) {
    var split = query.trim().split(" ");
    var url = "/searchrecipe?query=";
    url += split[0];
    for (var s in split.sublist(1)) {
      url += "+" + s;
    }
    return url;
  }

  String addPage(String query, num pagenumber) {
    return query + '&page=$pagenumber';
  }

  void loadData(String query, [num pagenumber]) {
    HttpRequest
        .getString(queryUrl(addPage(query, _currentpage)))
        .then((String response) {
      if (pagenumber != null) {
        onDataLoaded(response, pagenumber);
      } else {
        onDataLoaded(response, _currentpage);
      }
    }).catchError(handleError);
  }

  void onDataLoaded(String response, num pagenumber) {
    List rec = JSON.decode(response)["recipes"];
    if (pagenumber > _currentpage) {
      rec.forEach((i) => _nextPage.add(new Recipe.fromJsonMap(i)));
    } else {
      rec.forEach((i) => recipes.add(new Recipe.fromJsonMap(i)));
    }
  }

  void cacheNextPage(String query) {
    incCurrentPage();
    HttpRequest
        .getString(queryUrl(addPage(query, _currentpage)))
        .then((String response) {
      saveNextPage(response);
    }).catchError(handleError);
    decCurrentPage();
  }

  void saveNextPage(String response) {
    List rec = JSON.decode(response)["recipes"];
    rec.forEach((i) => _nextPage.add(new Recipe.fromJsonMap(i)));
  }

  void togglefood2forkStatus() {
    food2forkIsDown = !food2forkIsDown;
  }

  void handleError(Error error) {
    togglefood2forkStatus();
  }

  bool get noResults => _noResults;
}
