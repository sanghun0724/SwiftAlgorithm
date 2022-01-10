let inputs = Array(readLine()!).map{String($0)}

var stack = [String]()
var res = 0
var isCheck = true
var tmp = 1

for i in inputs.indices {
    
    if inputs[i] == "(" {
        tmp *= 2
        stack.append(inputs[i])
    }  else if inputs[i] == "[" {
        tmp *= 3
        stack.append(inputs[i])
    } else if inputs[i] == ")" {
        if stack.isEmpty || stack.last != "(" {
            isCheck = false
            break
        }
        
        if inputs[i-1] == "(" {
            res += tmp
        }
        let _ = stack.popLast()
        tmp /= 2
    } else if inputs[i] == "]" {
        if stack.isEmpty || stack.last != "[" {
            isCheck = false
            break
        }
        
        if inputs[i-1] == "[" {
            res += tmp
        }
        let _ = stack.popLast()
        tmp /= 3
    }
}

if !isCheck || !stack.isEmpty {
    print(0)
} else {
    print(res)
}
