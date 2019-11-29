//
//  ChatView.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 23/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit
import AGMessagePanel

// Chat view
// For now it contains a message panel view and dummy table view to present the framework usage
class ChatView: UIView {
    
    var tableView: UITableView!
    var messagePanelView: AGMessagePanelView!
    
    // A view that holds all content and responds to the appearance of the keyboard
    fileprivate var movableView: UIView!
    fileprivate var keyboardHeight: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        movableView = UIView(frame: .zero)
        addSubview(movableView)
        
        tableView = UITableView(frame: .zero)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        messagePanelView = AGMessagePanelView(frame: .zero)
        movableView.addSubview(messagePanelView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension ChatView {
    
    func update(keyboardHeight: CGFloat) {
        
        self.keyboardHeight = keyboardHeight
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        movableView.frame = CGRect(x: 0.0,
                                   y: -keyboardHeight,
                                   width: frame.size.width,
                                   height: frame.size.height)
        
        messagePanelView.frame = CGRect(x: 0.0,
                                        y: 0.0,
                                        width: frame.size.width,
                                        height: frame.size.height)
        
        tableView.frame = CGRect(x: 0.0,
                                 y: 0.0,
                                 width: frame.size.width,
                                 height: frame.size.height - keyboardHeight - messagePanelView.messageAreaView.frame.size.height)
    }
}
