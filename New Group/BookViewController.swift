//
//  BookViewController.swift
//  TravelAgency3
//
//  Created by Nelson, Camilo and Jose on 2024-04-28.
//

import UIKit

class BookViewController: UIViewController {
    
    // Diccionario para mapear códigos de ciudad a nombres de ciudad y viceversa
    let cityCodeToName = [
        "bog": "Bogota",
        "ccs": "Caracas",
        "mex": "Mexico",
        "lax": "Los Angeles",
        "jfk": "New York",
        "lhr": "London",
        "cdg": "Paris",
        "ber": "Berlin",
        "mad": "Madrid",
        "fco": "Rome",
        "eze": "Buenos Aires",
        "bkk": "Bangkok",
        "hnd": "Tokyo",
        "cai": "Cairo",
        "del": "New Delhi",
        "pek": "Beijing",
        "svo": "Moscow",
        "ath": "Athens",
        "yow": "Ottawa",
        "bsb": "Brasilia",
        "syd": "Sydney",
        "ist": "Istanbul",
        "hkg": "Hong Kong",
        "yul": "Montreal",
        // Agrega más ciudades según sea necesario
    ]
    
    let cityNameToCode = [
        "bogota": "BOG",
        "caracas": "CCS",
        "mexico": "MEX",
        "los angeles": "LAX",
        "new york": "JFK",
        "london": "LHR",
        "paris": "CDG", // Charles de Gaulle Airport
        "berlin": "BER", // Berlin Brandenburg Airport
        "madrid": "MAD", // Adolfo Suárez Madrid–Barajas Airport
        "rome": "FCO", // Leonardo da Vinci–Fiumicino Airport
        "buenos aires": "EZE", // Ministro Pistarini International Airport
        "bangkok": "BKK", // Suvarnabhumi Airport
        "tokyo": "HND", // Haneda Airport
        "cairo": "CAI", // Cairo International Airport
        "new delhi": "DEL", // Indira Gandhi International Airport
        "beijing": "PEK", // Beijing Capital International Airport
        "moscow": "SVO", // Sheremetyevo International Airport
        "athens": "ATH", // Athens International Airport
        "ottawa": "YOW", // Ottawa Macdonald-Cartier International Airport
        "brasilia": "BSB", // Brasília International Airport
        "sydney": "SYD", // Sydney Kingsford Smith Airport
        "istanbul": "IST", // Istanbul Airport
        "hong kong": "HKG", // Hong Kong International Airport
        // Agrega más ciudades según sea necesario
        "montreal": "YUL",
    
    ]
    @IBOutlet weak var originTextField: UITextField!
    
    @IBOutlet weak var originCodeTextField: UITextField!
    
    @IBOutlet weak var destinationTextField: UITextField!
    
    
    @IBOutlet weak var destinationCodeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Configurar los delegados de los textfields
            originTextField.delegate = self
            destinationTextField.delegate = self
            originCodeTextField.delegate = self
            destinationCodeTextField.delegate = self
    }
    
    // Función para obtener el nombre de la ciudad basado en el código ingresado
        func cityName(from code: String) -> String? {
            return cityCodeToName[code]
        }
        
        // Función para obtener el código de la ciudad basado en el nombre ingresado
        func cityCode(from name: String) -> String? {
            return cityNameToCode[name]
        }
    
    @IBAction func ButtonChooseFlight(){
        let choose = storyboard?.instantiateViewController(withIdentifier: "CFVC") as! ChooseFlightViewController
        present(choose, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // Extensión para manejar los eventos del UITextFieldDelegate
    
}
extension BookViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Combina el texto actual con el texto adicional que el usuario está ingresando
        if let text = textField.text, let newText = (text as NSString?)?.replacingCharacters(in: range, with: string) {
            // Verifica si el textfield es el de origen
            if textField == originTextField {
                let cityName = newText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                if !cityName.isEmpty {
                    if let code = cityCode(from: cityName) {
                        originCodeTextField.text = code
                    } else {
                        originCodeTextField.text = ""
                        // Muestra un mensaje de error al usuario
                        // showError("No se encontró el código IATA para la ciudad ingresada")
                    }
                } else {
                    originCodeTextField.text = "" // Si el campo de origen está vacío, borra el campo de código IATA
                }
            }
            // Verifica si el textfield es el de destino
            else if textField == destinationTextField {
                let cityName = newText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                if !cityName.isEmpty {
                    if var code = cityCode(from: cityName) {
                        destinationCodeTextField.text = code
                    } else {
                        destinationCodeTextField.text = ""
                        // Muestra un mensaje de error al usuario
                        // showError("No se encontró el código IATA para la ciudad ingresada")
                    }
                } else {
                    destinationCodeTextField.text = "" // Si el campo de destino está vacío, borra el campo de código IATA
                }
            }
        }
        return true
    }
    
    
    
    
    //segue to send the data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "book_segue" {
            if let destinationVC = segue.destination as? ChooseFlightViewController {
                destinationVC.departureDate = "2024-10-10"
                destinationVC.destinationLocation = destinationCodeTextField.text ?? "default"
                destinationVC.originLocation = originCodeTextField.text ?? "default"
            }
        }
    }

    
    
    
    
    
    
}
