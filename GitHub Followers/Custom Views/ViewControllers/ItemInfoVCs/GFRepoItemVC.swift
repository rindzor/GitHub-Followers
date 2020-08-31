//
//  GFRepoItemVC.swift
//  GitHub Followers
//
//  Created by  mac on 12.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        
        button.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func buttonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
    
}
