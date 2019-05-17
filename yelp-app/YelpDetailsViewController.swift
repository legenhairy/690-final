//
//  YelpDetailsViewController.swift
//  yelp-app
//
//  Created by Harry Zhang on 4/18/19.
//  Copyright © 2019 Harry Zhang. All rights reserved.
//

import UIKit
import CDYelpFusionKit

class YelpDetailsViewController: UIViewController {

    @IBOutlet weak var ImageOutlet: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    var business: [String : Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let yelpAPIClient = CDYelpAPIClient(apiKey: "Ga-yQD1tX5Wk69YYvfUogNtmKJWzcai2x-eSHSfzxZXhxtYsu7tYL_fC3z5yHoUNPqCSIya_6TqM28cedOt6vtelmAJr6bT8kPj0idxukl0R4hPjhoaaNI4ZmcjcXHYx")
        // Do any additional setup after loading the view.
        
        NameLabel.text=business["name"]as!String
        PhoneLabel.text=business["phone"]as?String
        let imagePath = business["image_url"] as! String
        let businessUrl = URL(string: imagePath)
        ImageOutlet.af_setImage(withURL: businessUrl!)
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
