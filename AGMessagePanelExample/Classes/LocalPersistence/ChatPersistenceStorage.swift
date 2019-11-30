//
//  ChatLocalPersistence.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 24/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import Foundation

/// Persistant store that is needed to store and fetch chat data
/// Designed for testing purpose
struct ChatPersistenceStorage: ChatPersistenceStorageProtocol {
    
    var messages: [ChatMessage] = []
    var messagePanelType: MessagePanelType
    
    init(messagePanelType: MessagePanelType) {
        
        self.messagePanelType = messagePanelType
        
        let mockMessages = [MessagePanelType.withoutButtons: "You could try to write a message with multiple lines",
                            MessagePanelType.leftButtonOnly: "Use '+' button to see options",
                            MessagePanelType.rightButtonOnly: "Try to play with chat, send some message here"]
        
        switch messagePanelType {
        case .withoutButtons:
            messages.append(ChatMessage(text: mockMessages[.withoutButtons] ?? ""))
            
        case .leftButtonOnly:
            
            messages.append(ChatMessage(text: mockMessages[.withoutButtons] ?? ""))
            messages.append(ChatMessage(text: mockMessages[.leftButtonOnly] ?? ""))
            
        case .rightButtonOnly:
            messages.append(ChatMessage(text: mockMessages[.withoutButtons] ?? ""))
            messages.append(ChatMessage(text: mockMessages[.rightButtonOnly] ?? ""))
            
        case .leftAndRightButton:
            messages.append(ChatMessage(text: mockMessages[.withoutButtons] ?? ""))
            messages.append(ChatMessage(text: mockMessages[.leftButtonOnly] ?? ""))
            messages.append(ChatMessage(text: mockMessages[.rightButtonOnly] ?? ""))
        }
        
        // Long message testing
        let longMessage = "«The important thing is not to stop questioning. Curiosity has its own reason for existence. One cannot help but be in awe when he contemplates the mysteries of eternity, of life, of the marvelous structure of reality. It is enough if one tries merely to comprehend a little of this mystery each day»\n\n@Albert Einstein"
        messages.append(ChatMessage(text: longMessage))
    }
    
    mutating func add(message: ChatMessage) {
        messages.insert(message, at: 0)
    }
}
