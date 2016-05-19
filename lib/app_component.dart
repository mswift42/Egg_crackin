import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angularattack2016_mswift42/components/navbar-component/navbar_component.dart';
import 'package:angularattack2016_mswift42/components/recipe-component/recipe_component.dart';
import 'package:angularattack2016_mswift42/services/RecipeService.dart';
import 'package:angularattack2016_mswift42/services/FavouritesService.dart';
import 'package:angularattack2016_mswift42/components/publisherlist-component/publisherlist_component.dart';
import 'package:angularattack2016_mswift42/components/favourite-component/favourite_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    providers: const [
      RecipeService,
      FavouritesService,
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
      path: '/favourites', name: 'Favourites', component: FavouriteComponent)
])
class AppComponent {}
