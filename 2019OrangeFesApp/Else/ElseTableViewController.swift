//
//  ElseTableViewController.swift
//  2019OrangeFesApp
//
//  Created by 西田翔平 on 2019/06/03.
//  Copyright © 2019 Shohei Nishida. All rights reserved.
//

import UIKit

class ElseTableViewController: UITableViewController {

    // cellのlabelに書く文字列
    let Else1: [String] = ["法政国際高等学校ホームページ", "公式Instagram"]
    let Else2: [String] = ["校長より", "委員長より","議長より", "副委員長より"]
    let Else2Number: [Int] = [0,1,2,3]
    let Else3: [String] = ["2018年度オレンジ祭実行委員会","ログイン"]
    let Else4: [String] = ["利用規約"]
    let Else5: [String] = ["落し物一覧","来場者アンケート","お問い合わせ"]
    
    let Else1Picture: [String] = ["Map1.jpg","",""]
    
    // 遷移先のViewControllerに渡す変数
    var giveElseData: String = ""
    var giveElseImage: String = ""
    var giveGreetingNumber: Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // sectionの数を返す関数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //sectionの色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //labelの色
        view.tintColor = UIColor(red: 153/255, green: 255/255, blue: 255/255, alpha: 0.7)
        //labelの文字
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Else1.count
        } else if section == 1 {
            return Else2.count
        } else if section == 2 {
            return Else3.count
        } else if section == 3 {
            return Else4.count
        } else if section == 4 {
            return Else5.count
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
        
        var ElseSectionName: String = "設定されていません"
        
        if section == 0 {
            ElseSectionName = "公式"
        }else if section == 1 {
            ElseSectionName = "メッセージ"
        }else if section == 2{
            ElseSectionName = "スタッフ"
        }else if section == 3{
            ElseSectionName = "このアプリについて"
        }else{
            ElseSectionName = "お問い合わせ"
        }
        return "\(ElseSectionName)"
    }
    
    // cellの情報を書き込む関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ElseTableViewCell", for: indexPath) as! ElseTableViewCell
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        // ここでcellのlabelに値を入れています。//ここに新たな文字をい入れる
        if indexPath.section == 0 {
            cell.ElseName.text = Else1[indexPath.item]
        } else if indexPath.section == 1 {
            cell.ElseName.text = Else2[indexPath.item]
        } else if indexPath.section == 2 {
            cell.ElseName.text = Else3[indexPath.item]
        } else if indexPath.section == 3 {
            cell.ElseName.text = Else4[indexPath.item]
        } else if indexPath.section == 4 {
            cell.ElseName.text = Else5[indexPath.item]
        }
        return cell
    }
    
    
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url1 = URL(string: "https://kokusai-high.ws.hosei.ac.jp")!
        let url2 = URL(string: "https://www.instagram.com/2019orangefes/")!
        let url3 = URL(string: "https://forms.gle/kejw7gb7R72pzjPt9")!
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        if indexPath.section == 0 {
            giveElseData = Else1[indexPath.item]
            if indexPath.row == 0 {
                UIApplication.shared.open(url1)
            } else {
                UIApplication.shared.open(url2)
            }
        } else if indexPath.section == 1{
            giveGreetingNumber = Else2Number[indexPath.row]
            performSegue(withIdentifier: "GreetingSegue", sender: nil)
        } else if indexPath.section == 2{
            if indexPath.row == 1 {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                giveElseData = Else3[indexPath.item]
                giveElseImage = "Staff.jpg"
                performSegue(withIdentifier: "ElseSegue", sender: nil)
            }
        } else if indexPath.section == 3{
            giveElseData = Else4[indexPath.item]
            performSegue(withIdentifier: "AgreementSegue", sender: nil)
            
        } else if indexPath.section == 4{
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "LostAndFoundSegue", sender: nil)
            } else if indexPath.row == 1 {
                giveElseData = Else5[indexPath.item]
                performSegue(withIdentifier: "ElseSegue", sender: nil)
            } else {
                UIApplication.shared.open(url3)
            }
        }

    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ElseSegue" {
            let vc = segue.destination as! ElseViewController
            vc.ElseTitleData = giveElseData
            vc.ElseImageData = giveElseImage
        } else if segue.identifier == "GreetingSegue" {
            let vc = segue.destination as! ElseGreetingViewController
            vc.GreetingNumber = giveGreetingNumber
        }
    }
    
}
