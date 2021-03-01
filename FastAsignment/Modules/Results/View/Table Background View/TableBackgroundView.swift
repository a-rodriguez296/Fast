//
//  TableBackgroundView.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 1/03/21.
//

import UIKit

enum ViewState {
    case noResults
    case noInternet
}

class TableBackgroundView: UIView {



    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func configureView(with viewModel: MovieSearchErrorViewModel) {
        titleLabel.text = viewModel.title
        errorImageView.image = UIImage.init(systemName: viewModel.imageName)!
    }
}
