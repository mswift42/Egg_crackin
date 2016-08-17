import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:eggcrackin/services/Recipe.dart';

@Injectable()
class FavouritesService {
  Storage localStorage = window.localStorage;
  final _storagename = "recipes";
  List<Recipe> favourites = [];

  void saveToStorage(Recipe recipe) {
    var recipes = [];
    if (localStorage[_storagename] != null) {
      recipes = JSON.decode(localStorage[_storagename]);
    }
    recipes.add(JSON.encode({
      "title": recipe.title,
      "publisher": recipe.publisher,
      "publisher_url": recipe.publisher_url,
      "source_url": recipe.source_url,
      "image_url": recipe.image_url
    }));
    localStorage[_storagename] = JSON.encode(recipes);
    print(JSON.decode(localStorage[_storagename]));
  }

  void deleteInStorage(Recipe recipe) {
    var recipes = [];
    if (localStorage[_storagename] != null) {
      recipes = JSON.decode(localStorage[_storagename]);
    }
    recipes = recipes.where((i) => i["source_url"] != recipe.source_url);
    localStorage[_storagename] = JSON.encode(recipes);
  }

  List<Recipe> loadFromStorage() {
    if (localStorage[_storagename] != null) {
      List<Map> favs = JSON.decode(localStorage[_storagename]);
      favs.forEach((i) => favourites.add(new Recipe(
          JSON.decode(i)["publisher"],
          JSON.decode(i)["title"],
          JSON.decode(i)["source_url"],
          JSON.decode(i)["image_url"],
          JSON.decode(i)["publisher_url"])));
    }
    return favourites;
  }
}
