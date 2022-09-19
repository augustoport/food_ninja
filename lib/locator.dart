import 'package:event_bus/event_bus.dart';
import 'package:food_ninja/core/service/dialog_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
EventBus eventBus = EventBus();

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());

}
