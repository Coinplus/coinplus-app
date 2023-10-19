//
//  CoinplusBundle.swift
//  Coinplus
//
//  Created by Hayk on 10/19/23.
//

import WidgetKit
import SwiftUI

@main
struct CoinplusBundle: WidgetBundle {
    var body: some Widget {
        Coinplus()
        CoinplusLiveActivity()
    }
}
