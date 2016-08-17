import 'package:angular2/core.dart';
import 'package:eggcrackin/services/Recipe.dart';
import 'package:eggcrackin/services/FavouritesService.dart';
import 'package:eggcrackin/components/title-component/title_component.dart';
import 'package:eggcrackin/components/publisherurl-component/publisherurl_component.dart';
import 'package:eggcrackin/components/recipesview-component/recipesview.component.dart';
import 'package:eggcrackin/components/recipeimage-component/recipeimage_component.dart';

@Component(
    selector: 'favouritelist-component',
    templateUrl: 'favouritelist_component.html',
    styleUrls: const [
      'favouritelist_component.css'
    ],
    directives: const [
      TitleComponent,
      PublisherurlComponent,
      RecipeimageComponent,
      RecipesViewComponent
    ])
class FavouritelistComponent {
  List<Recipe> favourites;

  FavouritelistComponent(FavouritesService _favouriteService) {
    favourites = _favouriteService.loadFromStorage();
  }
}
