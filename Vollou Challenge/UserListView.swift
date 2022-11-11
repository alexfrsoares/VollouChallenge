//
//  UserListView.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

/*
 The first screen should display a list of users, an icon image, and their usernames.
 Clicking on a user should bring you to a second screen
 */

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel = UserListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.userList) { user in
                NavigationLink(destination: UserDetailView(), label: {
                    UserListItemView(imageName: user.name, username: user.name)
                })
            }
            .padding()
            .navigationBarTitle(Text("Users"), displayMode: .automatic)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
