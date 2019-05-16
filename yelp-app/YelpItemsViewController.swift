//
//  YelpItemsViewController.swift
//  yelp-app
//
//  Created by Harry Zhang on 4/18/19.
//  Copyright © 2019 Harry Zhang. All rights reserved.
//

import UIKit
import CDYelpFusionKit

class YelpItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchBar.delegate = self
        
        let yelpAPIClient = CDYelpAPIClient(apiKey: "Ga-yQD1tX5Wk69YYvfUogNtmKJWzcai2x-eSHSfzxZXhxtYsu7tYL_fC3z5yHoUNPqCSIya_6TqM28cedOt6vtelmAJr6bT8kPj0idxukl0R4hPjhoaaNI4ZmcjcXHYx")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchtext \(searchBar.text)")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YelpItemCell") as! YelpItemCell
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
