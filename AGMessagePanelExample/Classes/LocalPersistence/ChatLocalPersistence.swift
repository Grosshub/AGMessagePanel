//
//  ChatLocalPersistence.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 24/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import Foundation

class ChatLocalPersistence {
    
    var messages: [ChatMessage] = []
    
    init() {
        messages.append(ChatMessage(text:"Hi there"))
        messages.append(ChatMessage(text:"In this code example I wanted to show how to use AGMessagePanel framework"))
        messages.append(ChatMessage(text:"Try to play with chat, send some message here"))
        
        messages.reverse()
    }
}
