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
    @IBOutlet weak var subTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell (with viewModel: ResultsViewModels.MovieViewModel) {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.actors
        donwloadPoster(with: viewModel.poster)
    }

    func donwloadPoster(with stURL: String) {
        guard let url = URL(string: stURL) else { return }
        ApiClient.shared.donwloadAsset(with: url) {[weak self] data in
            let image = UIImage(data: data)
            self?.posterImageView.image = image
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        ApiClient.shared.cancelCurrentTask()
    }
}
