//
//  GFItemInfoVC.swift
//  GitProject
//
//  Created by Mac on 7/1/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class GFItemInfoVC: UIViewController {
    
    let stackView     = UIStackView()
    let itemInfoViewOne   = GFItemInfoView()
    let itemInfoViewTwo   = GFItemInfoView()
    let ActionButton  = GFButton()

    var user : User!
    weak var delegate : UserInFoVCDelegat!
    
    init(user : User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configureBackGroundView()
        layoutUI()
        configureStackView()
        configureActionbutton()
        
    }
    
    private func configureStackView(){
        
        stackView.axis          = .horizontal
        stackView.distribution  = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    
   private  func configureBackGroundView(){
        view.layer.cornerRadius = 18
        view.backgroundColor    = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
    }
    
    private func configureActionbutton(){
        
        ActionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
    }
    
   @objc func actionButtonTapped(){
        
    }
    

    private func layoutUI(){
        view.addSubview(stackView)
        view.addSubview(ActionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            ActionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            ActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            ActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ActionButton.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    
}
