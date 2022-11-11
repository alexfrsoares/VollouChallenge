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
            List {
                Section(header: UserImageView(imageURL: viewModel.imageURL).frame(width: 200, height: 200)) {
                    Text("Name: \(viewModel.name)")
                    Text("E-mail: \(viewModel.email)")
                    Text("Address: \n\(viewModel.address)")
                    Text("Phone: \(viewModel.phone)")
                    Text("Site: \(viewModel.website)")
                    Text("Company: \n\(viewModel.company)")
                }

                Section(header: Text("User's Posts")) {
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
        .navigationBarTitle(Text(viewModel.name), displayMode: .inline)
    }
}
