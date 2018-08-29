//
//  String+Base64.swift
//  StarWarsIMDB
//
//  Created by Daniel Leivers on 28/08/2018.
//  Copyright © 2018 Otaku. All rights reserved.
//

import Foundation

extension String {
    
    func base64Encoded() -> String {
        let plainData = data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
    }
    
    func base64Decoded() -> String {
        
        let decodedData = NSData(base64Encoded: self, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue)
        return decodedString! as String
    }
    
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    public func splitByColon() -> [String] {
        return self.components(separatedBy: ":")
    }
    
    public func graphQLIdentifier() -> String? {
        return self.base64Decoded()?.splitByColon().last ?? nil
    }
}
