//
//  ViewController.swift
//  Overdue
//
//  Created by Garima Bothra on 04/05/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit

class OverdraftViewController: UIViewController {

    //Creating variables
    var alertViewAllowed : Bool = true
    let shapeLayer = CAShapeLayer()
    //Creating outlets
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var interestDisplayView: UIView!
    @IBOutlet weak var labelsView: UIView!
    @IBOutlet weak var overdraftAlertTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupProgressBar()
        setupLabelView()
    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "OVERDRAFT"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: nil)
    }

    func setupProgressBar () {
        let trackLayer = CAShapeLayer()
        let limitLayer = CAShapeLayer()
        var midY = progressBarView.frame.size.width/2
        var midX = progressBarView.frame.size.height/2
        var center: CGPoint { return CGPoint(x: midX, y: midY) }
        let circularPath = UIBezierPath(arcCenter: center, radius: midY - 45, startAngle: -(5 * CGFloat.pi/4),
                                        endAngle: CGFloat.pi/4, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 40
        trackLayer.lineCap = .square
        trackLayer.fillColor = UIColor.clear.cgColor
        limitLayer.path = circularPath.cgPath
        limitLayer.strokeColor = UIColor.white.cgColor
        limitLayer.lineWidth = 40
        limitLayer.strokeEnd = 0.5
        limitLayer.lineCap = .round
        limitLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.systemTeal.cgColor
        shapeLayer.lineWidth = 40
        shapeLayer.strokeEnd = 0.25
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        progressBarView.layer.addSublayer(trackLayer)
        progressBarView.layer.addSublayer(limitLayer)
        progressBarView.layer.addSublayer(shapeLayer)

    }

    func setupLabelView() {
        let lineLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        var midY = labelsView.frame.size.width/2
        var midX = labelsView.frame.size.height/2
        var center: CGPoint { return CGPoint(x: midX, y: midY) }
        linePath.move(to: CGPoint(x: center.x - 50, y: center.y))
        linePath.addLine(to: CGPoint(x: center.x + 50, y: center.y))
     //   linePath.close()
        lineLayer.path = linePath.cgPath
        lineLayer.lineWidth = 5
        lineLayer.fillColor = UIColor.darkGray.cgColor
        labelsView.layer.addSublayer(lineLayer)

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
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "alertSwitch", for: indexPath) as! AlertSwitchTableViewCell
            cell.parentController = self
            return cell
        }
        else {
            let cell =   tableView.dequeueReusableCell(withIdentifier: "requestIncrease", for: indexPath)
            print("Cell 1")
            return cell
        }

    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
