import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/services/Recipe.dart';

@Injectable()
class FavouritesService {
  Storage localStorage = window.localStorage;
  final _storagename = "recipes";
  List<Recipe> favourites;

  void saveToStorage(Recipe recipe) {
    var recipes = [];
    if (localStorage[_storagename] != null) {
      recipes = JSON.decode(localStorage[_storagename]);
    }
    recipes.add(JSON.encode({"title" : recipe.title, "publisher" : recipe.publisher,
    "publisher_url" : recipe.publisher_url, "source_url" : recipe.source_url,
    "image_url" : recipe.source_url}));
    localStorage[_storagename] = JSON.encode(recipes);
    print(JSON.decode(localStorage[_storagename]));
  }
  List<Recipe> loadFromStorage() {
    if (localStorage[_storagename] != null) {
      List<Map> favs = JSON.decode(localStorage[_storagename]);
      favs.forEach((i) => favourites.add(new Recipe(i["publisher"], i["title"],
          i["source_url"], i["image_url"], i["publisher_url"])));
    }
    return favourites;
  }
}


