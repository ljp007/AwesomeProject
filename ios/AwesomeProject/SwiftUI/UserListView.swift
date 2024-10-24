//
//  AwUserView.swift
//  AwesomeProject
//
//  Created by 林 on 2024/10/24.
//

import Foundation
import SwiftUI

struct User:Identifiable {
    let id:UUID
    let name:String
    let age:Int
    let email:String
}

let users = [
    User(id: UUID(), name: "Alice", age: 30, email: "alice@example.com"),
    User(id: UUID(), name: "Bob", age: 25, email: "bob@example.com"),
    User(id: UUID(), name: "Charlie", age: 28, email: "charlie@example.com"),
    User(id: UUID(), name: "David", age: 35, email: "david@example.com")
]

// 用户详情视图
struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text(user.name)
                .font(.largeTitle)
                .padding()
            
            Text("年龄: \(user.age)")
                .font(.title)
                .padding()
            
            Text("邮箱: \(user.email)")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()

            Spacer()
        }
        .navigationTitle("用户详情")
    }
}

struct UserListView:View {
    var body:some View{
        NavigationView{
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    UserRowView(user: user)
                }
            }
        }.navigationTitle("User List")
    }
}


struct UserRowView:View {
    let user:User
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(user.name).font(.headline)
                Text("age:\(user.age)").font(.subheadline)
                Text("email\(user.email)").font(.subheadline).foregroundColor(.gray)
            }.padding()
        }
    }
}
