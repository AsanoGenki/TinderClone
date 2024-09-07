//
//  ListViewModel.swift
//  TinderClone
//
//  Created by Genki on 9/7/24.
//

import Foundation

class ListViewModel {
    var users = [User]()
    
    init() {
        self.users = getMockUsers()
    }
    
    private func getMockUsers() -> [User] {
        return [
            User.MOCK_USER1,
            User.MOCK_USER2,
            User.MOCK_USER3,
            User.MOCK_USER4,
            User.MOCK_USER5,
            User.MOCK_USER6,
            User.MOCK_USER7
        ]
    }
}
