

import Foundation

func solution(_ character:String, _ monsters:[String]) -> String {
    var maxExe = 0.0
    var totalExe = 0.0
    var indexVal = 0
    var res = ""
    //player
    let player = character.split(separator: " ").map{ Int(String($0))!}
    var playerHP = player[0]
    let playerAttack = player[1]
    let playerDefence = player[2]
    let tmp = playerHP
    //Monster
    loop:for i in 0..<monsters.count {
        var monster = monsters[i].split(separator: " ").map { String($0) }
        let monsterName = monster.removeFirst()
        let monsterInfo = monster.map{ Int($0)! }
        let value = Double(monsterInfo[0])
        var monsterHP = monsterInfo[1]
        let monsterAttack = monsterInfo[2]
        let monsterDefence = monsterInfo[3]


        var sec = 0.0
        while true {
            playerHP = tmp
            sec+=1
            if playerAttack - monsterDefence > 0 {
                monsterHP -= (playerAttack-monsterDefence)
            }
            if monsterHP <= 0 {
                break
            }
            if monsterAttack - playerDefence > 0 {
                playerHP -= (monsterAttack-playerDefence)
            }
            if playerHP <= 0 {
                continue loop;
            }
            if sec > 1000.0 {
                continue loop;
            }
        }
        let exe = value / sec
        if maxExe < exe {
            maxExe = exe
            res = monsterName
            totalExe = value
            indexVal = i
        } else if maxExe == exe {
            if totalExe < value {
                maxExe = exe
                res = monsterName
                totalExe = value
                indexVal = i
            } else if totalExe == value {
                if indexVal > i {
                    maxExe = exe
                    res = monsterName
                    totalExe = value
                    indexVal = i
                }
            }
        }
    }
    return res
}


solution("10 5 2", ["Knight 3 10 10 3","Wizard 5 10 15 1","Beginner 1 1 15 1"])



import Foundation

func solution(_ time:Int, _ gold:Int, _ upgrade:[[Int]]) -> Int {
    var res = 0
    
    
    let firstTime =  upgrade[0][1]
    res = gold * (time/firstTime)
    
    loop:for i in 1...upgrade.count {
        
        var tmpTime = time
        var curMoney = 0
        for i in 0..<upgrade.count - 1  {
           let interval = upgrade[i][1]
          
            while curMoney < upgrade[i+1][1] {
                tmpTime -= interval
                curMoney += gold
                if tmpTime < interval {
                    res = max(res,curMoney)
                    continue loop;
                }
            }
            curMoney -= upgrade[i+1][0]
        }
        if tmpTime > 0 {
            tmpTime -= upgrade.last![1]
            curMoney += gold
        }
        res = max(res, curMoney)
    }
    return res
}
solution(100, 200, [[0, 5], [1500, 3], [3000, 1]])
