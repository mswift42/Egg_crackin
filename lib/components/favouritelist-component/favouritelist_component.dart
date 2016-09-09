import 'package:angular2/core.dart';
import 'package:eggcrackin/services/Recipe.dart';
import 'package:eggcrackin/services/FavouritesService.dart';
import 'package:eggcrackin/components/title-component/title_component.dart';
import 'package:eggcrackin/components/publisherurl-component/publisherurl_component.dart';
import 'package:eggcrackin/components/recipesview-component/recipesview.component.dart';
import 'package:eggcrackin/components/recipeimage-component/recipeimage_component.dart';
import 'package:eggcrackin/components/delete-bookmark-component/delete-bookmark_component.dart';

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
      RecipesViewComponent,
      DeleteBookmarkComponent
    ])
class FavouritelistComponent implements OnInit {
  List<Recipe> favourites = [];
  FavouritesService _favouriteService;

  FavouritelistComponent(this._favouriteService);

  @override
  void ngOnInit() {
    _favouriteService.loadFromStorage();
    favourites = _favouriteService.favourites;
  }
  void deleteBookmark(String source_url) {
    favourites = favourites.where((i) => i.source_url != source_url);
    _favouriteService.deleteInStorage(source_url);
  }
}
