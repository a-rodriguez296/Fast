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
        // Do any additional setup after loading the view.

        ApiClient.shared.execute(request: GetMovies(keyword: "Inception")) { (apiResult: APIResult<Movie>) in
            switch apiResult {
            case .success(_, let result):
                print(result)
            case .failure(let error):
                print("\(error.localizedDescription)")
            case .empty:
                print("no results")
            }
        }
    }


}

