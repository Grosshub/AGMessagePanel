//
//  AGMessagePanelController.swift
//  AGMessagePanel
//
//  Created by Alexey Gross on 24/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// Controls the message panel behaviour through the implementation of the framework protocol
/// Inherit this class to override the default delegate values to adjust the message panel
open class AGMessagePanelController: UIViewController, AGMessagePanelDelegate {
    
    public var messagePanelView: AGMessagePanelView!
    
    fileprivate var lastMessagePanelHeight: CGFloat = 0.0
    fileprivate var lastNumberOfLines: Int = 1
    fileprivate var previousCaretRect = CGRect.zero
    fileprivate var fontDefault = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Message panel settings
    
    open func messagePanelHeight() -> CGFloat {
        
        messagePanelView.textView.sizeToFit()
        if messagePanelView.textView.numberOfLines() <= textViewVisibleLines() {
            lastMessagePanelHeight = messagePanelView.textView.frame.height + textViewTopOffset() + textViewBottomOffset()
        }
        return lastMessagePanelHeight
    }
    
    open func messagePanelColor() -> UIColor {
        return UIColor(red: 218/255.0, green: 218/255.0, blue: 218/255.0, alpha: 1.0)
    }
    
    open func clearMessagePanelText() {
        messagePanelView.textView.text = ""
        messagePanelView.placeholderLabel.isHidden = false
        updateMessagePanel()
    }
    
    open func messagePaneSuperview() -> UIView? {
        return messagePanelView.superview
    }
    
    // MARK: - Text view settings
    open func textViewVisibleLines() -> Int {
        return 3
    }
    
    open func textFont() -> UIFont {
        return fontDefault
    }
    
    open func textColor() -> UIColor {
        return .black
    }
    
    open func textViewBackgroundColor() -> UIColor {
        return .white
    }
    
    open func textViewTopOffset() -> CGFloat {
        return 10.0
    }
    
    open func textViewBottomOffset() -> CGFloat {
        return 10.0
    }
    
    open func textViewLeftOffset() -> CGFloat {
        return 10.0
    }
    
    open func textViewRightOffset() -> CGFloat {
        return 10.0
    }
    
    open func textViewCornerRadius() -> CGFloat {
        return 3.0
    }
    
    open func textViewPlaceholder() -> String {
        return "Type your text here"
    }
    
    open func textViewPlaceholderColor() -> UIColor {
        return .lightGray
    }
    
    open func textViewPlaceholderFont() -> UIFont {
        return fontDefault
    }

    // MARK: - Left button settings
    open func leftButton() -> UIButton? {
        return nil
    }
    
    open func leftButtonSize() -> CGSize {
        return .zero
    }
    
    open func leftButtonBottomOffset() -> CGFloat {
        return 0.0
    }
    
    open func leftButtonLeftOffset() -> CGFloat {
        return 0.0
    }

    // MARK: - Right button settings
    
    open func rightButton() -> UIButton? {
        return nil
    }
    
    open func rightButtonSize() -> CGSize {
        return .zero
    }
    
    open func rightButtonBottomOffset() -> CGFloat {
        return 0.0
    }
    
    open func rightButtonRightOffset() -> CGFloat {
        return 0.0
    }
}

// MARK: - UITextViewDelegate
extension AGMessagePanelController: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        
        let textPosition = textView.endOfDocument
        let caretRect = textView.caretRect(for: textPosition)
        previousCaretRect = previousCaretRect.origin.y == 0.0 ? caretRect : previousCaretRect
        if caretRect.origin.y != previousCaretRect.origin.y {
            updateMessagePanel()
        }
        previousCaretRect = caretRect
    }

    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text.count == 0 && range.location == 0 {
            
            messagePanelView.textView.text = ""
            updateMessagePanel()
        }
        
        if text.count == 0 && range.location == 0 {
            messagePanelView.placeholderLabel.isHidden = false
        } else {
            messagePanelView.placeholderLabel.isHidden = true
        }
        
        return true
    }
}

// MARK: - Message panel layout update
extension AGMessagePanelController {
    
    func updateMessagePanel() {

        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        
                        self.messagePanelView.setNeedsLayout()
                        self.messagePanelView.layoutIfNeeded()
                        if let superview = self.messagePaneSuperview() {
                            superview.setNeedsLayout()
                            superview.layoutIfNeeded()
                        }
                        
        }, completion: nil)
    }
}
