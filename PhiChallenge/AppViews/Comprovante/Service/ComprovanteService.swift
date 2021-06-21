//
//  ComprovanteService.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 21/06/21.
//

import Foundation
import Alamofire

class ComprovanteService {
    let endpoint = "https://desafio-mobile-bff.herokuapp.com"
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
    
    func fetchDetalhes(id: String, handler: @escaping (Result<Detalhes, Error>) -> Void) {
        AF.request("\(endpoint)/myStatement/detail/\(id)", headers: ["token": self.token]).responseData { (response) in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    handler(self.parseDetalhes(data: data))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
    
    func parseDetalhes(data: Data) -> Result<Detalhes, Error> {
        let decoder = JSONDecoder()
        do {
            let detalhes = try decoder.decode(Detalhes.self, from: data)
            return .success(detalhes)
        } catch {
            return .failure(error)
        }
    }
}
