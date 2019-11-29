//
//  ChatMessagePanelController.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 26.11.2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit
import AGMessagePanel

/// Custom implementation of AGMessagePanelController
/// In our case we have to reimplement a superview of our message panel
/// please check ChatView class and see that AGMessagePanel superview is not exactly what we need
class ChatMessagePanelController: AGMessagePanelController {
    
    fileprivate let type: MessagePanelType
    
    fileprivate var leftButtonIconDefault = UIImage(named: "attachIcon")
    fileprivate var leftButtonIconSelectedDefault = UIImage(named: "attachIconSelected")
    
    fileprivate var rightButtonIconDefault = UIImage(named: "sendIcon")
    fileprivate var rightButtonIconSelectedDefault = UIImage(named: "sendIconSelected")
    
    init(type: MessagePanelType) {
        self.type = type
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Message panel settings
    override func messagePaneSuperview() -> UIView? {
        return messagePanelView.superview?.superview
    }
    
    // MARK: - Text view settings
    override func textViewLeftOffset() -> CGFloat {
        if type == .leftAndRightButton || type == .leftButtonOnly {
            return 50.0
        }
        return 8.0
    }
    
    override func textViewRightOffset() -> CGFloat {
        if type == .leftAndRightButton || type == .rightButtonOnly {
            return 50.0
        }
        return 8.0
    }
    
    // MARK: - Left button settings
    override func leftButton() -> UIButton? {
        
        if type == .leftAndRightButton || type == .leftButtonOnly {
            let button = UIButton(type: .custom)
            button.setImage(leftButtonIconDefault, for: .normal)
            button.setImage(leftButtonIconSelectedDefault, for: .highlighted)
            return button
        }
        
        return nil
    }
    
    override func leftButtonSize() -> CGSize {
        
        if type == .leftAndRightButton || type == .leftButtonOnly {
            return CGSize(width: leftButtonIconDefault?.size.width ?? 0.0, height: leftButtonIconDefault?.size.height ?? 0.0)
        }
        return .zero
    }
    
    override func leftButtonBottomOffset() -> CGFloat {
        if type == .leftAndRightButton || type == .leftButtonOnly {
            return 14.0
        }
        return 0.0
    }
    
    override func leftButtonLeftOffset() -> CGFloat {
        if type == .leftAndRightButton || type == .leftButtonOnly {
            return 11.0
        }
        return 0.0
    }
    
    // MARK: - Right button settings
    override func rightButton() -> UIButton? {
        
        if type == .leftAndRightButton || type == .rightButtonOnly {
            let button = UIButton(type: .custom)
            button.setImage(rightButtonIconDefault, for: .normal)
            button.setImage(rightButtonIconSelectedDefault, for: .highlighted)
            return button
        }
        return nil
    }
    
    override func rightButtonSize() -> CGSize {
        
        if type == .leftAndRightButton || type == .rightButtonOnly {
            return CGSize(width: rightButtonIconDefault?.size.width ?? 0.0, height: rightButtonIconDefault?.size.height ?? 0.0)
        }
        return .zero
    }
    
    override func rightButtonBottomOffset() -> CGFloat {
        if type == .leftAndRightButton || type == .rightButtonOnly {
            return 14.0
        }
        return 0.0
    }
    
    override func rightButtonRightOffset() -> CGFloat {
        if type == .leftAndRightButton || type == .rightButtonOnly {
            return 13.0
        }
        return 0.0
    }
}
