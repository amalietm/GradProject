//
//  bl.swift
//  Grad_project
//
//  Created by Amalie Morch on 24/04/2023.
//

import SwiftUI
struct Post: Identifiable, Hashable {
    let id: Int
    let title: String
    let isLiked: Bool
}

struct PostListView: View {
    let posts = [
            Post(id: 1, title: "Post 1", isLiked: false),
            Post(id: 2, title: "Post 2", isLiked: false),
            Post(id: 3, title: "Post 3", isLiked: false),
        ]
    @State private var likedPosts: Set<Post> = []
    var body: some View {
        
        NavigationView {
                    List(posts) { post in
                        Button(action: {
                            // Toggle the isLiked property of the post
                            if self.likedPosts.contains(post) {
                                self.likedPosts.remove(post)
                            } else {
                                self.likedPosts.insert(post)
                            }
                        }) {
                            HStack {
                                Text(post.title)
                                Spacer()
                                Image(systemName: self.likedPosts.contains(post) ? "heart.fill" : "heart")
                            }
                        }
                        .buttonStyle(BorderlessButtonStyle())

                        NavigationLink(
                            destination: PostDetailView(post: post),
                            tag: post,
                            selection: Binding(
                                get: { self.likedPosts.contains(post) ? post : nil },
                                set: { if let post = $0 { self.likedPosts.insert(post) } else { self.likedPosts.remove(post) } }
                            )
                        ) {
                            EmptyView()
                        }
                        .hidden()
                    }
                    .navigationBarTitle("Posts")
                }
          
    }
}

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        Text(post.title)
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
