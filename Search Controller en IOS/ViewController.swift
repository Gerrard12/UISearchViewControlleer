//
//  ViewController.swift
//  Search Controller en IOS
//
//  Created by alumno on 3/7/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating{

    let searchController = UISearchController(searchResultsController: nil)
    var dispositivos = Array<Dispositivos>()
    var dispositivosFiltrados = Array<Dispositivos>()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        
        
        for i in 0...8{
            let dispositivo = Dispositivos()
            
            switch i {
            case 0:
                dispositivo.nombre = "iPhone"
                dispositivo.precio = 599.00
                dispositivo.año = "2007"
            case 1:
                dispositivo.nombre = "iPod"
                dispositivo.precio = 399.00
                dispositivo.año = "2001"
            case 2:
                dispositivo.nombre = "iPod touch"
                dispositivo.precio = 210.00
                dispositivo.año = "2007"
            case 3:
                dispositivo.nombre = "iPad"
                dispositivo.precio = 499.00
                dispositivo.año = "2010"
            case 4:
                dispositivo.nombre = "iPad mini"
                dispositivo.precio = 659.00
                dispositivo.año = "2012"
            case 5:
                dispositivo.nombre = "iMac"
                dispositivo.precio = 1299.00
                dispositivo.año = "1997"
            case 6:
                dispositivo.nombre = "Mac Pro"
                dispositivo.precio = 2499.00
                dispositivo.año = "2006"
            case 7:
                dispositivo.nombre = "MacBook Air"
                dispositivo.precio = 1799.00
                dispositivo.año = "2008"
            default:
                dispositivo.nombre = "MacBook Pro"
                dispositivo.precio = 1499.00
                dispositivo.año = "2006"
            
            }
            dispositivos.append(dispositivo)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return dispositivosFiltrados.count
        }
 
        return dispositivos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.textLabel?.text = dispositivosFiltrados[indexPath.row].nombre
            cell.detailTextLabel?.text = "$" + String(dispositivosFiltrados[indexPath.row].precio) + " | " + dispositivosFiltrados[indexPath.row].año
            return cell
        }
        else {
        cell.textLabel?.text = dispositivos[indexPath.row].nombre
        cell.detailTextLabel?.text = "$" + String(dispositivos[indexPath.row].precio) + " | " + dispositivos[indexPath.row].año
        return cell
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let texto = searchController.searchBar.text
        
        dispositivosFiltrados = dispositivos.filter({ (dispositivo) -> Bool in
            return String(dispositivo.precio).lowercased().contains(texto!.lowercased())
        
            
        })
        
        tableView.reloadData()
    }
}

