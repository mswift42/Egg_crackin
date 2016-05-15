import 'dart:html';
import 'dart:convert';
import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/services/Recipe.dart';

@Injectable()
class FavouritesService {
  Storage localStorage = window.localStorage;

  void saveToStorage(Recipe recipe) {
    List<String> recipes = localStorage["recipes"] ?? [];
    recipes.add(JSON.encode({"title" : recipe.title, "publisher" : recipe.publisher,
    "publisher_url" : recipe.publisher_url, "source_url" : recipe.source_url,
    "image_url" : recipe.source_url}));
    localStorage["recipes"] = JSON.encode(recipes);
  }
}


