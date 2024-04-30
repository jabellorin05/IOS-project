//
//  ReservationViewController.swift
//  TravelAgency3
//
//  Created by Nelson Penha on 2024-04-28.
//

import UIKit

class ReservationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func ButtonCart(){
        let cart = storyboard?.instantiateViewController(withIdentifier: "CVC") as! CartViewController
        present(cart, animated: true)
    }
    @IBAction func returnMain(){
        let main = storyboard?.instantiateViewController(withIdentifier: "VC") as! ViewController
        present(main, animated: true)
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
