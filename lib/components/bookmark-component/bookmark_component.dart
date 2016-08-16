import 'package:angular2/core.dart';
import 'package:eggcrackin/services/FavouritesService.dart';
import 'package:eggcrackin/services/Recipe.dart';
import 'package:eggcrackin/components/tooltip-component/tooltip_component.dart';

@Component(
    selector: 'bookmark-component',
    templateUrl: 'bookmark_component.html',
    styleUrls: const ['bookmark_component.css'],
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
