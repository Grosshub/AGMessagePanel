//
//  ChatMessageCell.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 26.11.2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// Simple chat message cell
class ChatMessageCell: UITableViewCell {
    
    fileprivate var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.init(red: 89/255.0, green: 89/255.0, blue: 89/255.0, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate var separatorLine: UIView = {
        let line = UIView(frame: .zero)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.init(red: 89/255.0, green: 89/255.0, blue: 89/255.0, alpha: 1.0)
        return line
    }()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        isHidden = false
        isSelected = false
        isHighlighted = false

        update(text: "")
    }
    
    func configureSubviews() {

        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(messageLabel)
        contentView.addSubview(separatorLine)
        
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0).isActive = true
        messageLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true

        let separatorLineHeight: CGFloat = 1.0 / UIScreen.main.scale
        separatorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -separatorLineHeight).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: separatorLineHeight).isActive = true
    }
}

// MARK: - Layout
extension ChatMessageCell {
    
    func update(text: String) {
        messageLabel.text = text
    }
}
