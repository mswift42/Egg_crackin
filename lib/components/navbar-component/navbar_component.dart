import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:eggcrackin/components/recipe-component/recipe_component.dart';
import 'package:eggcrackin/components/about-component/about_component.dart';
import 'package:eggcrackin/components/favouritelist-component/favouritelist_component.dart';
import 'package:eggcrackin/components/search-history-component/search-history.component.dart';

@Component(
    selector: 'navbar-component',
    templateUrl: 'navbar_component.html',
    styleUrls: const [
      'navbar_component.css'
    ],
    directives: const [
      ROUTER_DIRECTIVES,
      RecipeComponent,
      FavouritelistComponent,
      AboutComponent,
      SearchHistoryComponent
    ])
class NavbarComponent {}
