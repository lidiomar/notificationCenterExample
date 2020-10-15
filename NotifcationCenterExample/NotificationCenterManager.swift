//
//  NotificationCenterManager.swift
//  NotifcationCenterExample
//
//  Created by Lidiomar Fernando dos Santos Machado on 12/10/20.
//

import Foundation


class NotificationCenterManager {
	
	var notificationTimer: Timer?
	
	func startNotificationCenter() {
		notificationTimer = Timer.scheduledTimer(timeInterval: 1,
												 target: self,
												 selector: #selector(startNotificationPost),
												 userInfo: nil,
												 repeats: true)
	}
	
	@objc private func startNotificationPost() {
		let notificationCenter = NotificationCenter.default
		notificationCenter.post(name: Notification.Name("Test"), object: nil)
	}
	
	func invalidateTimer() {
		notificationTimer?.invalidate()
	}
	
}
