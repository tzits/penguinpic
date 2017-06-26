//
//  ViewController.swift
//  PenguinCollector
//
//  Created by Toby Zitsman on 6/2/17.
//  Copyright © 2017 Toby Zitsman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var penguins : [Penguin] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            penguins = try context.fetch(Penguin.fetchRequest())
            tableView.reloadData()
        }
        catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return penguins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let penguin = penguins[indexPath.row]
        cell.textLabel?.text = penguin.title
        cell.imageView?.image = UIImage(data: penguin.image! as Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let penguin = penguins[indexPath.row]
        performSegue(withIdentifier: "penguinSegue", sender: penguin)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! PenguinViewController
        nextVC.penguin = sender as? Penguin
    }
}

