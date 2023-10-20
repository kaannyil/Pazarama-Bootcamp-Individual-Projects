//
//  TableView.swift
//  ProgrammaticDesingCase
//
//  Created by Kaan Yıldırım on 19.10.2023.
//

import UIKit

class TableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (tableViewCell: UITableViewCell.Type, identifier: String){
        self.init(frame: .zero)
        register(tableViewCell, forCellReuseIdentifier: identifier)
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        isScrollEnabled = false
        allowsSelection = false
        separatorStyle = .none
        backgroundColor = .clear
    }
}
