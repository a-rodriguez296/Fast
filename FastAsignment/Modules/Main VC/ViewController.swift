//
//  ViewController.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 26/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didPressContinue(_ sender: Any) {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .overFullScreen
        present(tabBarVC, animated: true, completion: nil)
    }
}

