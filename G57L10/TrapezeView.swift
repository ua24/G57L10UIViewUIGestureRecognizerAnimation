//
//  TrapezeView.swift
//  G37L7
//
//  Created by Ivan Vasilevich on 3/10/16.
//  Copyright © 2016 Ivan Besarab. All rights reserved.
//

import UIKit

class TrapezeView: UIView {

    func setup() {
        backgroundColor = .clear
        clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

	override func draw(_ rect: CGRect) {
        // Drawing code
        let width = bounds.width, height = bounds.height
        let path = UIBezierPath()
		path.move(to: CGPoint(x: 10, y: 10))
		path.addLine(to: CGPoint(x: width, y: 0))
		path.addLine(to: CGPoint(x: width * 0.75, y: height))
		path.addLine(to: CGPoint(x: width * 0.25, y: height))
		path.close()
        path.lineWidth *= 2
		path.lineJoinStyle = .round
		UIColor.orange.setStroke()
		UIColor.cyan.setFill()
        path.stroke()
        path.fill()
//        NSAttributedString(string: "hello").drawInRect(<#T##rect: CGRect##CGRect#>)
    }

}
