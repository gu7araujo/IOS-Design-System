//
//  ViewController.swift
//  DesignSystemDEMO
//
//  Created by Gustavo Araujo Santos on 22/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

struct ControllerStruct {
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

struct ControllersGroup {
    var groupName: String
    var items: [ControllerStruct]
}

enum ControllerDataSources {
    static var viewControllers = [
        ControllersGroup(groupName: "BUTTONS", items: [
            ControllerStruct(title: "Button Component", viewControllerType: ViewController.self)
        ])
    ]
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ControllerDataSources.viewControllers[section].groupName
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        ControllerDataSources.viewControllers.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ControllerDataSources.viewControllers[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vc = ControllerDataSources.viewControllers[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = vc.title
        return cell
    }

}
