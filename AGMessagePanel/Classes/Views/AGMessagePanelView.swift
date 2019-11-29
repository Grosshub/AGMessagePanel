//
//  AGMessagePanelView.swift
//  AGMessagePanel
//
//  Created by Alexey Gross on 23/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// Message panel with auto growing text view and send button to write a message to the chat
public class AGMessagePanelView: UIView {
    
    // In general, the message panel view contains two important areas
    // First is transparent area on top. Cannot handle touches
    // The second is message panel area itself
    // First is needed to adjust the second area
    public var transparentAreaView: UIView!
    public var messageAreaView: UIView!
    public var textView: UITextView!
    public var placeholderLabel: UILabel!
    
    public var leftButton: UIButton?
    public var rightButton: UIButton?
    
    public weak var delegate: AGMessagePanelDelegate? {
        
        willSet {
            messageAreaView.backgroundColor = newValue?.messagePanelColor()
            
            textView.font = newValue?.textFont() ?? UIFont.systemFont(ofSize: 12.0)
            textView.textColor = newValue?.textColor() ?? UIColor.black
            textView.delegate = newValue
            textView.backgroundColor = newValue?.textViewBackgroundColor()
            textView.layer.cornerRadius = newValue?.textViewCornerRadius() ?? 0.0
            newValue?.messagePanelView = self
            
            placeholderLabel.text = newValue?.textViewPlaceholder()
            placeholderLabel.textColor = newValue?.textViewPlaceholderColor()
            placeholderLabel.font = newValue?.textViewPlaceholderFont()
            
            if textView.text.count == 0 {
                placeholderLabel.isHidden = false
            }
            
            if let leftButton = newValue?.leftButton() {
                
                self.leftButton?.removeFromSuperview()
                self.leftButton = leftButton
                messageAreaView.addSubview(leftButton)
            }
            
            if let rightButton = newValue?.rightButton() {
                
                self.rightButton?.removeFromSuperview()
                self.rightButton = rightButton
                messageAreaView.addSubview(rightButton)
            }

            delegateHas.textViewLeftOffset = newValue?.textViewLeftOffset() ?? 0.0
            delegateHas.textViewRightOffset = newValue?.textViewRightOffset() ?? 0.0
            delegateHas.textViewTopOffset = newValue?.textViewTopOffset() ?? 0.0
            delegateHas.textViewBottomOffset = newValue?.textViewBottomOffset() ?? 0.0
            delegateHas.visibleTextLines = newValue?.textViewVisibleLines() ?? 1

            delegateHas.leftButtonSize = newValue?.leftButtonSize() ?? .zero
            delegateHas.leftButtonLeftOffset = newValue?.leftButtonLeftOffset() ?? 0.0
            delegateHas.leftButtonBottomOffset = newValue?.leftButtonBottomOffset() ?? 0.0
            
            delegateHas.rightButtonSize = newValue?.rightButtonSize() ?? .zero
            delegateHas.rightButtonRightOffset = newValue?.rightButtonRightOffset() ?? 0.0
            delegateHas.rightButtonBottomOffset = newValue?.rightButtonBottomOffset() ?? 0.0
        }
        
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    private var delegateHas: DelegateHas = DelegateHas()
    fileprivate struct DelegateHas {
        
        var textViewLeftOffset: CGFloat = 0.0
        var textViewRightOffset: CGFloat = 0.0
        var textViewTopOffset: CGFloat = 0.0
        var textViewBottomOffset: CGFloat = 0.0
        var visibleTextLines: Int = 1
        
        var leftButtonSize = CGSize(width: 0.0, height: 0.0)
        var leftButtonLeftOffset: CGFloat = 0.0
        var leftButtonBottomOffset: CGFloat = 0.0
        
        var rightButtonSize = CGSize(width: 0.0, height: 0.0)
        var rightButtonRightOffset: CGFloat = 0.0
        var rightButtonBottomOffset: CGFloat = 0.0
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        transparentAreaView = UIView(frame: .zero)
        transparentAreaView.isUserInteractionEnabled = false
        transparentAreaView.backgroundColor = .clear
        addSubview(transparentAreaView)
        
        messageAreaView = UIView(frame: .zero)
        addSubview(messageAreaView)
        
        textView = UITextView(frame: .zero)
        messageAreaView.addSubview(textView)
        
        placeholderLabel = UILabel(frame: .zero)
        placeholderLabel.isHidden = true
        textView.addSubview(placeholderLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)

        for view in subviews {
            if view.isUserInteractionEnabled && view.point(inside: convert(point, to: view), with: event)  {
                return true
            }
        }
        return false
    }
}

// MARK: - Layout
extension AGMessagePanelView {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let messagePanelAreaViewHeight: CGFloat = delegate?.messagePanelHeight() ?? 0.0
        
        transparentAreaView.frame = CGRect(x: 0.0,
                                           y: 0.0,
                                           width: frame.size.width,
                                           height: frame.size.height - messagePanelAreaViewHeight)
        
        
        messageAreaView.frame = CGRect(x: 0.0,
                                            y: frame.size.height - messagePanelAreaViewHeight,
                                            width: frame.size.width,
                                            height: messagePanelAreaViewHeight)
        
        
        if let leftButton = leftButton {

            leftButton.frame = CGRect(x: delegateHas.leftButtonLeftOffset,
                                      y: messageAreaView.frame.size.height - delegateHas.leftButtonSize.height - delegateHas.leftButtonBottomOffset,
                                      width: delegateHas.leftButtonSize.width,
                                      height: delegateHas.leftButtonSize.height)
        }
        
        if let rightButton = rightButton {
            
            rightButton.frame = CGRect(x: messageAreaView.frame.size.width - delegateHas.rightButtonSize.width - delegateHas.rightButtonRightOffset,
                                       y: messageAreaView.frame.size.height - delegateHas.rightButtonSize.height - delegateHas.rightButtonBottomOffset,
                                       width: delegateHas.rightButtonSize.width,
                                       height: delegateHas.rightButtonSize.height)
        }
        
        textView.sizeToFit()
        var textViewMaxHeight: CGFloat = messagePanelAreaViewHeight - delegateHas.textViewTopOffset - delegateHas.textViewBottomOffset
        textViewMaxHeight = textViewMaxHeight < 0.0 ? 0.0 : textViewMaxHeight
        let textViewWidth: CGFloat = messageAreaView.frame.size.width - (delegateHas.textViewLeftOffset + delegateHas.textViewRightOffset)
        let textViewHeight: CGFloat = textView.frame.size.height > textViewMaxHeight ? textViewMaxHeight : textView.frame.size.height
        textView.frame = CGRect(x: delegateHas.textViewLeftOffset,
                                y: delegateHas.textViewTopOffset,
                                width: textViewWidth,
                                height: textViewHeight)
        
        placeholderLabel.sizeToFit()
        let placeholderOriginX: CGFloat = 6.0
        let placeholderWidth: CGFloat = placeholderLabel.frame.size.width
        let placeholderMaxWidth: CGFloat = textView.frame.width - placeholderOriginX * 2
        placeholderLabel.frame = CGRect(x: placeholderOriginX,
                                        y: textView.textContainerInset.top,
                                        width: placeholderWidth > placeholderMaxWidth ? placeholderMaxWidth : placeholderWidth,
                                        height: placeholderLabel.frame.size.height)
    }
}
