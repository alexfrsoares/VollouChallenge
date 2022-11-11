//
//  UserListItemView.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import SwiftUI

struct UserListItemView: View {
    @State var viewModel: UserViewModel

    var body: some View {
        HStack {
            UserImageView(imageURL: viewModel.imageURL)
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            Text(viewModel.name)
        }
        .frame(height: 50)
    }
}
