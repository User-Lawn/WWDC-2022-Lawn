//
//  File.swift
//  MyLovelyTeddy
//
//  Created by Jun.Mac on 2022/04/24.
//

import SwiftUI

struct StoryView: View {
    
    @State var currentIndex: Int = 0
    
    @State var posts: [Post] = []
    
    @State var currentTab = "Slide Show"
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing: 15){
            
           
            SnapCarousel(index: $currentIndex, items: posts) {post in
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical,40)
            
           
            HStack(spacing: 10){
                
                ForEach(posts.indices,id: \.self){index in
                    
                    Circle()
                        .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: currentIndex == index)
                }
            }
            .padding(.bottom,40)
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .onAppear {
            for index in 1...5{
                posts.append(Post(postImage: "post\(index)"))
            }
        }
    }
}

