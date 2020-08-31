//
//  NetworkManager.swift
//  GitHub Followers
//
//  Created by  mac on 08.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://api.github.com"
    let cashe = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, onComplete: @escaping (Result<[Follower], GFError>) -> Void) {
        let endPoint = baseUrl + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            onComplete(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                onComplete(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                onComplete(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                onComplete(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                onComplete(.success(followers))
            } catch {
                onComplete(.failure(.invalidData))
            }
        }
        
        task.resume()
        
    }
    
    func getUserInfo(for username: String, onComplete: @escaping (Result<User, GFError>) -> Void) {
        let endPoint = baseUrl + "/users/\(username)"
        
        guard let url = URL(string: endPoint) else {
            onComplete(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                onComplete(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                onComplete(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                onComplete(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let user = try decoder.decode(User.self, from: data)
                onComplete(.success(user))
            } catch {
                onComplete(.failure(.invalidData))
            }
        }
        
        task.resume()
        
    }
}
