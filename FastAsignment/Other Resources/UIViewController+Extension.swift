//
//  UIView+Extension.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import Foundation

import UIKit

extension UIViewController {

    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-150, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.blue.withAlphaComponent(0.75)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {

    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}
