//
//  GFAlertVCViewController.swift
//  GitProject
//
//  Created by Mac on 6/24/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFAlertVCViewController: UIViewController {
    
    let containerView = UIView()
    let titlelabel   = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messagelabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .red, title: "Ok")
    let padding: CGFloat = 20
    
    var alertTitlee : String?
    var messagebody : String?
    var bottenTitle : String?
    
    init(title : String, message : String,buttonTitle : String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitlee = title
        self.messagebody = message
        self.bottenTitle = buttonTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitlelabel()
        configureActionButton()
        configureMessagelabel()

    }
    
    
    func  configureContainerView(){
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        containerView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.widthAnchor.constraint(equalToConstant: 280)
            
            ])
    }
    
    
    func configureTitlelabel(){
        
        containerView.addSubview(titlelabel)
        titlelabel.text = alertTitlee ?? "Something went Wrong"
        
        
        NSLayoutConstraint.activate([
            titlelabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titlelabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titlelabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titlelabel.heightAnchor.constraint(equalToConstant: 28)
            ])
        
    }
    
    
    func configureActionButton(){
        
        containerView.addSubview(actionButton)
        actionButton.setTitle(bottenTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(disMissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    
    
    @objc func disMissVC(){
        
        dismiss(animated: true, completion: nil)
    }

    
    func configureMessagelabel(){
        
        containerView.addSubview(messagelabel)
        messagelabel.text = messagebody ?? "Unable to complete request"
        messagelabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messagelabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 8),
            messagelabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messagelabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messagelabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
            ])



    }
}


