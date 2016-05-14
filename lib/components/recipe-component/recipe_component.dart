import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/services/Recipe.dart';
import 'package:angularattack2016_mswift42/services/RecipeService.dart';
import 'package:angularattack2016_mswift42/components/recipeimage-component/recipeimage_component.dart';
import 'package:angularattack2016_mswift42/components/title-component/title_component.dart';

@Component(
    selector: 'recipe-component',
templateUrl: 'recipe_component.html',
styleUrls: const ['recipe_component.css'],
directives: const [RecipeimageComponent, TitleComponent]
)

class RecipeComponent {
  final RecipeService _recservice;
  List<Recipe> recipes;

  RecipeComponent(this._recservice);

  searchRecipes(String value) {
    _recservice.loadData(value);
    recipes = _recservice.recipes;
    recipes.forEach((i) => print(i.image_url));
  }
}