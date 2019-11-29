//
//  KeyboardProtocol.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 24/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// Controls the keyboard appearance and sizing
protocol KeyboardProtocol {
    
    // Determines whether the keyboard is visible
    var isKeyboardVisible: Bool { get set }
    
    /// Returns a keyboard size
    var keyboardSize: CGSize { get set }
}
