//
//  UserDetailView.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import SwiftUI

struct UserDetailView: View {
    @State var viewModel: UserViewModel

    var body: some View {
        VStack {
            AsyncImage(url: viewModel.imageURL) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            Text(viewModel.name)
            Text(viewModel.email)
            Text(viewModel.address)
            Text(viewModel.phone)
            Text(viewModel.website)
            Text(viewModel.company)
        }
        .navigationBarTitle(Text(viewModel.name), displayMode: .inline)

        VStack {
            Text("post list")
            ForEach(viewModel.postInfo) { post in
                HStack {
                    Text(post.title)
                    Spacer()
                    Text("\(post.comments.count) comments")
                }
            }
        }
    }
}
