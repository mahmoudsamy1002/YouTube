//
//  CacheManager.swift
//  YouTube
//
//  Created by user on 21.09.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data: Data?) {
        
        // Store the image data and use url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        // try to get the data for the specified url
        return cache[url]
        
    }
    
}
