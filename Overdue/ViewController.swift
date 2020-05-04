//
//  ViewController.swift
//  Overdue
//
//  Created by Garima Bothra on 04/05/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit

class OverdraftViewController: UIViewController {

    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var interestDisplayView: UIView!
    @IBOutlet weak var overdraftAlertTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

 // MARK: - Table view data source
extension OverdraftViewController: UITableViewDelegate, UITableViewDataSource {

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "alertSwitch", for: indexPath) as! AlertSwitchTableViewCell
            return cell
        }
        else {
          let cell =   tableView.dequeueReusableCell(withIdentifier: "requestIncrease", for: indexPath) as! UITableViewCell
            return cell
        }

    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
