
@TestOn('browser')
import 'package:angular2/testing_internal.dart';
import 'package:test/test.dart';

import 'dart:html';

import 'package:eggcrackin/components/tooltip-component/tooltip_component.dart';

void main() {
  test('tooltip', () {
    return inject([TestComponentBuilder, AsyncTestCompleter],
    (TestComponentBuilder tcb, AsyncTestCompleter completer) {
      tcb.createAsync(TooltipComponent).then((cmp) {
        expect(document.body.text, isNot(contains("Tooltip Message")));
        cmp.componentInstance.message = "Tooltip Message";
        cmp.detectChanges();
        expect(document.body.text, contains('Tooltip Message'));
        completer.done();
      });
    });
  });

}
