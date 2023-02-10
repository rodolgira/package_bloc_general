import '../entities/bloc_entity.dart';

class BlocCore {
  final Map<String, BlocGeneral> _injector = {};
  BlocGeneral<T> getBloc<T>(String key) {
    final tmp = _injector[key.toLowerCase()];
    if (tmp == null) throw ('The BlocGeneral were not initialized');
    return _injector[key.toLowerCase()] as BlocGeneral<T>;
  }

  void addBlocGeneral<T>(String key, BlocGeneral<T> blocGeneral) {
    _injector[key.toLowerCase()] = blocGeneral;
  }

  void deleteBlocGeneral(String key) {
    key = key.toLowerCase();
    _injector[key]?.dispose();
    _injector.remove(key);
  }

  void dispose() {
    _injector.forEach(
      (key, value) {
        value.dispose();
      },
    );
  }
}

final blocCore = BlocCore();
