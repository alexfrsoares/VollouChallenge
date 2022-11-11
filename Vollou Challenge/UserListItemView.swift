//
//  UserListItemView.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import SwiftUI

struct UserListItemView: View {
    @State var imageName: String
    @State var username: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            Text(username)
        }
    }
}

struct UserListItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserListItemView(imageName: "Bret", username: "Bret")
    }
}
