//
//  FavoriteView.swift
//  Lab 4 Movie Search
//
//  Created by Zoe Wang on 10/20/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class FavoriteView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myFav:[String] = []
    let favlist = FavPlist()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setTableView()
        if myFav.count != 0 {
            tabFav.badgeValue = String(myFav.count)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return myFav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "favoriteItem")
        
        cell.textLabel?.text = myFav[indexPath.row]
        
        return cell
    }
    
    func setTableView(){
        let path = Bundle.main.path(forResource: "UserFavorites", ofType: "plist")
        let dict: AnyObject = NSDictionary(contentsOfFile: path!)!
        
        myFav = dict.object(forKey: "userFav") as! Array<String>
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "favoriteItem")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let path = Bundle.main.path(forResource: "UserFavorites", ofType: "plist")
        let dict: AnyObject = NSDictionary(contentsOfFile: path!)!
        
        myFav = dict.object(forKey: "userFav") as! Array<String>
        
        tableView.reloadData()
        if myFav.count != 0 {
            tabFav.badgeValue = String(myFav.count)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            myFav.remove(at: indexPath.row)
            favlist.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            if myFav.count != 0 {
                tabFav.badgeValue = String(myFav.count)
            }
        }
    }
    
    // Tab bar
    
    @IBOutlet weak var tabFav: UITabBarItem!
    

}
