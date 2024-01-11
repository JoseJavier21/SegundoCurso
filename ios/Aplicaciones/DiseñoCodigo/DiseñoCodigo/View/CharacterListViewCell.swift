//
//  CharacterViewCell.swift
//  DiseñoCodigo
//
//  Created by dam2 on 11/1/24.
//

import UIKit
import Kingfisher

class CharacterListViewCell: UITableViewCell {
    
    let characterImageView: UIImageView = {
        
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let characterName: UILabel = {
        let label =  UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterStatus: UILabel = {
        let label =  UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let characterSpecie: UILabel = {
        let label =  UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) no esta inicializado")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(){
        addSubview(characterName)
        addSubview(characterSpecie)
        addSubview(characterStatus)
        addSubview(characterImageView)
        
        NSLayoutConstraint.activate([
            
            //Image
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalToConstant: 80),
            
            //Nombre
            characterName.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 20),
            characterName.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            
            //Status
            characterStatus.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 8),
            
            //Species
            characterSpecie.leadingAnchor.constraint(equalTo: characterStatus.leadingAnchor),
            characterSpecie.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 8),
            
            
        ])
    }
    
    func configure(_ model: CharacterModel){
        self.characterName.text = model.name
        self.characterSpecie.text = model.species
        self.characterStatus.text = model.status
        self.characterImageView.kf.setImage(with: URL(string: model.image))
    }

    
}
