//
//  ViewController.swift
//  NotifcationCenterExample
//
//  Created by Lidiomar Fernando dos Santos Machado on 12/10/20.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var viewOne: UIView!
	@IBOutlet var viewTwo: UIView!
	@IBOutlet var viewThree: UIView!
	var notificationCenterManager: NotificationCenterManager?
		
	override func viewDidLoad() {
		super.viewDidLoad()
		configNotificationManager()
		configObserver()
	}
	
	private func configNotificationManager() {
		notificationCenterManager = NotificationCenterManager()
		notificationCenterManager?.startNotificationCenter()
	}
	
	private func configObserver() {
		let notificationCenter = NotificationCenter.default
		notificationCenter.addObserver(self, selector: #selector(updateViewsColor), name: Notification.Name("Test"), object: nil)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		notificationCenterManager?.invalidateTimer()
	}
	
	@objc func updateViewsColor(_ notification: Notification) {
		viewOne.backgroundColor = getColor()
		viewTwo.backgroundColor = getColor()
		viewThree.backgroundColor = getColor()
	}
	
	private func getColor() -> UIColor {
		let colorArray: [UIColor] = [.black,
									 .blue,
									 .red,
									 .brown,
									 .gray,
									 .green,
									 .purple,
									 .orange,
									 .cyan]
		
		let index = Int.random(in: 0..<colorArray.count)
		return colorArray[index]
	}
}

