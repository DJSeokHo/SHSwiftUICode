//
//  IHelloWorld.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2022/04/05.
//

import SwiftUI
import AVFoundation

struct IHelloWorld: View {
    var body: some View {
        
//        HelloWorld()
        ContentView()
    }
    
}

private struct ContentView: View {
    
    var body: some View {
        
        VStack {
            
            Button(action: {
             
                speak(text: "Happy Programming")
                
            }, label: {
              
                Text("Happy Programming")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
                
            })
            .padding()
            .foregroundColor(.white)
            .background(Color.yellow)
            .cornerRadius(20)
            
            Button(action: {
                
               speak(text: "Hello World")
                
            }, label: {
              
                Text("Hello World")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
                
            })
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(20)
            
        }
        
    }
    
    func speak(text: String) {
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
    }
}

private struct HelloWorld: View {
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
//            .font(.title)
            .font(.system(.title, design: .rounded))
    }
    
}

struct IHelloWorld_Previews: PreviewProvider {
    static var previews: some View {
        IHelloWorld()
    }
}
