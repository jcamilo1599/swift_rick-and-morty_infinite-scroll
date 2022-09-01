//
//  CircleImageView.swift
//  RickAndMorty
//
//  Created by Juan Camilo Marín Ochoa on 31/08/22.
//

import SwiftUI

struct CircleImageView: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable().aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        .clipShape(Circle())
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    }
}
