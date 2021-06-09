//
//  ViewController.swift
//  Belyaev.IOS.Lection-13 TableView
//
//  Created by максим  кондратьев  on 08.06.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
//--OUTLETS--//
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    //---Var/Let---//
    
    private var tasks : [Tasks] = Tasks.loadTask() {
        didSet {
            Tasks.saveTask(tasks)
        }
    }
    //----//
    override func viewDidLoad() {
        super.viewDidLoad()
        //регистрируем ячейку xib
        let nib = UINib(nibName: "XibTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "xibCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTextField.delegate = self
    }
    
    
    
}
extension ViewController:  UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "xibCell", for: indexPath) as! XibTableViewCell
        cell.configureCell( tasks[indexPath.row])
        return cell
    }
    
    //Mark* - Удаляем задачи
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    //  метод, когда мы тапаем по ячейке
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
    }
    
}
extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
    let task = Tasks(title: myTextField.text ?? "xxx", description: "description text", isActiveSwitch: false)
        self.tasks.append(task)
        myTextField.text = ""
        textField.resignFirstResponder()
        myTableView.reloadData()
        return true
    }
}


