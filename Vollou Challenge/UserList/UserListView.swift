//
//  UserListView.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel = UserListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.userList) { user in
                let userViewModel = UserViewModel(user: user)
                
                NavigationLink(destination: UserDetailView(viewModel: userViewModel), label: {
                    UserListItemView(viewModel: userViewModel)
                })
            }
            .padding()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
