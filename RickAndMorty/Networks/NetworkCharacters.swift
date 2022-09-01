//
//  NetworkCharacters.swift
//  RickAndMorty
//
//  Created by Juan Camilo Marín Ochoa on 31/08/22.
//

import Foundation
import Alamofire

final class NetworkCharacters: ObservableObject {
    private var url: String? = "https://rickandmortyapi.com/api/character"
    
    static let shared = NetworkCharacters()
    
    func getCharacters(
        success: @escaping (_ characters: [Character]) -> (),
        failure: @escaping (_ error: Error?) -> ()
    ) {
        if (url != nil) {
            AF
                .request(url!, method: .get)
                .validate(statusCode: 200...299)
                .responseDecodable(of: CharactersResponse.self) {
                    response in
                    
                    if let characters = response.value?.results {
                        success(characters)
                        
                        // Mapea la URL de la siguiente petición
                        self.url = response.value?.info.next
                    } else {
                        print(response.error!)
                        
                        failure(response.error)
                    }
                }
        }
    }
}
