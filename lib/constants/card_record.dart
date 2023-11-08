import 'package:flutter/cupertino.dart';

import '../models/abstract_card/abstract_card.dart';

typedef CardRecord = ({AbstractCard? card, int index});
typedef CardChangeCallBack = ValueChanged<CardRecord>;
