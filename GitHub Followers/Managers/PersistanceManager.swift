//
//  PersistanceManager.swift
//  GitHub Followers
//
//  Created by  mac on 12.08.2020.
//  Copyright © 2020 Vladimir Drozdin. All rights reserved.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func update(with favorite: Follower, actionType: PersistenceActionType, onComplete: @escaping (GFError?) -> Void) {
        retrieveFavorites { (result) in
            switch result{
            case .success(let favorites):
                var retrieveFavorites = favorites
                switch actionType {
                case .add:
                    guard !retrieveFavorites.contains(favorite) else {
                        onComplete(.alreadyInfFavorites)
                        return
                    }
                    
                    retrieveFavorites.append(favorite)
                    
                case.remove:
                    retrieveFavorites.removeAll{ $0.login == favorite.login }
                }
                
                onComplete(save(favorites: retrieveFavorites))
                
            case .failure(let error):
                onComplete(error)
            }
        }
    }
    
    static func retrieveFavorites(onComplete: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoriteData = defaults.object(forKey: Keys.favorites) as? Data else {
            onComplete(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoriteData)
            onComplete(.success(favorites))
        } catch {
            onComplete(.failure(.invalidData))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToSave
        }
    }
}
