//
//  Label.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 19.10.2023.
//

import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (color: UIColor, textFont: UIFont, alignment: NSTextAlignment){
        self.init(frame: .zero)
        textColor = color
        font = textFont
        textAlignment = alignment
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
    }

}
