import 'package:gaimon/gaimon.dart';
import 'package:get_it/get_it.dart';

import '../../../../../extensions/num_extension.dart';
import '../../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../../services/amplitude_service.dart';
import '../../send_to_state.dart';

SendToState get _sendToState => GetIt.I<SendToState>();

Future<void> useMaxAction() async {
  final res = _sendToState.onUseMax();
  if (res == 0) {
    _sendToState.usdController.text = '0';
    _sendToState.btcController.text = '0';
    await recordAmplitudeEventPartTwo(
      const UseMaxClicked(amount: '0', enoughFunds: 'false'),
    );
    Gaimon.error();
    return;
  }
  if (res != 0 &&
      res >
          _sendToState.transactionsStore.txFee.satoshiToUsd(
            btcCurrentPrice: _sendToState.btcPrice,
          )) {
    final maxSendAmount = res -
        _sendToState.transactionsStore.txFee.satoshiToUsd(
          btcCurrentPrice: _sendToState.btcPrice,
        );
    _sendToState.setAmount(maxSendAmount.toString());
    await recordAmplitudeEventPartTwo(
      UseMaxClicked(
        amount: maxSendAmount.toString(),
        enoughFunds: 'true',
      ),
    );
    _sendToState.usdController.text = maxSendAmount.toStringAsFixed(3);
    final btcAmount = res.usdToBtc(btcCurrentPrice: _sendToState.btcPrice);

    final txFeeInBtc = _sendToState.transactionsStore.txFee.satoshiToBtc();

    final maxSendAmountInBtc = btcAmount - txFeeInBtc;
    _sendToState.setAmount(
      maxSendAmountInBtc.btcToUsd(btcCurrentPrice: _sendToState.btcPrice).toString(),
    );
    _sendToState.btcController.text = maxSendAmountInBtc.toStringAsFixed(8).toString();
  } else {
    _sendToState.usdController.text = '0';
    _sendToState.btcController.text = '0';
    await recordAmplitudeEventPartTwo(
      const UseMaxClicked(amount: '0', enoughFunds: 'false'),
    );
    Gaimon.error();
  }
}
