// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angularattack2016_mswift42/components/navbar-component/navbar_component.dart';
import 'package:angularattack2016_mswift42/components/recipe-component/recipe_component.dart';
import 'package:angularattack2016_mswift42/services/RecipeService.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    providers: const [RecipeService],
    directives: const [NavbarComponent, RecipeComponent])
class AppComponent {}
