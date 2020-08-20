//
//  FollowerListVC.swift
//  GitProject
//
//  Created by Mac on 6/23/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

protocol FollowerListVCDelegat : class {
    
    func didRequestFollowers(for username: String)
}

class FollowerListVC: UIViewController {
   
    var username: String!
    var followerArray : [Follower] = []
    var filterFollowers : [Follower] = []
    var page = 1
    var hasMoreFollowers = true
    var collectionView: UICollectionView!
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureSearchViewController()
        configureCollectionView()
        getFollowers(username: username, page: page )
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
       // filterFollowers = followerArray
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func configureViewController(){
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureSearchViewController(){
        let searchController   = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.delegate                     = self
        searchController.searchBar.placeholder                  = "Search for a username"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.searchController                         = searchController
        navigationItem.hidesSearchBarWhenScrolling              = false
        //searchController.definesPresentationContext             = true
        


        
       
        
        
        
    }
    
    
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.creatThreeColumFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identfierID)
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addfollowers))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    
    @objc func addfollowers(){
         print("add follwers tapped")
    }
    
   
    
    func getFollowers(username: String, page: Int){
        
      showLoadingView()
          NetworkManager.shared.getFollowers(for: username, page: page) {[weak self ](followers, errorMessage) in
            
            guard let self = self else {return}
            self.dismissLoadingView()
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(presenttitle: "Bad Stuff Happend", presentmessage: errorMessage!.rawValue, presentbuttonTitle: "Ok")
                
                return
            }
            print("followers.count = \(followers.count)")
          print("\(followers)")
            if followers.count < 100 {self.hasMoreFollowers = false}
             self.followerArray.append(contentsOf: followers)
            if followers.isEmpty{
                let message = "this user doesn't have any followers,Go follow them 😅."
                DispatchQueue.main.async {
                    self.showEmptyStateView(message: message, in: self.view)
                }
            }
            
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()

            }
        }
    
    }
    
}


extension FollowerListVC : UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followerArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let followers = followerArray[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identfierID, for: indexPath) as! FollowerCell
        
        cell.set(follower: followers)
        
        return cell
    }
    
    
    
}

extension FollowerListVC : UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offsety        = scrollView.contentOffset.y
        let contantHeight  = scrollView.contentSize.height
        let height         = scrollView.frame.height
        
        if offsety > contantHeight - height{
            guard hasMoreFollowers else {return}
            page += 1
            getFollowers(username: username, page: page)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let follower = followerArray[indexPath.item]
         let destVC = UserInfoVC()
        destVC.username = follower.login
        destVC.delegate = self
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true, completion: nil)
    }
    
}
    
extension FollowerListVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        
//        guard let filter = searchController.searchBar.text, !filter.isEmpty else {return}
//
//        filterFollowers = followerArray.filter { $0.login.lowercased().contains(filter.lowercased()) }
        
//        DispatchQueue.main.async {
//            self.collectionView.reloadData()
//        }
        
   }
    
}

extension FollowerListVC : UISearchBarDelegate {
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard !searchText.isEmpty else{
//            filterFollowers = followerArray
//            collectionView.reloadData()
//            return }
//        filterFollowers =  followerArray.filter({ (Follower) -> Bool in
//            return Follower.login.contains(searchText)
//        })
//
//          collectionView.reloadData()
//    }
    
}


extension FollowerListVC : FollowerListVCDelegat{
    func didRequestFollowers(for username: String) {
        
        self.username = username
        title         = username
        page          = 1
        followerArray.removeAll()
        collectionView.setContentOffset(.zero, animated: true)
        getFollowers(username: username, page: page)
        print("\(followerArray)")
        DispatchQueue.main.async {
            self.collectionView.reloadData()

        }
    
       }
}



        






