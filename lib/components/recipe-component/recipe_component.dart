import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/services/Recipe.dart';
import 'package:angularattack2016_mswift42/services/RecipeService.dart';
import 'package:angularattack2016_mswift42/services/SearchhistoryService.dart';
import 'package:angularattack2016_mswift42/components/recipeimage-component/recipeimage_component.dart';
import 'package:angularattack2016_mswift42/components/title-component/title_component.dart';
import 'package:angularattack2016_mswift42/components/publisherurl-component/publisherurl_component.dart';
import 'package:angularattack2016_mswift42/components/favourite-component/favourite_component.dart';

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
      FavouriteComponent
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
