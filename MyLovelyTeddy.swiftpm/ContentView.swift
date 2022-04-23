
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Hi Teddy", systemImage: "house.fill")
                }

            MemoriesView()
                .tabItem {
                    Label("Teddy's Storys", systemImage: "book")
                }
            
            TeddyStory()
                .tabItem {
                    Label("Memories", systemImage: "waveform")
                }
       
        }
    }
}

