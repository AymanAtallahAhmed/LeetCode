import UIKit

func intToRoman(_ num: Int) -> String {
    var localNum = num
    var solArr: [String] = []
    let nums = [1000, 500, 100, 50, 10, 5, 1]
    
    while localNum > 0 {
        for roNum in nums {
            var (isClose, num) = checkIfClose(num: localNum, roman: roNum)
            if isClose {
                if localNum%roNum == localNum/roNum { return solArr.joined() }
                solArr.append(getRomanFor(num: num))
                solArr.append(getRomanFor(num: roNum))
                if ((roNum == 1000) || (roNum == 500)) { localNum %= 100}
                else if ((roNum == 100) || (roNum == 50)) { localNum %= 10}
                else if (roNum == 5) || (roNum == 10) { localNum = 0 }
                break
            } else {
                let val = localNum/roNum
                solArr.append(contentsOf: Array(repeating: getRomanFor(num: roNum), count: val))
                localNum = localNum%roNum
                if localNum%roNum == localNum/roNum { return solArr.joined() }
                
                (isClose, num) = checkIfClose(num: localNum, roman: roNum)
                 if (roNum == 1) { return solArr.joined() }
                if (localNum%roNum == localNum) && (!isClose) { continue } else { break }
            }
        }
    }
    return solArr.joined()
}


private func checkIfClose(num: Int, roman: Int) -> (Bool, Int) {
    switch roman {
    case 5:
        return ((num == roman-1), 1)
    case 10:
        return ((num == roman-1), 1)
    case 50:
        return ((num/10 == (roman/10)-1), 10)
    case 100:
        return ((num/10 == (roman/10)-1), 10)
    case 500:
        return ((num/100 == (roman/100)-1), 100)
    case 1000:
        return ((num/100 == (roman/100)-1), 100)
    default :
        return (false, 0)
    }
}

private func getRomanFor(num: Int) -> String {
    switch num {
    case 1:
        return "I"
    case 5:
        return "V"
    case 10:
        return "X"
    case 50:
        return "L"
    case 100:
        return "C"
    case 500:
        return "D"
    case 1000:
        return "M"
    default :
        return ""
    }
}


intToRoman(132)
