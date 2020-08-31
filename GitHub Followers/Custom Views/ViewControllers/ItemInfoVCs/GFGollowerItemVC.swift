//
//  GFGollowerItemVC.swift
//  GitHub Followers
//
//  Created by  mac on 12.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemViewOne.set(itemInfoType: .followers, with: user.followers)
        itemViewTwo.set(itemInfoType: .following, with: user.following)
        
        button.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func buttonTapped() {
        delegate.didTapGitHubFollowers(for: user)
    }
}
