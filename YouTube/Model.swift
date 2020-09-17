//
//  Model.swift
//  YouTube
//
//  Created by user on 16.09.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation

class Model {
    
    
    func getVideos() {
        // Creat a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        // Get a URLSession object
        let session = URLSession.shared
        
        //Get a data tasl from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil { return }
            
            do {
                // Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601  ///  For get Date formate from JSON
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            catch {
                
            }
            
            
            
        }
        
        // Kick off the task (Fire the Data)
        dataTask.resume()
        
    }
}
