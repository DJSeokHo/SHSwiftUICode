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

private struct HeartView: View {
    
    @State
    private var colorChange = false
    
    @State
    private var sizeChange = false
    
    var body: some View {
        
        Image(systemName: "heart.fill")
            .font(.system(size: 200))
            .foregroundColor(colorChange ? .yellow : .red)
            .scaleEffect(sizeChange ? 1.5 : 1)
            .onTapGesture {
                self.colorChange.toggle()
            }
            .onLongPressGesture {
                withAnimation {
                    self.sizeChange.toggle()
                }
            }
        
    }
    
}

private struct ContentView: View {
    
    var body: some View {
        
        VStack {
            
            HeartView()
            
            topView
            bottomView
            
        }
        
    }
    
    private var topView: some View {
        
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
        
    }
    
    private var bottomView: some View {
            
        Button(action: {
            
           speak(text: "Hello World")
            
        }, label: {
          
            Text("Hello World")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(.title, design: .rounded))
            
        })
        .padding()
        .background(Color.purple)
        .cornerRadius(20)
        
    }
    
    private func speak(text: String) {
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
    }
}

struct IHelloWorld_Previews: PreviewProvider {
    static var previews: some View {
        IHelloWorld()
            .previewDevice("iPhone 13 Pro Max")
    }
}
