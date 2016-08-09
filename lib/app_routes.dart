import 'package:angular2/router.dart';
import 'package:eggcrackin/components/recipe-component/recipe_component.dart';
import 'package:eggcrackin/components/favourite-component/favourite_component.dart';
import 'package:eggcrackin/components/about-component/about_component.dart';

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
class AppRouteConfig {}
