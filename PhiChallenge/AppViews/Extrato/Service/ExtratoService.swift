//
//  ExtratoServie.swift
//  PhiChallenge
//
//  Created by Guilherme de Assis dos Santos on 20/06/21.
//

import Foundation
import Alamofire

class ExtratoService {
    let endpoint = "https://desafio-mobile-bff.herokuapp.com"
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
    
    func fetchSaldo(handle: @escaping (_ saldo: Result<Saldo, Error>) -> Void) {
        AF.request("\(endpoint)/myBalance", headers: ["token": self.token]).responseData { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    handle(self.parseSaldo(data: data))
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    handle(.failure(error))
                }
            }
        }
    }
    
    func parseSaldo(data: Data) -> Result<Saldo,Error> {
        let decoder = JSONDecoder()
        do {
            let saldo: Saldo = try decoder.decode(Saldo.self, from: data)
            return .success(saldo)
        } catch {
            return .failure(error)
        }
    }
}
