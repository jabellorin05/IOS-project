//
//  ViewController.swift
//  TravelAgency3
//
//  Created by Nelson Penha on 2024-04-28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var controllView: UIView!
    var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func ButtonBook(){
        let book = storyboard?.instantiateViewController(withIdentifier: "BVC") as! BookViewController
        present(book, animated: true)
    }
    @IBAction func ButtonAboutUs(){
        let about = storyboard?.instantiateViewController(withIdentifier: "AUVC") as! AboutUsViewController
        present(about, animated: true)
    }
    @IBAction func ButtonDestination(){
        let destination = storyboard?.instantiateViewController(withIdentifier: "DVC") as! DestinationViewController
        present(destination, animated: true)
    }
    @IBAction func ButtonContact(){
        let contact = storyboard?.instantiateViewController(withIdentifier: "COVC") as! ContactViewController
        present(contact, animated: true)
    }
    
    
    @IBAction func buttonSearch(_ sender: UIBarButtonItem) {
        let book = storyboard?.instantiateViewController(withIdentifier: "BVC") as! BookViewController
        present(book, animated: true)
    }
    
    
    @IBAction func buttonReservation(_ sender: UIBarButtonItem) {
        let reservation = storyboard?.instantiateViewController(withIdentifier: "RVC") as! ReservationViewController
        present(reservation, animated: true)
    }
    
    
    @IBAction func buttonCart(_ sender: UIBarButtonItem) {
        let cart = storyboard?.instantiateViewController(withIdentifier: "CVC") as! CartViewController
        present(cart, animated: true)
        
    }
    
    @IBAction func returnMain(){
        let main = storyboard?.instantiateViewController(withIdentifier: "VC") as! ViewController
        present(main, animated: true)
    }
}
