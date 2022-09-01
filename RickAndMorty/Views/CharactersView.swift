//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Juan Camilo Marín Ochoa on 31/08/22.
//

import SwiftUI

struct CharactersView: View {
    @State private var isLoading: Bool = false
    @State private var characters: [Character] = []
    
    var body: some View {
        // Si no esta cargando y tampoco tiene personajes
        if characters.isEmpty {
            if isLoading {
                VStack {
                    Text("Obteniendo personajes")
                    Spacer().frame(height: 30)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                }
            } else {
                Button(action: getCharacters) {
                    Text("PERSONAJES")
                }
            }
        } else {
            VStack {
                NavigationView {
                    List {
                        ForEach(characters.indices, id: \.self) { characterIndex in
                            let character: Character = characters[characterIndex]
                            
                            NavigationLink {
                                CharacterDetailView(character: character)
                            } label: {
                                Text("\(character.id) - \(character.name)")
                            } .onAppear {
                                if characterIndex == characters.count - 1 {
                                    getCharacters()
                                }
                            }
                        }
                    }
                    .navigationTitle("Rick and Morty")
                }
            }
        }
    }
    
    private func getCharacters() {
        isLoading = true
        
        NetworkCharacters.shared.getCharacters { response in
            isLoading = false
            characters.append(contentsOf: response)
        } failure: { error in
            isLoading = false
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
