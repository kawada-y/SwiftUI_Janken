//
//  ContentView.swift
//  MyJanken
//
//  Created by 河田佳之 on 2024/03/04.
//

import SwiftUI

struct ContentView: View {
    
    @State var answerNumber = 0
    
    var body: some View {
        // 垂直にレイアウト（縦方向にレイアウト）
        VStack {
            Spacer()
            if answerNumber == 0 {
                // 初期画面のテキストを表示
                Text("これからじゃんけんをします")
                    .padding(.bottom)
            } else if answerNumber == 1 {
                // じゃんけんの数字が１の場合、グー画像を指定
                // グー画像を指定
                Image("gu")
                    // リサイズ指定
                    .resizable()
                    // 画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                Spacer()
                // じゃんけんの種類を指定
                Text("グー")
                    .padding(.bottom)
            } else if answerNumber == 2 {
                // じゃんけんの数字が２の場合、チョキ画像を指定
                Image("choki")
                    // リサイズ指定
                    .resizable()
                    // 画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                Spacer()
                // じゃんけんの種類を指定
                Text("チョキ")
                    .padding(.bottom)
            } else {
                // じゃんけんの数字が１と２以外の場合、パー画像を指定
                Image("pa")
                    // リサイズ指定
                    .resizable()
                    // 画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                Spacer()
                // じゃんけんの種類を指定
                Text("パー")
                    .padding(.bottom)
            }
            // じゃんけんするボタン
            Button(action: {
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                repeat {
                    // 1,2,3の変数をランダムに算出（乱数）
                    newAnswerNumber = Int.random(in: 1...3)
                    
                    // 異なる結果の場合、repeatを抜ける
                } while answerNumber == newAnswerNumber
                
                // 新しいじゃんけんの結果を格納
                answerNumber = newAnswerNumber
            }, label: {
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            })
        }
    }
}

#Preview {
    ContentView()
}
