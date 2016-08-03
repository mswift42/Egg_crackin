import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:eggcrackin/components/navbar-component/navbar_component.dart';
import 'package:eggcrackin/components/recipe-component/recipe_component.dart';
import 'package:eggcrackin/services/RecipeService.dart';
import 'package:eggcrackin/services/FavouritesService.dart';
import 'package:eggcrackin/components/publisherlist-component/publisherlist_component.dart';
import 'package:eggcrackin/components/favourite-component/favourite_component.dart';
import 'package:eggcrackin/components/about-component/about_component.dart';
import 'package:eggcrackin/services/SearchhistoryService.dart';

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
      RecipeComponent,
      PublisherlistComponent,
      ROUTER_DIRECTIVES
    ])
@RouteConfig(const [
  const Route(
      path: '/',
      name: 'Recipes',
      component: RecipeComponent,
      useAsDefault: true),
  const Route(
      path: '/favourites', name: 'Favourites', component: FavouriteComponent),
  const Route(path: '/about', name: 'About', component: AboutComponent)
])
class AppComponent {}
