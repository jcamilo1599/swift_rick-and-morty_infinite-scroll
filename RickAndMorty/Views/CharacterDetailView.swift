//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Juan Camilo Marín Ochoa on 31/08/22.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character;
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack {Color(UIColor.systemGray6)}.edgesIgnoringSafeArea(.vertical)
            Divider()
            CircleImageView(url: character.image).offset(y: -100.5).padding(.bottom, -80)
            Text(character.name).font(.title)
            Spacer()
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharacterDetailView(character: Character(
                id: 1,
                name: "Rick Sanchez",
                status: RickAndMorty.Status.alive,
                species: "Human",
                type: "",
                gender: RickAndMorty.Gender.male,
                origin: RickAndMorty.Location(
                    name: "Earth (C-137)",
                    url: "https://rickandmortyapi.com/api/location/1"
                ),
                location: RickAndMorty.Location(
                    name: "Citadel of Ricks",
                    url: "https://rickandmortyapi.com/api/location/3"
                ),
                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                episode: [],
                url: "https://rickandmortyapi.com/api/character/1",
                created: "2017-11-04T18:48:46.250Z"
            ))
        }
    }
}
