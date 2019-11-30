//
//  MessagePanelType.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 26.11.2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import Foundation

/// Defines different types of message panel
/// Select .rightButtonOnly if you need a classical message panel
/// with a text view and send button on the right side
enum MessagePanelType: Int, CaseIterable {
    
    case withoutButtons     // TextView without any buttons
    case leftButtonOnly     // TextView with left button
    case rightButtonOnly    // TextView with right button
    case leftAndRightButton // TextView with left and right button
}
