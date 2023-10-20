//
//  ImageView.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 19.10.2023.
//

import UIKit

class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(cornerRadius: CGFloat) {
        self.init(frame: .zero)
        
        layer.cornerRadius = cornerRadius
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.masksToBounds = true
        layer.cornerRadius = 15
        contentMode = .scaleToFill
    }
}
