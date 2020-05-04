//
//  OverdraftsTabViewController.swift
//  Overdue
//
//  Created by Garima Bothra on 05/05/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit

class OverdraftsTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
            self.selectedIndex = 4
    }
    
}
