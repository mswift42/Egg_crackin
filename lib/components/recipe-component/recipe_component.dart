import 'package:angular2/core.dart';
import 'package:eggcrackin/services/Recipe.dart';
import 'package:eggcrackin/services/RecipeService.dart';
import 'package:eggcrackin/services/SearchhistoryService.dart';
import 'package:eggcrackin/components/recipeimage-component/recipeimage_component.dart';
import 'package:eggcrackin/components/title-component/title_component.dart';
import 'package:eggcrackin/components/publisherurl-component/publisherurl_component.dart';
import 'package:eggcrackin/components/favourite-component/favourite_component.dart';
import 'package:eggcrackin/components/recipe-search/recipe-search.component.dart';
import 'package:eggcrackin/components/recipesview-component/recipesview.component.dart';

@Component(
    selector: 'recipe-component',
    templateUrl: 'recipe_component.html',
    styleUrls: const [
      'recipe_component.css'
    ],
    directives: const [
      RecipeimageComponent,
      TitleComponent,
      PublisherurlComponent,
      FavouriteComponent,
      RecipeSearchComponent,
      RecipesViewComponent
    ])
class RecipeComponent {
  final RecipeService _recservice;
  final SearchhistoryService _searchhistoryservice;
  List<Recipe> recipes;

  RecipeComponent(this._recservice, this._searchhistoryservice);

  searchRecipes(String value) {
    _recservice.recipes = [];
    _recservice.loadData(value);
    recipes = _recservice.recipes;
    _searchhistoryservice.saveSearch(value);
  }
}
