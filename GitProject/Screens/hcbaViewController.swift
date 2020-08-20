//
//  ViewController.swift
//  GitProject
//
//  Created by Mac on 6/28/20.
//  Copyright © 2020 beshoy tharwat. All rights reserved.
//

import UIKit

class hcbaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet var searchbar: UISearchBar!
    
    @IBOutlet var tableview: UITableView!
    
    var member = [[String:AnyObject]]()
    
    var members = [String:AnyObject]()
    
    var searchActive = true
    var filtered:[String] = []
    var data: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        print("________-----------________----------")
        print(member)
        
        
        // Do any additional setup after loading the view.
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = data.filter({ (text) -> Bool in
            let tmp:NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if (filtered.count == 0){
            searchActive = false
        }
        else{
            searchActive = true
        }
        self.tableview.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "MemberDirectory"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return member.count
        
        if(searchActive){
            return filtered.count
        }
        else{
            return data.count
        }
        
        // return member.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        var display = member[indexPath.row]
        
        cell.textLabel?.text = display["Name"] as! String?
        cell.detailTextLabel?.text = display["email"] as? String
        
        
        let n = display["Name"] as! String
        data.append(n)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! hcbadetailViewController
        vc.kk = members
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        members = member[indexPath.row]
        self.performSegue(withIdentifier: "bye", sender: nil)
}
