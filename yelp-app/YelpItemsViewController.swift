//
//  YelpItemsViewController.swift
//  yelp-app
//
//  Created by Harry Zhang on 4/18/19.
//  Copyright © 2019 Harry Zhang. All rights reserved.
//

import UIKit
import Foundation
import AlamofireImage

class YelpItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var businesses = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        let headers = [
            "Authorization": "Bearer Ga-yQD1tX5Wk69YYvfUogNtmKJWzcai2x-eSHSfzxZXhxtYsu7tYL_fC3z5yHoUNPqCSIya_6TqM28cedOt6vtelmAJr6bT8kPj0idxukl0R4hPjhoaaNI4ZmcjcXHYx",
            "cache-control": "no-cache",
            "Postman-Token": "70bab5f5-fdbb-4a35-8c5f-2945f0781279"
        ]
        /*calling specific business endpoint*/
        var request = URLRequest(url: URL(string: "https://api.yelp.com/v3/businesses/search?categories=active%2Cfood&limit=5&locale=en_US&location=San%20Francisco&offset=0&open_now=1&price=1%2C2&radius=10000&sort_by=rating&term=Food")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers /*authorization header needed for the api request*/
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.businesses = dataDictionary["businesses"] as! [[String: Any]]
                
                self.tableView.reloadData()
                //Ignore Complaint about reloadData, it's fine, don't worry about it
                print(dataDictionary)
            }
        })
        
        dataTask.resume()
        
    }
    /*
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchtext \(searchBar.text)")
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YelpItemCell") as! YelpItemCell
        
        let business = businesses[indexPath.row]
        let title = business["name"] as! String
        
        cell.businessLabel!.text = title
        
        /*grab the image url and display it for the cell*/
        let imagePath = business["image_url"] as! String
        let businessUrl = URL(string: imagePath)
        
        cell.businessImage.af_setImage(withURL: businessUrl!)
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let IndexPath = tableView.indexPath(for: cell)!
    
        let business = businesses[IndexPath.row]
    
        let detailsViewController=segue.destination as! YelpDetailsViewController
        detailsViewController.business = business
    
        tableView.deselectRow(at: IndexPath, animated: true)
    
    }


}
