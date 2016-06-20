import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/services/FavouritesService.dart';
import 'package:angularattack2016_mswift42/services/Recipe.dart';
import 'package:angularattack2016_mswift42/components/tooltip-component/tooltip_component.dart';

@Component(
    selector: 'favourite-component',
    templateUrl: 'favourite_component.html',
    styleUrls: const ['favourite_component.css'],
    directives: const [TooltipComponent])
class FavouriteComponent {
  @Input()
  String title;
  @Input()
  String publisher;
  @Input()
  String publisher_url;
  @Input()
  String source_url;
  @Input()
  String image_url;

  final FavouritesService _favouritesService;

  FavouriteComponent(this._favouritesService);

  void bookmarkRecipe() {
    _favouritesService.saveToStorage(
        new Recipe(publisher, title, source_url, image_url, publisher_url));
  }
}
