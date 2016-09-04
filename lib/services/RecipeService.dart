import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';

import 'package:eggcrackin/services/Recipe.dart';

@Injectable()
class RecipeService {
  final String _food2forkapikey = '7987c43afcf8a03a964bbcb0c9152c84';
  List<Recipe> recipes = [];

  String get food2forkapikey => _food2forkapikey;

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
    return query + '&page=${pagenumber}';
  }

  void loadData(String query, [num pagenumber]) {
    if (pagenumber != null) {
      var request = HttpRequest
          .getString(queryUrl(addPage(query, pagenumber)))
          .then(onDataLoaded);
    } else {
      var request = HttpRequest.getString(queryUrl(query)).then(onDataLoaded);
    }
  }

  String unsanitize(String s) {
    s = s.replaceAll("&nbsp;", " ");
    return s.replaceAll("&amp;", "&");
  }

  void onDataLoaded(String response) {
    List<String> rec = JSON.decode(response)["recipes"];
    rec.forEach((i) => recipes.add(new Recipe(
        i["publisher"],
        unsanitize(i["title"]),
        i["source_url"].toString(),
        i["image_url"],
        i["publisher_url"])));
  }

  List<String> publisherNames() {
    return new List<String>.from(new Set.from(recipes.map((i) => i.publisher)));
  }
}
