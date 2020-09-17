//
//  ViewController.swift
//  YouTube
//
//  Created by user on 16.09.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        model.getVideos()
        
    }


}

