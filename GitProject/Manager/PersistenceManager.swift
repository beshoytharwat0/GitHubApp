//
//  PersistenceManager.swift
//  GitProject
//
//  Created by Mac on 7/3/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import Foundation

enum persistenceActionType {
    
    case add
    case remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    
    static func updateWith(favorite : Follower, actionType: persistenceActionType, complation: @escaping (ErrorMassage)-> Void ){
        
        retrieveFavorites { (follower, error) in
            if let _ = error {
                complation(.unableToComplete)
                return
            }
            
            guard let favorites = follower else {
                complation(.unableToComplete)
                return
            }
           var retrievedFavories = favorites
            if !retrievedFavories.isEmpty {
             //   retrievedFavories.contains
            }
        }
        
        
    }
    
    
    static func retrieveFavorites(complation: @escaping ([Follower]?,ErrorMassage?) -> Void){
        
        guard let favoritesDate = defaults.object(forKey: Keys.favorites) as? Data else {
           
                complation(nil, .invalidData)
                
                return
    
            }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesDate)
            complation(favorites, nil)
            
        }catch{
            complation(nil, .unabelFavorite)
            
        }
            
     }
    
    static func save(favorites:[Follower]) -> ErrorMassage?{
        
        do{
            let encoder = JSONEncoder()
            let encodedFavorites = try  encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        }catch{
            return .unabelFavorite
        }
        
    }
}


