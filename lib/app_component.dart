import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:eggcrackin/components/navbar-component/navbar_component.dart';
import 'package:eggcrackin/services/RecipeService.dart';
import 'package:eggcrackin/services/FavouritesService.dart';
import 'package:eggcrackin/services/SearchhistoryService.dart';
import 'package:eggcrackin/components/about-component/about_component.dart';
import 'package:eggcrackin/components/recipe-component/recipe_component.dart';
import 'package:eggcrackin/components/favouritelist-component/favouritelist_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    providers: const [
      RecipeService,
      FavouritesService,
      SearchhistoryService,
      ROUTER_PROVIDERS
    ],
    directives: const [
      NavbarComponent,
    ])

@RouteConfig(const [
  const Route(
      path: '/recipes',
      name: 'Recipes',
      component: RecipeComponent,
      useAsDefault: true),
  const Route(
      path: '/favourites', name: 'Favourites', component: FavouritelistComponent),
  const Route(path: '/about', name: 'About', component: AboutComponent)
])
class AppComponent {}
