//
//  ViewController.swift
//  YouTube
//
//  Created by user on 16.09.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
   
    
    
    @IBOutlet weak var tabelView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set itself as the datasource and the delegate
        tabelView.dataSource = self
        tabelView.delegate = self
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        
        model.getVideos()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirm that a video was selected
        guard tabelView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a refrence to the video that was tapped on
        let selectedVideo = videos[tabelView.indexPathForSelectedRow!.row]
        
        // Get a referance to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Set the video property of the detail view controller
        detailVC.video = selectedVideo
        
    }
    
    
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to our video property
        self.videos = videos
        
        // Refresh the tabelview
        tabelView.reloadData()
        
    }
    
    
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
       }
       
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // Return the cell
        return cell
       }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

