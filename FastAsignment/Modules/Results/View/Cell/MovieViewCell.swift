//
//  MovieViewCell.swift
//  FastAsignment
//
//  Created by Alejandro Rodríguez on 27/02/21.
//

import UIKit

class MovieViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!

    var viewModel: ResultsViewModels.MovieViewModel?
    var actionHandler: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell (with viewModel: ResultsViewModels.MovieViewModel, handler: @escaping (Bool) -> Void) {
        self.viewModel = viewModel
        actionHandler = handler
        titleLabel.text = viewModel.title
        genresLabel.text = viewModel.genre
        actorsLabel.text = viewModel.actors
        plotLabel.text = viewModel.plot
        configureFavoriteButton(with: viewModel.isFavorite)
        donwloadPoster(with: viewModel.poster)
    }

    func donwloadPoster(with stURL: String) {
        guard let url = URL(string: stURL) else { return }
        ApiClient.shared.donwloadAsset(with: url) {[weak self] data in
            let image = UIImage(data: data)
            self?.posterImageView.image = image
        }
    }

    func configureFavoriteButton(with flag: Bool) {
        if flag {
            favoriteButton.setImage(UIImage(systemName: "star.fill")!, for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star")!, for: .normal)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        ApiClient.shared.cancelCurrentTask()
    }

    @IBAction func didPressFavoriteButton(_ sender: Any) {
        viewModel?.isFavorite.toggle()
        guard let favoriteFlag = viewModel?.isFavorite else { return }
        configureFavoriteButton(with: favoriteFlag)
        actionHandler?(favoriteFlag)
    }
}
