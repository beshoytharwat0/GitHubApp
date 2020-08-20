//
//  UserInfoVC.swift
//  GitProject
//
//  Created by Mac on 6/30/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

protocol UserInFoVCDelegat : class {
    func didTapGitProfile(for user : User)
    func didTapFollowers(for user : User)
}

class UserInfoVC: UIViewController {

    let heardView   = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var viewArray:[UIView] = []
    
   var username : String!
   weak var delegate : FollowerListVCDelegat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // print("\(username)")
        layoutUI()
        configureViewController()
        getUserInfo()
       
    }
    
    func getUserInfo(){
        NetworkManager.shared.getUserInfo(for: username) {[weak self] ( user, erroMassage) in
            guard let self = self else {return}
            guard let user = user  else{
                self.presentGFAlertOnMainThread(presenttitle: "Something went wrong", presentmessage: erroMassage!.rawValue, presentbuttonTitle: "Ok")
                return
            }
            DispatchQueue.main.async {
                //print("\(user)")
                self.configureUIElement(with: user)
                
            }
        }
    }
    
    
    func configureUIElement( with user : User){
        
        let repoItemVC = GFRepoItemVC(user: user)
        repoItemVC.delegate = self
        let followerItemVc = GFFollowerVC(user : user)
        followerItemVc.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.heardView)
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVc, to: self.itemViewTwo)
        self.dateLabel.text = "GitHup Since\(user.createdAt.convertToDisplayFormat())"
        
    }
    
    func configureViewController(){
        
        view.backgroundColor = .white
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismisVC))
        // add donebutton to navigationbar
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func layoutUI(){
        
        let  padding : CGFloat = 20
        let itemheight : CGFloat = 140
        
        viewArray = [heardView, itemViewOne, itemViewTwo, dateLabel]
        for itemView in viewArray{
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant : -padding),
                ])
        }
        
//        itemViewOne.backgroundColor = .black
//        itemViewTwo.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([
            heardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heardView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: heardView.bottomAnchor , constant: 30),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemheight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor , constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemheight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
            ])
    }
    
    
    func add (childVC : UIViewController, to containerView : UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
        
    }
    
  @objc func  dismisVC(){
     dismiss(animated: true, completion: nil)
    
    }

    
}

extension  UserInfoVC: UserInFoVCDelegat {
    
    func didTapGitProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
             presentGFAlertOnMainThread(presenttitle: "Invalid Url", presentmessage: "the urk attached to this user is invalid", presentbuttonTitle: "Ok")
            return
        }
        
        presentSafariVc(with: url)
    }
    
    func didTapFollowers(for user: User) {
        guard user.followers != 0 else {
        presentGFAlertOnMainThread(presenttitle: "No followers", presentmessage: "this user has no followers 😌", presentbuttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismisVC()
        
    }
    
    

    
}
