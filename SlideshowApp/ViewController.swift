//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 松岡哲平 on 2020/10/12.
//  Copyright © 2020 tetelab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var btnReturn: UIButton!
    @IBOutlet weak var btnMoveOn: UIButton!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "Ham1")!,
        UIImage(named: "Ham2")!,
        UIImage(named: "Ham3")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func slideShowBtn(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            btnStartStop.setTitle("停止", for: .normal)
            
            //戻る、進むボタンを選択できないように
            btnReturn.isEnabled = false
            btnMoveOn.isEnabled = false

        } else {
            // 停止時の処理を実装
            StopTimer()
        }
        
    }
    
    func StopTimer(){
        // 停止時の処理を実装
        // タイマーを停止する
        timer.invalidate()

        // タイマーを削除(timer.invalidateだけだとtimerがnilにならないため)
        timer = nil

        // ボタンの名前を再生に直しておく
        btnStartStop.setTitle("再生", for: .normal)
        
        //戻る、進むボタンを選択できるように
        btnReturn.isEnabled = true
        btnMoveOn.isEnabled = true
    }

    @IBAction func moveOnBtn(_ sender: Any) {
        changeImage()
    }
    
    @IBAction func returnBtn(_ sender: Any) {
        returnImage()
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex >= imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        //画像を表示
        display()
    }
    
    @objc func returnImage() {
           // indexを減らして表示する画像を切り替える
           nowIndex -= 1

           // indexがマイナスになってしまう場合
           if (nowIndex < 0) {
               // indexを一番最後の数字に戻す
               nowIndex = imageArray.count
               nowIndex -= 1
           }
        //画像を表示
        display()
       }
    
    //表示する関数
    func display(){
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (timer != nil) {
            //タイマーを停止
            StopTimer()
        }
        
        // segueから遷移先のViewControllerを取得する
        let ExpansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController

        // 遷移先のViewControllerで宣言しているimageNumberに値を代入して渡す
        ExpansionViewController.imageNumber = imageArray[nowIndex]

    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

