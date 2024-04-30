//
//  ChooseFlightViewController.swift
//  TravelAgency3
//
//  Created by Nelson, Camilo and Jose on 2024-04-28.
//

import UIKit


class ChooseFlightViewController: UIViewController, GetDataDelegate{
    
    
    
    // Declaración de variables
    var departureDate: String = "2024-06-08" // Fecha de salida
    var originLocation: String = "YUL" // Ubicación de origen
    var returnDate: String = "2024-12-11" // Fecha de regreso
    var destinationLocation: String = "BOG" // Ubicación de destino
    var adults: Int = 1 // Número de personas
    var getData = getDataFromApi()
    
    
    var duration = ""
    
    @IBOutlet weak var departure_time: UILabel!
    @IBOutlet weak var number_of_seat: UILabel!
    @IBOutlet weak var departure_length:UILabel!
    @IBOutlet weak var departure_location: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    
   
    
    
    
    @IBOutlet weak var depart_arr_code_r: UILabel!
   
   
    
    @IBOutlet weak var number_of_seat_r: UILabel!
    
    @IBOutlet weak var travel_t_duration: UILabel!
   
    
    
    @IBOutlet weak var departure_arrival_time_r: UILabel!
    
    
    
    func dataFetched(dataToShow: DataToShow) {
        
        duration = dataToShow.segment[0].duration
        
        print("Departure:", dataToShow.segment[0].departure)
        print("Aerolinea:", dataToShow.segment[0].carrierCode)
        print("Aerolinea:", dataToShow.segment[0].duration)
        print("Aerolinea:", dataToShow.segment[0].departure.iataCode)
        print("Aerolinea:", dataToShow.segment[0].departure.at)
        print("Aerolinea:", dataToShow.segment[0].arrival.iataCode)
        print("Aerolinea:", dataToShow.segment[0].arrival.at)
        
        
        print("Departure:", dataToShow.segment[2].departure)
        print("Aerolinea:", dataToShow.segment[2].carrierCode)
        print("Aerolinea:", dataToShow.segment[2].duration)
        print("Aerolinea:", dataToShow.segment[2].departure.iataCode)
        print("Aerolinea:", dataToShow.segment[2].departure.at)
        print("Aerolinea:", dataToShow.segment[2].arrival.iataCode)
        print("Aerolinea:", dataToShow.segment[2].arrival.at)
        
        DispatchQueue.main.async {
            var i=0
            self.departure_length.text = dataToShow.segment[i].duration
            self.number_of_seat.text! += String( dataToShow.bookeableSeat)
            self.departure_location.text = dataToShow.segment[i].departure.iataCode
            self.price.text! += " "+dataToShow.totalPrice
            self.departure_time.text=dataToShow.segment[i].departure.at
            self.departure_location.text! += "-" + dataToShow.segment[i].arrival.iataCode
            
            i=3
           // self.departure_arrival_code.text = dataToShow.segment[i].duration
           //// self.number_of_seat_r.text! += String( dataToShow.bookeableSeat)
        
          
            self.departure_arrival_time_r.text=dataToShow.segment[i].departure.at
            self.depart_arr_code_r.text = dataToShow.segment[i].arrival.iataCode
            self.depart_arr_code_r.text! += "-" + dataToShow.segment[i].departure.iataCode
            
            self.number_of_seat_r.text! += String( dataToShow.bookeableSeat)
            
            self.travel_t_duration.text = String( dataToShow.segment[i].duration)
            
            // self.departure_arrival_code.text! += "-" + dataToShow.segment[i].arrival.iataCode
           // self.departure_duration.text = dataToShow.segment[1].duration
            
            }
        
    }
    
    func fetchErrorOccurred(error: Error) {
        // print("Error al obtener datos:", error.localizedDescription)
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData.delegate = self
        Task {
            do {
                // Espera a que se complete la obtención del token de acceso
                let accessToken = try await getData.runApi()
                
                if !accessToken.isEmpty {
                    
                    
                    
                    
                    try await getData.fetchAndDisplayData(
                        for: originLocation,
                        destinationLocation: destinationLocation,
                        departureDate: departureDate,
                        returnDate: returnDate,
                        adults: adults,
                        accessToken: accessToken
                    ) { dataToShow, error in
                        if let error = error {
                            // Manejar el error
                            print("Error al obtener datos:", error.localizedDescription)
                        } else {
                            // Utilizar los datos en el ViewController
                            print("Valor de duration:", self.duration) // Verifica el valor de duration
                            DispatchQueue.main.async {
                                self.departure_length.text = self.duration
                            }
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
            }
        }
    }
}
