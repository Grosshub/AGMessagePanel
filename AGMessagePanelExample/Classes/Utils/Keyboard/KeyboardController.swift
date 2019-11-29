//
//  KeyboardController.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 24/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

class KeyboardController: KeyboardProtocol {
    
    var isKeyboardVisible: Bool = false
    var keyboardSize: CGSize = CGSize(width: 0.0, height: 0.0)
    var delegate: KeyboardDelegate?
 
    init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidAppear), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidDisappear), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
}

// MARK: - Keyboard events
extension KeyboardController {
    
    @objc func keyboardWillAppear(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.keyboardSize = keyboardSize.size
        }
        
        isKeyboardVisible = true
        
        if let delegate = delegate {
            delegate.keyboardWillAppear()
        }
    }
    
    @objc func keyboardDidAppear() {
        
        if let delegate = delegate {
            delegate.keyboardDidAppear()
        }
    }

    @objc func keyboardWillDisappear() {
        
        isKeyboardVisible = false
        keyboardSize = CGSize(width: 0.0, height: 0.0)
        
        if let delegate = delegate {
            delegate.keyboardWillDisappear()
        }
    }
    
    @objc func keyboardDidDisappear() {
        
        if let delegate = delegate {
            delegate.keyboardDidDisappear()
        }
    }
}
