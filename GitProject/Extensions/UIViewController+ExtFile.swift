//
//  UIViewController+ExtFile.swift
//  GitProject
//
//  Created by Mac on 6/24/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit
import SafariServices

fileprivate var containerView : UIView!

extension UIViewController{
    
    func presentGFAlertOnMainThread(presenttitle: String, presentmessage : String,presentbuttonTitle: String){
        
        DispatchQueue.main.async {
            let alertVC = GFAlertVCViewController(title: presenttitle, message: presentmessage, buttonTitle: presentbuttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle   = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    
    func presentSafariVc(with url : URL){
        
        let safariVc = SFSafariViewController(url : url)
        safariVc.preferredControlTintColor = .black
        present(safariVc, animated: true, completion: nil)
    }
    
    
    func showLoadingView(){
        
        containerView         = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.alpha   = 0
        containerView.backgroundColor = .white
        
        UIView.animate(withDuration: 0.25) {containerView.alpha = 0.8}
         let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = .gray
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        activityIndicator.startAnimating()
        
    }
    
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            
            containerView.removeFromSuperview()
            containerView = nil
        }
       
    }
    
    func showEmptyStateView(message : String , in view : UIView){
        let emptySateView = GFEmptySateView(message: message)
        emptySateView.frame = view.bounds
        view.addSubview(emptySateView)
        
        
    }
    
}
