//
//  AGMessagePanelDelegate.swift
//  AGMessagePanel
//
//  Created by Alexey Gross on 23/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// Methods for managing the message panel text area, send button, offsets, etc
public protocol AGMessagePanelDelegate: UITextViewDelegate {
    
    // MARK: - Message panel view settings
    /// Message panel view
    var messagePanelView: AGMessagePanelView! { get set }
    
    /// Calculates the message panel height
    func messagePanelHeight() -> CGFloat
    
    /// Returns a message panel color
    func messagePanelColor() -> UIColor
    
    /// Clears the text and updates a layout
    func clearMessagePanelText()
    
    /// Returns a reference to a message panel superview
    /// It could be usefult when you need to reload the superview layout
    /// after message panel layout update
    func messagePaneSuperview() -> UIView?
    
    // MARK: - Text view settings
    /// Number of text lines in text view that are visible to user
    func textViewVisibleLines() -> Int
    
    /// Text view's text font
    func textFont() -> UIFont
    
    /// Text view's text color
    func textColor() -> UIColor
    
    /// Background color of the text view
    func textViewBackgroundColor() -> UIColor
    
    /// Top offset of the text view
    func textViewTopOffset() -> CGFloat
    
    /// Bottom offset of the text view
    func textViewBottomOffset() -> CGFloat
    
    /// Left offset of the text view
    func textViewLeftOffset() -> CGFloat
    
    /// Right offset of the text view
    func textViewRightOffset() -> CGFloat
    
    /// Returns a corner radius of the text view
    func textViewCornerRadius() -> CGFloat
    
    /// Text view's placeholder
    func textViewPlaceholder() -> String
    
    /// Text view's placeholder color
    func textViewPlaceholderColor() -> UIColor
    
    /// Text view's placeholder font
    func textViewPlaceholderFont() -> UIFont
    
    // MARK: - Left button settings
    /// Returns a message panel left button
    func leftButton() -> UIButton?
    
    /// Returns a message panel left button size
    func leftButtonSize() -> CGSize
    
    /// Returns a bottom offset of the message panel left button
    func leftButtonBottomOffset() -> CGFloat
    
    /// Returns a left offset of the message panel left button
    func leftButtonLeftOffset() -> CGFloat
    
    // MARK: - Right button settings
    /// Returns a message panel right button
    func rightButton() -> UIButton?
    
    /// Returns a message panel right button size
    func rightButtonSize() -> CGSize
    
    /// Returns a bottom offset of the message panel right button
    func rightButtonBottomOffset() -> CGFloat
    
    /// Returns a right offset of the message panel right button
    func rightButtonRightOffset() -> CGFloat
}
