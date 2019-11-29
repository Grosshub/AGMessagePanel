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
enum MessagePanelType {
    
    case withoutButtons
    case leftButtonOnly
    case rightButtonOnly
    case leftAndRightButton
}
