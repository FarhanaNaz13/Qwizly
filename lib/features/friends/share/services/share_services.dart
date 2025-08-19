import 'package:share_plus/share_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ShareService {
  Future<void> share(String message) async {
    await SharePlus.instance.share(
      ShareParams(
        text: message,
      ),
    );
  }
}

