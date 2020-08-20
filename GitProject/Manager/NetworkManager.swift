//
//  NetworkManager.swift
//  GitProject
//
//  Created by Mac on 6/24/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class NetworkManager {
    
  static let shared = NetworkManager()
    
   private let baseURl = "https://api.github.com/users/"
    
    // creat cache to not relaod image evertime when i scroll up again
    let cache  = NSCache<NSString, UIImage>()
    
    private init () {
        
    }
    
    func getFollowers(for username:String ,page: Int, complation: @escaping([Follower]?,ErrorMassage?)->Void){
        
        let endpoint = baseURl + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            
            complation(nil, .invalidUsername)
             return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
           if let _ = error {
                complation(nil, .unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                complation(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                complation(nil, .invalidData)
                
                return
                
            }
            
            do {
                let decoder = JSONDecoder()
                // convert snakeCase in (webservice) to camilCase in swift same using (codingKey)
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                complation(followers, nil)
                
            }catch{
                 complation(nil, .invalidData)
                
            }
            
        }
        
        task.resume()

    }
  
    func getUserInfo(for username:String , complation: @escaping(User?,ErrorMassage?)->Void){
        
        let endpoint = baseURl + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            
            complation(nil, .invalidUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                complation(nil, .unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                complation(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                complation(nil, .invalidData)
                
                return
                
            }
            
            do {
                let decoder = JSONDecoder()
                // convert snakeCase in (webservice) to camilCase in swift same using (codingKey)
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                complation(user, nil)
                
            }catch{
                complation(nil, .invalidData)
                
            }
            
        }
        
        task.resume()
        
    }
}




