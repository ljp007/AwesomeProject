//
//  AwUserView.swift
//  AwesomeProject
//
//  Created by 林 on 2024/10/24.
//

import Foundation
import SwiftUI

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

// @ObservedObject：用于跨多个视图共享的对象状态。通常用于模型数据。
// @ObservedObject：用于在多个视图之间共享对象。当对象中标记为 @Published 的属性更改时，观察该对象的视图会刷新。


struct UserListView:View {
    
    @ObservedObject var viewModel = UserListViewModel()
    
    var body:some View{
        NavigationView{
            List(viewModel.users) { user in
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
