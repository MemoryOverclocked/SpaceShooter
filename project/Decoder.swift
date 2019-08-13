//
//  Decoder.swift
//  project
//
//  Created by Cat Nian on 2019-08-13.
//  Copyright © 2019 JN. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(type: T.Type, file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("\(file) cannot be found")
        }
        
        guard let data = try? Data(contentsOf: url) else {
             fatalError("\(file) cannot be loaded")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("\(file) cannot be decoded")
        }
        
        return loaded
    }
}
