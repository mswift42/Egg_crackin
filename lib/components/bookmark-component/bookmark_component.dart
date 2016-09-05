import 'package:angular2/core.dart';
import 'package:eggcrackin/services/FavouritesService.dart';
import 'package:eggcrackin/services/Recipe.dart';
import 'package:eggcrackin/components/tooltip-component/tooltip_component.dart';
import 'package:eggcrackin/components/toast-component/toast.component.dart';

@Component(
    selector: 'bookmark-component',
    templateUrl: 'bookmark_component.html',
    styleUrls: const ['bookmark_component.css'],
    directives: const [TooltipComponent, ToastComponent])
class BookmarkComponent {
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
  @Output()
  EventEmitter onShow = new EventEmitter();

  final FavouritesService _favouritesService;

  BookmarkComponent(this._favouritesService);

  void bookmarkRecipe() {
    var recipe = new Recipe(publisher, title, source_url, image_url, publisher_url);
    _favouritesService.saveToStorage(recipe);
    onShow.emit(true);
  }
}
