//
//  UserImageView.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 11/11/2022.
//

import SwiftUI

struct UserImageView: View {
    @State var imageURL: URL?

    var body: some View {
        HStack {
            AsyncImage(url: imageURL) { image in
                image.resizable()
            } placeholder: {
                Image("no-image")
                    .resizable()
                    .padding(6)
                    .scaledToFit()
            }
            .scaledToFit()
        }
    }
}

//struct UserImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserImageView(imageURL: <#URL#>)
//    }
//}
