//
//  File.swift
//  MyLovelyTeddy
//
//  Created by Jun.Mac on 2022/04/23.
//

import Foundation
import SwiftUI
import AVKit

struct MemoriesView : View {
    
    @State var record = false
    @State var session : AVAudioSession!
    @State var recorder : AVAudioRecorder!
    @State var alert = false
    @State var audios : [URL] = []
   
    
    var body: some View{
       
            VStack{
                
                List(self.audios,id: \.self){i in
                    
                    
                    Text(i.relativeString)
                }
                
                
                Button(action: {

                    
                    do{
                        
                        if self.record{
                        
                            
                            self.recorder.stop()
                            self.record.toggle()
                            self.getAudios()
                            return
                        }
                        
                        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                        
                        let filName = url.appendingPathComponent("Memorie\(self.audios.count + 1).m4a")
                        
                        let settings = [
                        
                            AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
                            AVSampleRateKey : 12000,
                            AVNumberOfChannelsKey : 1,
                            AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue
                        
                        ]
                        
                        self.recorder = try AVAudioRecorder(url: filName, settings: settings)
                        self.recorder.record()
                        self.record.toggle()
                    }
                    catch{
                        
                        print(error.localizedDescription)
                    }
                    
                    
                }) {
                    
                    ZStack{
                        
                        Image("TeddyMike2")
                           
                        
                        if self.record{
                            
                        Image("TeddyMike")
                            
                        }
                    }
                }
                .padding(.vertical, 25)
            }
    
            .alert(isPresented: self.$alert, content: {
            
            Alert(title: Text("Error"), message: Text("Enable Acess"))
        })
        .onAppear {
            
            do{
                
                self.session = AVAudioSession.sharedInstance()
                try self.session.setCategory(.playAndRecord)
            
                self.session.requestRecordPermission { (status) in
                    
                    if !status{
                        
                        self.alert.toggle()
                    }
                    else{
                        
                        self.getAudios()
                    }
                }
                
                
            }
            catch{
                
                print(error.localizedDescription)
            }
        }
    }
    
    func getAudios(){
        
        do{
            
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let result = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
            
            
            self.audios.removeAll()
            
            for i in result{
                
                self.audios.append(i)
            }
        }
        catch{
            
            print(error.localizedDescription)
        }
    }
}
