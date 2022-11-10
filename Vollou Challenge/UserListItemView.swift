//
//  UserListItemView.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import SwiftUI

struct UserListItemView: View {
    var body: some View {
        VStack {
            Image("Circle")
            Text("username")
        }
    }
}

struct UserListItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserListItemView()
    }
}
