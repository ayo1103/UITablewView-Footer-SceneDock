//
//  ViewController.swift
//  removeTableViewFooter
//
//  Created by Bryan Lin on 1/24/16.
//  Copyright © 2016 Giant Croissant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var footer: UIView!

    var datas = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1...10 {
            datas.append("test")
        }

        delay(5) {
            self.tableView.tableFooterView = self.footer
            self.tableView.reloadData()
        }

        delay(10) {
            self.tableView.tableFooterView = nil
            self.tableView.reloadData()
        }
    }

    func delay(delay: Double, closure: () -> ()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        return cell
    }
    
}
