//
//  MenuView.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 30.11.2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// View for menu screen
class MenuView: UIView {
    
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        tableView = UITableView(frame: .zero)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout
extension MenuView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.frame = CGRect(x: 0.0,
                                 y: 0.0,
                                 width: frame.size.width,
                                 height: frame.size.height)
    }
}
