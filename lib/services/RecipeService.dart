import 'package:angularattack2016_mswift42/services/Recipe.dart';
import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';

@Injectable()
class RecipeService {
  final String _food2forkapikey = '7987c43afcf8a03a964bbcb0c9152c84';
  List<Recipe> recipes = [];

  String get food2forkapikey => _food2forkapikey;

  String queryUrl(String query) {
    var split = query.trim().split(" ");
    var key = food2forkapikey;
    var res = "http://food2fork.com/api/search?key=$key&q=";
    res += split[0];
    for (var s in split.sublist(1)) {
      res += "&$s";
    }
    return res;
  }
  void loadData(String query) {
    var request = HttpRequest.getString(queryUrl(query)).then(onDataLoaded);
  }

  void onDataLoaded(String response) {
  List<String> rec = JSON.decode(response)["recipes"];
    rec.forEach((i)=> recipes.add(new Recipe(i["publisher"], i["title"],
        i["source_url"], i["image_url"], i["publisher_url"])));
 }
  List<String> publisherNames() {
    return recipes.map((i) => i.publisher);
  }

}

