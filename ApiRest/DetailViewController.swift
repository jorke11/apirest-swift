//
//  DetailViewController.swift
//  ApiRest
//
//  Created by Jorge Pinedo on 6/5/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var labelDetailText=""
    @IBOutlet weak var labelDetail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDetail.text=labelDetailText
        // Do any additional setup after loading the view.
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
