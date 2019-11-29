//
//  UITextView+NumberOfLines.swift
//  AGMessagePanel
//
//  Created by Alexey Gross on 24/11/2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// UITextView extension that helps to count the number of lines
extension UITextView {

    func numberOfLines() -> Int {
        if let fontUnwrapped = self.font {
            return Int(self.frame.size.height / fontUnwrapped.lineHeight)
        }
        return 0
    }

}
