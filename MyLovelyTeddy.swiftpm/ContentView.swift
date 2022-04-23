import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                NavigationLink {
                    MemoriesWithTeddy()
                        .navigationTitle("Memories With Teddy")
                } label: {
                    Text(" Memories With Teddy")
                }
               
                NavigationLink {
                    TeddyStory()
                        .navigationTitle("Teddy Story")
                } label: {
                    Text("Teddy Story")
                }
                
            }
            .navigationTitle("My Teddy")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
