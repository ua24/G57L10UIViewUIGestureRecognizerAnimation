//
//  ViewController.swift
//  G57L10
//
//  Created by Ivan Vasilevich on 10/26/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var whiteFace: FaceView!
	var face = FaceView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let trapeze = TrapezeView()
		trapeze.frame.size.width = view.frame.width/2
		trapeze.frame.size.height = trapeze.frame.size.width
		view.addSubview(trapeze)
		
		face = FaceView()
		face.frame.size.width = view.frame.width/2
		face.frame.size.height = face.frame.size.width
		face.changeHappyFace(withHappLevel: 30, andColor: .orange)
		view.addSubview(face)
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		let location = touches.first!.location(in: view)
		print(location)
		face.frame.size.width = location.x
		face.frame.size.height = location.y
	}

	@IBAction func swipeRecognized(_ sender: UISwipeGestureRecognizer) {
		print(#function)
	}
	
	@IBAction func buttonPressed() {
//		let faceForClosure = d
//		UIView.animate(withDuration: 0.2) {
//			self.face.frame.origin.y = CGFloat(arc4random()%600)
//			self.face.faceColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
//			                         green: CGFloat(arc4random_uniform(256))/255,
//			                         blue: CGFloat(arc4random_uniform(256))/255,
//			                         alpha: 1)
//			self.face.setNeedsDisplay()
//		}
		UIView.animate(withDuration: 1, animations: {
			self.whiteFace?.alpha = 0
		}) { (finished) in
			if finished {
				self.whiteFace?.removeFromSuperview()
			}
		}
		
		UIView.animate(withDuration: 1, delay: 1, options: [ .autoreverse, .repeat, .beginFromCurrentState], animations: {
			self.face.frame.origin.y = CGFloat(arc4random()%600)
			self.face.faceColor = UIColor(red: CGFloat(arc4random_uniform(256))/255,
			                              green: CGFloat(arc4random_uniform(256))/255,
			                              blue: CGFloat(arc4random_uniform(256))/255,
			                              alpha: 1)
			self.face.setNeedsDisplay()
		}, completion: nil)
		
		
	}
	

}

