//
//  main.swift
//  BaekJoon#11725
//
//  Created by 김병엽 on 2023/05/16.
//
// Reference: https://zest1923.tistory.com/141

import Foundation

func solution() {
    
    let n = Int(readLine()!)!
    var tree: [Int: [Int]] = [:]
    Array(1...n).forEach { tree[$0] = [] }
    var result = [Int](repeating: 0, count: n + 1)
    for _ in 1..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! },
        (x, y) = (input[0], input[1])
        
        tree[x]!.append(y)
        tree[y]!.append(x)
    }
    
    var queue = [1]
    
    while !queue.isEmpty {
        let n = queue.removeFirst()
        
        guard let nodes = tree[n] else { continue }
        
        for i in nodes {
            guard result[i] == 0 else { continue }
            
            result[i] = n
            queue.append(i)
        }
    }
    
    for i in 2...n {
        print(result[i])
    }
}

solution()
