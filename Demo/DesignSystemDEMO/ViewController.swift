//
//  ViewController.swift
//  DesignSystemDEMO
//
//  Created by Gustavo Araujo Santos on 22/02/23.
//

import UIKit

struct Item {
    var title: String
    var identifier: String
    var viewControllerType: UIViewController.Type?

    init(title: String,
         viewControllerType: UIViewController.Type,
         identifier: String? = nil) {
        self.title = title
        self.identifier = identifier ?? String(describing: viewControllerType)
        self.viewControllerType = viewControllerType
    }
}

struct Group {
    var groupName: String
    var items: [Item]
}

enum ComponentsDataSource {
    static var groupsAndItems = [
        Group(groupName: "STYLE", items: [
            Item(title: "Colors", viewControllerType: ColorsViewController.self),
            Item(title: "Typography", viewControllerType: TypographyViewController.self)
        ]),
        Group(groupName: "BUTTONS", items: [
            Item(title: "Primary Button", viewControllerType: PrimaryButtonViewController.self)
        ]),
        Group(groupName: "VIEWS", items: [
            Item(title: "Loading", viewControllerType: LoadViewController.self),
            Item(title: "Alerts", viewControllerType: AlertsViewController.self)
        ])
    ]
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ComponentsDataSource.groupsAndItems[section].groupName
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        ComponentsDataSource.groupsAndItems.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ComponentsDataSource.groupsAndItems[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vc = ComponentsDataSource.groupsAndItems[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = vc.title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ComponentsDataSource.groupsAndItems[indexPath.section].items[indexPath.row]

        if let viewControllerType = viewController.viewControllerType {
            let nextViewController = viewControllerType.init()
            show(nextViewController, sender: self)
        }
    }
}
