//
//  FavoriteMovieViewCell.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 28/02/21.
//

import UIKit

class FavoriteMovieViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configureCell (with viewModel: MovieViewModel) {
        titleLabel.text = viewModel.title
        donwloadPoster(with: viewModel.poster)
    }

    func donwloadPoster(with stURL: String) {
        guard let url = URL(string: stURL) else { return }
        ApiClient.shared.donwloadAsset(with: url) {[weak self] data in
            let image = UIImage(data: data)
            self?.posterImageView.image = image
        }
    }
}
