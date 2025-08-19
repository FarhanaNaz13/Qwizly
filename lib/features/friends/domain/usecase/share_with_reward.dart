import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/friends/share/services/share_services.dart';


@lazySingleton
class ShareWithRewardUseCase {
  final ShareService _shareService;

  ShareWithRewardUseCase(this._shareService);

  Future<void> execute(String message) async {
    await _shareService.share(message);
  }
}

