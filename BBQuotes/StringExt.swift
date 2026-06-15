//
//  StringExt.swift
//  BBQuotes
//
//  Created by Milad Roozban on 6/13/26.
//
import Foundation

extension String {
    
    func removeSpace() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.lowercased().removeSpace()
    }
}
