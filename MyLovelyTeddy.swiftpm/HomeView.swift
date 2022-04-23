//
//  File.swift
//  MyLovelyTeddy
//
//  Created by Jun.Mac on 2022/04/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
       
        ZStack{
            
            BackgroundView()
            
            VStack(spacing: 10){
              
                
                Image("Teddy")
        
           
            VStack(spacing: 50){
                ZStack{
                    Image("RectangleHeart")
                    
                    Text("Text")
                                   .font(.title2)
                                   .fontWeight(.bold)
                                   .foregroundColor(Color(red: 0.423, green: 0.448, blue: 0.439))
                                   .multilineTextAlignment(.center)
               
                   
                }
             
                
                }
            }
        }
    }
}

