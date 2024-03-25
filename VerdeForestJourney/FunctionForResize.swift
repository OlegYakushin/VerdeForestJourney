//
//  FunctionForResize.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/25/24.
//

import Foundation
import SwiftUI
func sizeScreenIphone() -> CGFloat {
    if UIScreen.main.bounds.width > UIScreen.main.bounds.height {
        return UIScreen.main.bounds.width / 844
    } else {
        return UIScreen.main.bounds.width / 390
    }
}

