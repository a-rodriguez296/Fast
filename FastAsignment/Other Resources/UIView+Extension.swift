//
//  UIView+Extension.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 1/03/21.
//

import UIKit

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let nibLoaded = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load nib with name: \(nibName)")
        }
        return nibLoaded
    }

    func xibSetup() {
        let subview = loadNib()
        subview.frame = bounds
        autoresizingMask = .flexibleHeight
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = true
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": subview]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": subview]))
    }
}
