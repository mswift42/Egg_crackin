import 'package:angular2/core.dart';
import 'package:eggcrackin/components/tooltip-component/tooltip_component.dart';
import 'package:eggcrackin/services/FavouritesService.dart';

@Component(
    selector: 'delete-bookmark',
    templateUrl: 'delete-bookmark_component.html',
    styleUrls: const ['delete-bookmark_component.css'])
class DeleteBookmarkComponent {
  @Input()
  String recipe_url;
  FavouritesService _favouriteService;

  DeleteBookmarkComponent(this._favouriteService);

  deleteBookmak() {
    _favouriteService.deleteInStorage(recipe_url);
  }
}
