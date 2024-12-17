import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> checkConnectivity(Function(bool) onStatusChanged) async {
  bool isConnected = await InternetConnectionChecker().hasConnection;
  onStatusChanged(isConnected);

  InternetConnectionChecker().onStatusChange.listen((status) {
    onStatusChanged(status == InternetConnectionStatus.connected);
  });
}
