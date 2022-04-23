
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Hi Teddy", systemImage: "house.fill")
                }

            TeddyStory()
                .tabItem {
                    Label("Teddy's Storys", systemImage: "book")
                }
            
            MemoriesView()
                .tabItem {
                    Label("Memories", systemImage: "waveform")
                }
       
        }
    }
}

