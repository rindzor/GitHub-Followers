//
//  GFTextField.swift
//  GitHub Followers
//
//  Created by  mac on 07.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        minimumFontSize = 12
        returnKeyType = .go
        adjustsFontSizeToFitWidth = true
        
        clearButtonMode = .whileEditing
        
        backgroundColor = .tertiarySystemBackground
        placeholder = "Enter the username"
    }
}
