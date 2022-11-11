//
//  UserViewModel.swift
//  Vollou Challenge
//
//  Created by Alex Freitas on 10/11/2022.
//

import Foundation

class UserViewModel {
    let user: User
    private var allComments: [Comment] = []
    private var allPosts: [Post] = []

    init(user: User) {
        self.user = user
        fetchData()
    }

    var name: String {
        return self.user.name
    }

    var email: String {
        return self.user.email
    }

    var address: String {
        let street = self.user.address.street
        let suite = self.user.address.suite
        let city = self.user.address.city
        let zipcode = self.user.address.zipcode
        let geolocation = "Latitude \(self.user.address.geo.lat) \nLongitude  \(self.user.address.geo.lng)"

        let address = "\(street), \(suite) \n\(city). \n\(zipcode). \n\(geolocation)"

        return address
    }

    var phone: String {
        return self.user.phone
    }

    var website: String {
        return self.user.website
    }

    var company: String {
        let companyName = self.user.company.name
        let catchPhrase = self.user.company.catchPhrase
        let balanceSheet = self.user.company.bs

        let company = "\(companyName) \n\"\(catchPhrase)\" \nBS: \(balanceSheet)"

        return company
    }

    var imageURL: URL? {
        let baseURL = "https://avatars.dicebear.com/api/croodles/"
        let imageName = self.user.name.replacingOccurrences(of: " ", with: "")
        let imageExtension = ".png"

        return URL(string: baseURL + imageName + imageExtension)
    }

    private func fetchData() {
        WebService().getPosts { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let posts):
                self.allPosts = posts
            }
        }

        WebService().getComments { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let comments):
                self.allComments = comments
            }
        }
    }

    var postInfo: [PostInfo] {
        var postInfo: [PostInfo] = []

        let userPosts = allPosts.filter({ $0.userId == self.user.id }).map({ return (id: $0.id, title: $0.title) })

        for post in userPosts {
            let comments = allComments.filter({ $0.postId == post.id }).map({ return $0.body })

            postInfo.append(PostInfo(title: post.title, comments: comments))
        }

        return postInfo
    }
}
