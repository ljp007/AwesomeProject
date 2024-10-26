//
//  UserListViewModel.swift
//  AwesomeProject
//
//  Created by 林 on 2024/10/26.
//

import Foundation

struct User:Identifiable {
    let id:UUID
    let name:String
    let age:Int
    let email:String
}


class UserListViewModel: ObservableObject {
    @Published var users =  [
        User(id: UUID(), name: "Alice", age: 30, email: "alice@example.com"),
        User(id: UUID(), name: "Bob", age: 25, email: "bob@example.com"),
        User(id: UUID(), name: "Charlie", age: 28, email: "charlie@example.com"),
        User(id: UUID(), name: "David", age: 35, email: "david@example.com")
    ]
}

