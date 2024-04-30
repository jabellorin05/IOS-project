//
//  InformationViewController.swift
//  TravelAgency3
//
//  Created by Nelson, Camilo and Jose on 2024-04-28.
//

import UIKit

class InformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonReservation(){
        let reservation = storyboard?.instantiateViewController(withIdentifier: "RVC") as! ReservationViewController
        present(reservation, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
