//
//  ContentView.swift
//  Albanoboard
//
//  Created by Antonio Solida on 18/07/24.
//

import SwiftUI
import AVKit

import AVFoundation

class SoundManager: ObservableObject {
    var players: [AVAudioPlayer] = []
    var allowParallelPlayback: Bool = false

    func playSound(sound: String, type: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: type) else {
            print("File audio non trovato.")
            return
        }
        print("Audio trovato")
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            //player.volume = 1.0  // Imposta il volume al 100%
            player.prepareToPlay()
            
            if !allowParallelPlayback {
                            // Stoppa tutti i player esistenti
                            for existingPlayer in players {
                                existingPlayer.stop()
                            }
                            // Pulisci la lista dei player
                            players.removeAll()
                        }
            
            player.play()
            players.append(player) // Aggiungi il player alla lista dei players
            print("Riproduzione")
        } catch {
            print("Errore durante la riproduzione del file audio:", error.localizedDescription)
        }
    }
}


struct ContentView: View {
    @StateObject private var soundManager = SoundManager()
    @State private var selectedMode: Set<String> = []
    @State private var defaultMode: String = "false"
    
    private let sounds = [
            "false",
            "true"
        ]
    
    var body: some View {
        VStack {
            Picker("", selection: $soundManager.allowParallelPlayback) {
                            Text("Parallelo").tag(true)
                            Text("Singolo").tag(false)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
            HStack {
                Button(action: {
                    soundManager.playSound(sound: "I delfini", type: "mp3")
                }) {
                    Text("I delfini")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    soundManager.playSound(sound: "Gli elefanti", type: "mp3")
                }) {
                    Text("Gli elefanti")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.bottom, 10)
            
            HStack {
                Button(action: {
                    soundManager.playSound(sound: "Le nuvole", type: "mp3")
                }) {
                    Text("Le nuvole")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    soundManager.playSound(sound: "I treni", type: "mp3")
                }) {
                    Text("I treni")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.bottom, 10)
            
            HStack {
                Button(action: {
                    soundManager.playSound(sound: "E tu", type: "mp3")
                }) {
                    Text("E tu")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    soundManager.playSound(sound: "Dove vai a ballare", type: "mp3")
                }) {
                    Text("Dove vai a ballare?")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
