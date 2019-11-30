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
    
    fileprivate static var avatarPlaceholderImage = UIImage(named: "avatar")
    fileprivate static var labelTextColor = UIColor.init(red: 89/255.0, green: 89/255.0, blue: 89/255.0, alpha: 1.0)
    
    fileprivate var avatarView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = avatarPlaceholderImage
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = (imageView.image?.size.height ?? 1) / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    fileprivate var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = labelTextColor
        label.text = "Guest"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    fileprivate var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = labelTextColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate var separatorLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = labelTextColor
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
        
        contentView.addSubview(avatarView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(separatorLine)
        
        avatarView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: avatarView.image?.size.height ?? 0.0).isActive = true
        avatarView.widthAnchor.constraint(equalToConstant: avatarView.image?.size.width ?? 0.0).isActive = true
        
        usernameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 0).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 15.0).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 3.0).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -5.0).isActive = true

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
