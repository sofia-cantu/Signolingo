//
//  ModelDataWord.swift
//  Primera
//
//  Created by Carolina Nicole González Leal on 23/08/23.
//

import Foundation

final class ModelDataWord: ObservableObject {
    @Published var words: [WordModel] = []

    init() {
        // Llama a setup para configurar la carga de datos
        setup()
    }

    private func setup() {
        // Llama a loadWords después de inicializar todas las propiedades
        if let remoteJSONURL = URL(string: "https://vc5kqp87-3000.usw3.devtunnels.ms/api/v1/words/getall") {
            loadWords(from: remoteJSONURL)
        }
    }

     func loadWords(from url: URL?) {
        guard let url = url else {
            print("URL de datos remotos no válida.")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error al cargar datos remotos: \(error)")
                return
            }

            guard let data = data else {
                print("Datos remotos vacíos.")
                return
            }

            do {
                let decoder = JSONDecoder()
                let wordData = try decoder.decode(WordData.self, from: data)
                DispatchQueue.main.async {
                    self.words = wordData.words
                }
            } catch {
                print("Error al decodificar datos remotos: \(error)")
            }
        }.resume()
    }
    
    // Función para realizar el seguimiento de una palabra
    func trackWord(word: String) {
        // La URL a la que deseas enviar la solicitud POST
        let urlString = "https://vc5kqp87-3000.usw3.devtunnels.ms/api/v1/tracker/add/\(word)"
        
        guard let url = URL(string: urlString) else {
            print("URL inválida: \(urlString)")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error al realizar la solicitud POST: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if (200...299).contains(httpResponse.statusCode) {
                  //  print("Solicitud POST exitosa")
                } else {
                    print("Error en la solicitud POST, código de estado: \(httpResponse.statusCode)")
                }
            }
        }
        
        task.resume()
    }

}
