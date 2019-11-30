//
//  MenuViewController.swift
//  AGMessagePanelExample
//
//  Created by Alexey Gross on 30.11.2019.
//  Copyright © 2019 Alexey Gross. All rights reserved.
//

import UIKit

/// Designed to provide various examples on how the AGMessagePanel framework could be used
class MenuViewController: UIViewController {
    
    private let kMenuOptionsCellID = "kMenuOptionsCellID"
    
    fileprivate var menuView: MenuView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        menuView = MenuView(frame: UIScreen.main.bounds)
        self.view = menuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Message Panel Examples"
        
        menuView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: kMenuOptionsCellID)
        menuView.tableView.dataSource = self
        menuView.tableView.delegate = self
    }
    
    fileprivate func cellTitle(for messagePanelType: MessagePanelType) -> String {
        
        switch messagePanelType {
        case .withoutButtons:
            return "Text view only"
        case .leftButtonOnly:
            return "Text view with left button"
        case .rightButtonOnly:
            return "Text view with right button"
        case .leftAndRightButton:
            return "Text view with left and right buttons"
        }
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessagePanelType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kMenuOptionsCellID, for: indexPath)
        
        if let messagePanelType = MessagePanelType(rawValue: indexPath.row) {
            cell.textLabel?.text = cellTitle(for: messagePanelType)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let messagePanelType = MessagePanelType(rawValue: indexPath.row) {
            
            let persistenceStorage = ChatPersistenceStorage(messagePanelType: messagePanelType)
            let viewController = ChatViewController(type: messagePanelType, persistenceStorage: persistenceStorage)
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
           tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
