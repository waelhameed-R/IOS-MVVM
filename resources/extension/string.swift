//
//  string.swift
//  app
//
//  Created by wael hameed on 2/10/22.
//

import Foundation

extension String {
    func fixArabicURL() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics.union(CharacterSet.urlPathAllowed).union(CharacterSet.urlHostAllowed)) ?? ""
    }
}

extension String {
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
