//
//  AttractionCell.swift
//  VKRDiplomaKODE
//
//  Created by DrEMartstud on 20.02.2020.
//  Copyright © 2020 DrEMartstud. All rights reserved.
//

import UIKit

class AttractionCell: UITableViewCell {
    //MARK:- lets and vars
    var attractionImageView = UIImageView()
    var attractionTitleLabel = UILabel()
    var descriptionLabel = UILabel()
    var blackView = UIImageView()
    
    //MARK:- init()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(attractionImageView)
        addSubview(blackView)
        addSubview(attractionTitleLabel)
        addSubview(descriptionLabel)
        configureImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        configureBlackView()
        setImageConstraints()
        setBlackBviewsContraints()
        setTileLabelConstraints()
        setDescriptionLabelConstraints()
        self.selectionStyle = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init?(coder:) has not been implemented")
    }
    
    func set(attraction: Attraction) {
        attractionImageView.image = attraction.image
        attractionTitleLabel.text = attraction.title
        descriptionLabel.text = attraction.description
        blackView.image = Images.gradient
    }
    
    
    //MARK:- Configuring cell
    func configureImageView() {
        attractionImageView.layer.cornerRadius = 10
        attractionImageView.clipsToBounds = true
    }
    func configureTitleLabel() {
        attractionTitleLabel.numberOfLines = 1
        attractionTitleLabel.adjustsFontSizeToFitWidth = false
         attractionTitleLabel.set(Font.title)
    }
    func configureDescriptionLabel() {
        descriptionLabel.set(Font.description)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.adjustsFontSizeToFitWidth = false
    }
    func configureBlackView(){
        blackView.layer.cornerRadius = 10
        blackView.clipsToBounds = true
    }
    //MARK:- Setting constraints
    func setImageConstraints() {
        attractionImageView.translatesAutoresizingMaskIntoConstraints =                                  false
        attractionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive =    true
        attractionImageView.heightAnchor.constraint(equalToConstant: 219).isActive =                     true
        attractionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    func setTileLabelConstraints() {
        attractionTitleLabel.translatesAutoresizingMaskIntoConstraints =                                                     false
        attractionTitleLabel.heightAnchor.constraint(equalToConstant: 24).isActive =                                         true
        attractionTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive =                                     true
        attractionTitleLabel.leadingAnchor.constraint(equalTo: attractionImageView.leadingAnchor, constant: 8).isActive =    true
        attractionTitleLabel.trailingAnchor.constraint(equalTo: attractionImageView.trailingAnchor, constant: -8).isActive = true
       
    }
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints =                                                     false
        descriptionLabel.heightAnchor.constraint(equalToConstant: 83).isActive =                                         true
        descriptionLabel.leadingAnchor.constraint(equalTo: attractionTitleLabel.leadingAnchor, constant: 0).isActive =   true
        descriptionLabel.trailingAnchor.constraint(equalTo: attractionTitleLabel.trailingAnchor, constant: 0).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: attractionTitleLabel.bottomAnchor, constant: 16).isActive =       true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive =                          true
        
    }
    func setBlackBviewsContraints() {
        blackView.translatesAutoresizingMaskIntoConstraints =                                                    false
        blackView.leadingAnchor.constraint(equalTo: attractionImageView.leadingAnchor, constant: 0).isActive =   true
        blackView.heightAnchor.constraint(equalToConstant: 219).isActive =                                       true
        blackView.trailingAnchor.constraint(equalTo: attractionImageView.trailingAnchor, constant: 0).isActive = true
    }
}
