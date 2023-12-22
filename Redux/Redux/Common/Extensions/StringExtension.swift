//
//  StringExtension.swift
//  Redux
//
//  Created by hhcszgd on 2023/12/22.
//

import Foundation

extension String {
    func urlEncode() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? self
    }
    
    func convertToIntValue() -> Int {
        Int(self) ?? 0
    }
}
