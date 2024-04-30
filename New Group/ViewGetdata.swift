//
//  ViewGetdata.swift
//  TravelAgency3
//
//  Created by Veronica Martinez on 2024-04-29.
//

import Foundation


protocol GetDataDelegate: AnyObject {
    func dataFetched(dataToShow: DataToShow)
    func fetchErrorOccurred(error: Error)
}






struct DataToShow {
    var bookeableSeat: Int
    var totalPrice: String
    var currency: String
    var itineraty: Itinerary // No proporcionamos un valor predeterminado
    var segment: [Segment] // No proporcionamos un valor predeterminado
    
    // Inicializamos las propiedades con valores vacíos o iniciales
    init() {
        self.bookeableSeat = 0
        self.totalPrice = ""
        self.currency = ""
        self.itineraty = Itinerary(duration: "", segments: [])
        self.segment = []
    }
}

    
    
    struct FlightOfferResponse: Decodable {
        let data: [FlightOffer]
        
        
    }
    
    struct FlightOffer: Decodable {
        let type: String
        let id: String
        let numberOfBookableSeats: Int
        let itineraries: [Itinerary]
        let price: PriceDescription
    }
    
    struct Itinerary: Decodable {
        var duration: String
        let segments: [Segment]
    }
    
    struct Segment: Decodable {
        let departure: Departure
        var arrival: Arrival
        let carrierCode: String
        let number: String
        let aircraft: Aircraft
        //   let operating: Operating
        let duration: String
        let id: String
        let numberOfStops: Int
        let blacklistedInEU: Bool
    }
    
    struct Departure: Decodable {
        let iataCode: String
        let terminal: String?
        let at: String
    }
    
    struct Arrival: Decodable {
        let iataCode: String
        let terminal: String?
        var at: String
    }
    
    struct Aircraft: Decodable {
        let code: String
    }
    
    struct Operating: Decodable {
        let carrierCode: String
    }
    
    struct PriceDescription: Decodable {
        let currency: String
        let total: String
        let base: String
        let fees: [Fee]
    }
    
    struct Fee: Decodable {
        let amount: String
        let type: String
    }
    
    final class getDataFromApi{
        
        
        weak var delegate: GetDataDelegate?
        
        
        var accessToken: String?
        //instance to collect the data from the api
        var data = DataToShow()
           
            
        
        
        //return the instance of data
        func getDatatoShow()->DataToShow{
            
            
            return data
        }
        
        func runApi() async -> String {
            do {
                // Espera a que se complete la tarea para obtener el token
                accessToken = try await getToken()
                
            } catch {
                print("Error al obtener el token:", error)
            }
            
            return accessToken ?? ""
        }
        
        
        enum FlightError: Error {
            case invalidURL
            case invalidResponse
            case invalidData
        }
        
        
        var error="invalid url"
        
        func getData(_ token: String ,_ endpoint: String, completion: @escaping (Result<FlightOfferResponse, Error>) -> Void) async {
            // URL de la API
            guard let url = URL(string: endpoint) else {
                completion(.failure(FlightError.invalidURL))
                return
            }
            
            // Crear la solicitud URLRequest
            var request = URLRequest(url: url)
            
            // Configurar el método HTTP
            request.httpMethod = "GET"
            
            // Token de acceso
            //let token = token
            
            
            
            
            // Configurar el encabezado de autorización
            let authValue = "Bearer \(token)"
            request.addValue(authValue, forHTTPHeaderField: "Authorization")
            
            // Realizar la solicitud
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                
                
                
                
                
                
                
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    completion(.failure(FlightError.invalidResponse))
                    
                    print(response)
                    return
                }
                
                guard let data = data else {
                    completion(.failure(FlightError.invalidData))
                    return
                }
                
                // Decodificar los datos JSON en una instancia de FlightOfferResponse
                do {
                    let decoder = JSONDecoder()
                    let flightOfferResponse = try decoder.decode(FlightOfferResponse.self, from: data)
                    completion(.success(flightOfferResponse))
                } catch {
                    completion(.failure(error))
                }
            }
            
            // Iniciar la tarea
            task.resume()
        }
        
        
        
        
        
        func getToken() async throws ->String{
            
            
            // Definir los parámetros del cuerpo de la solicitud
            let parameters = [
                "grant_type": "client_credentials",
                "client_id": "85RkeProQeODem6DrGZIyRbCWIIdaLSh",
                "client_secret": "5Jy2E5V1Xh3zjjpx"
            ]
            
            // Crear la URL de la solicitud
            guard let url = URL(string: "https://test.api.amadeus.com/v1/security/oauth2/token") else {
                throw NSError(domain: "InvalidURL", code: 0, userInfo: nil)
            }
            
            // Crear la solicitud URLRequest
            var request = URLRequest(url: url)
            
            // Configurar la solicitud como POST
            request.httpMethod = "POST"
            
            // Configurar el cuerpo de la solicitud con los parámetros
            request.httpBody = parameters
                .map { "\($0)=\($1)" }
                .joined(separator: "&")
                .data(using: .utf8)
            
            // Configurar el encabezado de la solicitud
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            // Crear la sesión de URLSession
            let session = URLSession.shared
            
            // Realizar la solicitud
            let (data, response) = try await session.data(for: request)
            
            // Verificar el código de estado de la respuesta
            guard (200...299).contains((response as? HTTPURLResponse)?.statusCode ?? 0) else {
                throw NSError(domain: "ServerError", code: (response as? HTTPURLResponse)?.statusCode ?? 0, userInfo: nil)
            }
            
            // Procesar los datos de la respuesta (por ejemplo, decodificar el JSON)
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                
                accessToken = json["access_token"] as? String
            } else {
                throw NSError(domain: "InvalidResponse token", code: 0, userInfo: nil)
            }
            
            // Devolver el token de acceso
            return accessToken ?? ""
        }
        
        
        
        
        
        func fetchAndDisplayData(for originLocation: String, destinationLocation: String, departureDate: String, returnDate: String, adults: Int, accessToken: String, completion: @escaping (DataToShow, Error?) -> Void) async throws {
             let endpoint = "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=\(originLocation)&destinationLocationCode=\(destinationLocation)&departureDate=\(departureDate)&returnDate=\(returnDate)&adults=\(adults)&max=5"
             
            
            
            
            
            try await getData(accessToken, endpoint) { result in
                switch result {
                case .success(let flyghtData):
                    
                    
                    var  i=0
                    for flyghtData in flyghtData.data {
                        //   print("bokeable seat: \(flyghtData.numberOfBookableSeats)")
                        self.data.bookeableSeat = flyghtData.numberOfBookableSeats
                        // Iterar sobre los itinerarios de cada oferta de vuelo
                        for itinerary in flyghtData.itineraries{
                            
                            self.data.itineraty.duration = itinerary.duration
                            
                            //  if let segment = itinerary.arrival {
                            for segments in itinerary.segments{
                                self.data.segment.append(segments)
                            
                            }
                            // Imprimir el precio total de cada oferta de vuelo
                            self.data.totalPrice = flyghtData.price.total
                            self.data.currency = flyghtData.price.currency
                        }
                    }
                    
                    // Supongamos que fetchedData es donde tienes tus datos obtenidos
                    // let fetchedData = DataToShow(bookeableSeat: 10, totalPrice: "100", currency: "USD", itinerary: [])
                    
                    // Cuando los datos estén listos
                    self.delegate?.dataFetched(dataToShow: self.data)
                    
                    
                    
                case .failure:
                    print("Error al obtener datos: \(self.error)")
                    // Manejar el error, por ejemplo, mostrar un mensaje al usuario
                }
            }
        }
        
        
        
    }
    
    

