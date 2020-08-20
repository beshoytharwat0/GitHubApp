//
//  SearchVC.swift
//  GitProject
//
//  Created by Mac on 6/23/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: #colorLiteral(red: 0.2023746371, green: 0.6422279477, blue: 0.3123435378, alpha: 1), title: "Get Followers")
     // it's condition not allowed search for follower if the testfield is empty and i make guard statment in func pushFollowerListVC()
    var isUserNameEntered: Bool{return !usernameTextField.text!.isEmpty}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurelogoImageView()
        configureTextField()
        configuracallToActionButton()
        creatDismissKeyboardTapGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func creatDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    
    
    @objc func pushFollowerListVC(){
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(presenttitle: "Empty Username", presentmessage: "Please enter a username. We need to know who to look for 🙃.", presentbuttonTitle: "Ok")
            return
        }
        
         let followerlist = FollowerListVC()
        followerlist.username = usernameTextField.text
        followerlist.title = usernameTextField.text
        navigationController?.pushViewController(followerlist, animated: true)

    }
    
    
    
    func configurelogoImageView() {
        
       view.addSubview(logoImageView)
       logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
            ])
    }
    
    func configureTextField(){
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    }

    
    func configuracallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        callToActionButton.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -50),
        callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            
            
            ])
    }

}

extension SearchVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        pushFollowerListVC()
        
        return true
    }
}
 
