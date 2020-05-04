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
    var alertViewAllowed: Bool = true
    var eventsTimer: Timer?
    let shapeLayer = CAShapeLayer()
    //Creating outlets
    @IBOutlet weak var overdraftLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var interestDisplayView: UIView!
    @IBOutlet weak var labelsView: UIView!
    @IBOutlet weak var overdraftAlertTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupProgressBar()
        setupLabelView()
        updateTimer()
    }
    func setupNavBar() {
        navigationController?.navigationBar.topItem?.title = "OVERDRAFT"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: nil)
    }

    func setupProgressBar () {
        let trackLayer = CAShapeLayer()
        let limitLayer = CAShapeLayer()
        var midY = progressBarView.frame.size.width/2 + 10
        var midX = progressBarView.frame.size.height/2
        var center: CGPoint { return CGPoint(x: midX, y: midY) }
        let circularPath = UIBezierPath(arcCenter: center, radius: midY * 0.8, startAngle: -(5 * CGFloat.pi/4),
                                        endAngle: CGFloat.pi/4, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 40
        trackLayer.lineCap = .round
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
        shapeLayer.strokeEnd = 0.05
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
       // shapeLayer.transform = CATransform3DRotate(CATransform3DIdentity, -CGFloat.pi / 2, 0, 0, 1)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "requestIncrease", for: indexPath)
            return cell
        }

    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension OverdraftViewController {
    func updateTimer() {
        eventsTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (timer) in
            let randomOverdraft = Double.random(in: 0 ..< 200)
            let overdraft = UserDefaults.standard.double(forKey: "overdraftMoney")
            let overlay = randomOverdraft + overdraft
            UserDefaults.standard.set(overlay, forKey: "overdraftMoney")
            self.shapeLayer.strokeEnd = CGFloat(overlay/2000)
            let simpleInterest = (8.9 * Double(overlay) * 0.25)/100
            let stringInterest = String(format: "%.2f", simpleInterest)
            self.interestLabel.text = stringInterest + "€"
            self.overdraftLabel.text = String(format: "%.2f", overlay) + "€"

            if(overdraft < 1000) && overlay > 1000 && self.alertViewAllowed{
                let alert = UIAlertController(title: "Overdraft Limit Exceeded", message: "Your overdraft amount has exceeded the set limit of 1000€", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            if(overdraft < 2000) && overlay > 2000 {
                let alert = UIAlertController(title: "Overdraft Exceeded", message: "Your overdraft amount has exceeded double the set limit, i.e. 2000€", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
