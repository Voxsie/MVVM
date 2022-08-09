//
//  TestView.swift
//  MVVM
//
//  Created by Илья on 09.08.2022.
//

import UIKit

class TestView: UIView {

    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .success(let success):
            update(viewData: success, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.stopAnimating()
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            activityIndicator.isHidden = false
            activityIndicator.stopAnimating()
        }
    }
    
    private func update(viewData: ViewData.Data?, isHidden: Bool) {
        imageView.image = UIImage(named: viewData?.icon ?? "")
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        imageView.isHidden = isHidden
    }
}
