//
//  KeyboardDelegate.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 24/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import Foundation

/// Notifies a delegate about keyboard events
protocol KeyboardDelegate {
    
    // Event that occurs on keyboard appearance
    func keyboardWillAppear()
    
    /// Event that occurs when keyboard did appear
    func keyboardDidAppear()
    
    // Event that occurs when hiding a keyboard
    func keyboardWillDisappear()
    
    // Event that occurs when keyboard hiding is finished
    func keyboardDidDisappear()
}
