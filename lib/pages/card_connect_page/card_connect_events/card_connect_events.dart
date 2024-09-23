import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../splash_screen/splash_screen.dart';

Future<void> cardAddedEvent({required String walletAddress}) async {
  await hasShownWallet().then(
    (hasShown) async {
      if (hasShown) {
        await recordAmplitudeEvent(
          GotItClicked(
            source: 'Wallet',
            walletType: 'Card',
            walletAddress: walletAddress,
          ),
        );
      } else {
        await recordAmplitudeEvent(
          GotItClicked(
            source: 'Onboarding',
            walletType: 'Card',
            walletAddress: walletAddress,
          ),
        );
      }
      await recordAmplitudeEventPartTwo(
        CardAddedEvent(
          address: walletAddress,
        ),
      );
    },
  );
}

Future<void> cardTapEvent({required String walletAddress}) async {
  await hasShownWallet().then((hasShown) {
    recordAmplitudeEventPartTwo(
      CardAddedEvent(
        address: walletAddress,
      ),
    );
    recordUserProperty(const CardTap());
    if (hasShown) {
      router.maybePop();
    } else {
      router.pushAndPopAll(
        const WalletProtectionRoute(),
      );
    }
  });
}
