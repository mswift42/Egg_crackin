import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:eggcrackin/services/Recipe.dart';

@Injectable()
class FavouritesService {
  Storage localStorage = window.localStorage;
  final _storagename = "recipes";
  List<Recipe> _favourites = [];

  List<Recipe> get favourites => _favourites;

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
  }

  void deleteInStorage(String source_url) {
    _favourites = _favourites.where((i) => i.source_url != source_url);
    var encoded = _favourites
        .map((i) => JSON.encode({
              "title": i.title,
              "publisher": i.publisher,
              "publisher_url": i.publisher_url,
              "source_url": i.source_url,
              "image_url": i.image_url
            }))
        .toList();
    localStorage[_storagename] = JSON.encode(encoded);
  }

  void loadFromStorage() {
    if (localStorage[_storagename] != null) {
      var favs = JSON.decode(localStorage[_storagename]);
      favs.forEach((i) => _favourites.add(new Recipe(
          JSON.decode(i)["publisher"],
          JSON.decode(i)["title"],
          JSON.decode(i)["source_url"],
          JSON.decode(i)["image_url"],
          JSON.decode(i)["publisher_url"])));
    }
  }
}
