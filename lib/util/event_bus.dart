/*
 * @Author: shaolin 
 * @Date: 2020-07-02 17:17:13 
 * @Last Modified by:   shaolin 
 * @Last Modified time: 2020-07-02 17:17:13 
 */
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ThemeColorEvent {
  ThemeColorEvent(this.colorStr);
  String colorStr;
}
