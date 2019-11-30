//
//  PersistenceStorageProtocol.swift.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 30.11.2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import Foundation

/// Defines a behaviour of persistent storage for chat screen
protocol ChatPersistenceStorageProtocol {
    
    /// Chat messages
    var messages: [ChatMessage] { get set }
    
    /// Message panel type
    /// Just for testing purpose I use this property to prepare different types of messages
    var messagePanelType: MessagePanelType { get set }
    
    /// Adds a message to persistence store
    /// - Parameter message: Chat message
    mutating func add(message: ChatMessage)
}
