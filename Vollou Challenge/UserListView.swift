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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
