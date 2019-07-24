//
//  MapTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/05/31.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class MapTableViewController: UITableViewController {

    // cellのlabelに書く文字列
    
    let Building1: [String] = ["１号館・３号館"]
    let Building2: [String] = ["１階", "２階", "３階"]
    let Building3: [String] = ["4号館"]
    let BuildingElse: [String] = ["全体","体育館","グラウンド","オレンジの間前","パブリックスペース"]
    
    let Building1Picture: [String] = ["13.PNG"]
    let Building2Picture: [String] = ["21.PNG","22.PNG","23.PNG"]
    let Building3Picture: [String] = ["4.PNG"]
    let BuildingElsePicture: [String] = ["Map1.jpg","Map1.jpg","Map1.jpg","Map1.jpg","Map1.jpg"]
    
    // 遷移先のViewControllerに渡す変数
    var giveData: String = ""
    var giveMap: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Building1.count
        } else if section == 1 {
            return Building2.count
        } else if section == 2 {
            return Building3.count
        } else if section == 3 {
            return BuildingElse.count
        } else {
            return 0
        }
    }
    
    
    
    // sectionの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // sectionに載せる文字列を返す関数
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var PlaceName: String = "設定されていません"
        
        if section == 0 {
            PlaceName = "１号館・３号館"
        }else if section == 1 {
            PlaceName = "２号館"
        }else if section == 2{
            PlaceName = "4号館"
        }else{
            PlaceName = "その他"
        }
        return "\(PlaceName)"
    }
    
    //sectionの色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //labelの色
        view.tintColor = UIColor(red: 255/255, green: 204/255, blue: 255/255, alpha: 0.7)
        //labelの文字
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    // cellの情報を書き込む関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as! MapTableViewCell
        //cellに右矢印を追加する
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        // ここでcellのlabelに値を入れています。//ここに新たな文字をい入れる
        if indexPath.section == 0 {
            cell.MapPlace.text = Building1[indexPath.item]
        } else if indexPath.section == 1 {
            cell.MapPlace.text = Building2[indexPath.item]
        } else if indexPath.section == 2 {
            cell.MapPlace.text = Building3[indexPath.item]
        } else if indexPath.section == 3 {
            cell.MapPlace.text = BuildingElse[indexPath.item]
        }
          return cell
    }
    
    
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        if indexPath.section == 0 {
            giveData = Building1[indexPath.item]
            giveMap = Building1Picture[indexPath.item]
        } else if indexPath.section == 1{
            giveData = Building2[indexPath.item]
            giveMap = Building2Picture[indexPath.item]
        } else if indexPath.section == 2{
            giveData = Building3[indexPath.item]
            giveMap = Building3Picture[indexPath.item]
        } else if indexPath.section == 3{
            giveData = BuildingElse[indexPath.item]
            giveMap = BuildingElsePicture[indexPath.item]
        }
        
        
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "MapSegue", sender: nil)
        
        
    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapSegue" {
            let vc = segue.destination as! MapViewController
            vc.receiveData = giveData
            vc.receiveMap = giveMap
        }
    }
    
}
