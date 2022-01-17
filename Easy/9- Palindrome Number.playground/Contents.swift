import Foundation

func isPalindrome(_ x: Int) -> Bool {
    return String(x) == String(String(x).reversed())
}
