//
//  ChatViewController.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 23/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// View controller that controls the chat view
class ChatViewController: UIViewController {
    
    private var chatView: ChatView!
    private let keyboardController = KeyboardController()
    private let chatMessagePanelController = ChatMessagePanelController(type: .rightButtonOnly)
    
    // Table view content
    private let chatLocalPersistence = ChatLocalPersistence()
    private let kChatMessageCellID = "kChatMessageCellID"
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        chatView = ChatView(frame: UIScreen.main.bounds)
        self.view = chatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chat Room"
        
        // Important: be sure you set the message panel delegate
        chatView.messagePanelView.delegate = chatMessagePanelController
        
        keyboardController.delegate = self
        
        let tableViewTap = UITapGestureRecognizer(target: self, action: #selector(tableViewTap(_:)))
        chatView.tableView.addGestureRecognizer(tableViewTap)
        
        chatView.tableView.dataSource = self
        chatView.tableView.estimatedRowHeight = 100
        chatView.tableView.rowHeight = UITableView.automaticDimension
        chatView.tableView.register(ChatMessageCell.self, forCellReuseIdentifier: kChatMessageCellID)
        
        chatView.messagePanelView.rightButton?.addTarget(self, action: #selector(sendMessageButtonTap), for: .touchUpInside)
    }
}

// MARK: Keyboard
extension ChatViewController: KeyboardDelegate {
    
    func keyboardWillAppear() {
        
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {

                        self.chatView.update(keyboardHeight: self.keyboardController.keyboardSize.height)

        }, completion: nil)
    }
    
    func keyboardDidAppear() {
        
    }
    
    func keyboardWillDisappear() {
        
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {

                        self.chatView.update(keyboardHeight: self.keyboardController.keyboardSize.height)
                        
        }, completion: nil)
    }
    
    func keyboardDidDisappear() {
        
    }
}

// MARK: - UIButtons events and gestures
extension ChatViewController {
    
    @objc func tableViewTap(_ sender: UITapGestureRecognizer? = nil) {
        chatView.messagePanelView.textView.resignFirstResponder()
    }
    
    @objc func sendMessageButtonTap() {
        
        if let text = chatView.messagePanelView.textView.text, text.count > 0 {
            let chatMessage = ChatMessage(text: text)
            chatLocalPersistence.messages.insert(chatMessage, at: 0)
            
            DispatchQueue.main.async {
                self.chatMessagePanelController.clearMessagePanelText()

                let indexPath = IndexPath(row: 0, section: 0)
                self.chatView.tableView.beginUpdates()
                self.chatView.tableView.insertRows(at: [indexPath], with: .top)
                self.chatView.tableView.endUpdates()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatLocalPersistence.messages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kChatMessageCellID, for: indexPath) as? ChatMessageCell else {
            return UITableViewCell()
        }
        
        if indexPath.row < chatLocalPersistence.messages.count {
            let message = chatLocalPersistence.messages[indexPath.row]
            cell.update(text: message.text)
        }
        
        return cell
    }
}
