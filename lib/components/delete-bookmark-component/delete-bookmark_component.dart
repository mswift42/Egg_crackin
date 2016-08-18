import 'package:angular2/core.dart';
import 'package:eggcrackin/components/tooltip-component/tooltip_component.dart';

@Component(
    selector: 'delete-bookmark',
    templateUrl: 'delete-bookmark_component.html',
    styleUrls: const ['delete-bookmark_component.css'],
    directives: const [TooltipComponent])
class DeleteBookmarkComponent {
  @Input()
  String source_url;

  @Output()
  EventEmitter<String> onDelete = new EventEmitter<String>();

  deleteBookmark() {
    onDelete.emit(source_url);
  }
}
