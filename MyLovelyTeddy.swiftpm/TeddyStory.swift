//
//  File.swift
//  MyLovelyTeddy
//
//  Created by Jun.Mac on 2022/04/23.
//

import Foundation
import SwiftUI

struct TeddyStory: View{
    
    @State var showSheet: Bool = false
    
    var body: some View{
        
        Button {
            showSheet.toggle()
        } label: {
            
            Text("Teddy Story")
        }
        .halfSheet(showSheet: $showSheet) {
            
            // Your Half Sheet View....
            ZStack{
                
                Color.orange
                
                VStack{
                    
                    Text("Hi i'm Teddy")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Close From Sheet")
                            .foregroundColor(.white)
                    }
                    .padding(10)

                }
            }
            .ignoresSafeArea()
        } onEnd: {
            
            print("Dismissed")
        }
    }
}




