import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/services/Recipe.dart';
import 'package:angularattack2016_mswift42/services/FavouritesService.dart';
import 'package:angularattack2016_mswift42/components/title-component/title_component.dart';
import 'package:angularattack2016_mswift42/components/publisherurl-component/publisherurl_component.dart';

@Component(
    selector: 'favouritelist-component',
    templateUrl: 'favouritelist_component.html',
styleUrls: const ['favouritelist_component.css'],
directives: const [TitleComponent, PublisherurlComponent]
)
class FavouritelistComponent {
  List<Recipe> favourites;

  FavouritelistComponent(FavouritesService _favouriteService) {
    favourites = _favouriteService.loadFromStorage();
  }
}