//
//  FavortListVC.swift
//  GitProject
//
//  Created by Mac on 6/23/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class FavoritListVC: UIViewController {

let tableView                 = UITableView()
     let CellView             = UIView()
    
    var favoriteslist = [
        Favorites.init(avatarImage: "1", usernameFav: "Youssif"),
        Favorites.init(avatarImage: "2", usernameFav: "Ayman Matt"),
        Favorites.init(avatarImage: "3", usernameFav: "Besho"),
        Favorites.init(avatarImage: "4", usernameFav: "Micheal"),
        Favorites.init(avatarImage: "5", usernameFav: "HmDi"),
        Favorites.init(avatarImage: "6", usernameFav: "Madz"),]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    
    func configureViewController(){
        view.backgroundColor = .white
        title                = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
       
    }
    
    func configureTableView(){
      tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.frame    = view.bounds
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identfierID)
    }
    

    
    
    
   
    func getfavorites(){
       
    }
    
}


extension FavoritListVC: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
     return   favoriteslist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favorite = favoriteslist[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identfierID) as! FavoriteCell
        
        cell.avatarImageView.image = UIImage(named: favorite.avatarImage ?? "1")
        cell.usernameLabel1.text = favorite.usernameFav ?? "hello"
        
        return cell
    }
    
    
    
    
    
}

