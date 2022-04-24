//
//  File.swift
//  MyLovelyTeddy
//
//  Created by Jun.Mac on 2022/04/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var randomComments = ""
    
    var body: some View {
       
        ZStack{
            
            BackgroundView()
            
            VStack {
                    
                Image("Teddy")
    
            VStack(){
                    
                ZStack{
                        
                    Button(action: {randomComments = information.randomComments.randomElement()!}) {
                            
                    Image("Click")
                                      
                        }
                    
                    }
                ZStack{
                        
                    Image("RandomComments")
                        
                    Text(randomComments)
                        .foregroundColor(Color(red: 0.514, green: 0.514, blue: 0.514))
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.title)
                        .frame(width: 600, height: 200)
                    
                       
                    }
                   
                }
               
             }
            
        }
        
    }
    
}

 
