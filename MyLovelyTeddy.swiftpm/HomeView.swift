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
                            .padding()
                            .font(.title)
                            .frame(minHeight: 100)
                       
                    }
                   
                    
                }
               
            }
            }
            
        }
    }

 
