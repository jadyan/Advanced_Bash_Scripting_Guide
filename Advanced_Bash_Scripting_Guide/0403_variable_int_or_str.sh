#!/bin/bash
###
 # @Author: your name
 # @Date: 2021-03-18 15:48:29
 # @LastEditTime: 2021-03-18 15:59:55
 # @LastEditors: Please set LastEditors
 # @Description: In User Settings Edit
 # @FilePath: /jadyan/code/book/Advanced_Bash_Scripting_Guide/0403_variable_int_or_str.sh
### 
# int-or-string.sh
a=2334                   # 整数。
let "a += 1"
echo "a = $a "           # a = 2335
echo                     # 依旧是整数。

# 将 "23" 替换为 "BB"。
b=${a/23/BB}
# $b 变成了字符串。
echo "b = $b"            # b = BB35

 # 将其声明为整数并没有什么卵用。
declare -i b

echo "b = $b"            # b = BB35

let "b += 1"             # BB35 + 1
echo "b = $b"            # b = 1
echo                     # Bash 认为字符串的"整数值"为0。

c=BB34
echo "c = $c"            # c = BB34
d=${c/BB/23}             # 将 "BB" 替换为 "23"。
                         # $d 变为了一个整数。
echo "d = $d"            # d = 2334
let "d += 1"             # 2334 + 1
echo "d = $d"            # d = 2335
echo





# 如果是空值会怎样呢？
e=''                     # ...也可以是 e="" 或 e=
echo "e = $e"            # e =
let "e += 1"             # 空值是否允许进行算术运算？
echo "e = $e"            # e = 1

echo                     # 空值变为了一个整数。


# 如果时未声明的变量呢？
echo "f = $f"            # f =
let "f += 1"             # 是否允许进行算术运算？
echo "f = $f"            # f = 1
echo                     # 未声明变量变为了一个整数。

# 然而……
#let "f /= $undecl_var"   # 可以除以0么？
#   let: f /= : syntax error: operand expected (error token is " ")
# 语法错误！在这里 $undecl_var 并没有被设置为0！
#
# 但是，仍旧……
let "f /= 0"
#   let: f /= 0: division by 0 (error token is "0")
# 预期之中。


# 在执行算术运算时，Bash 通常将其空值的整数值设为0。
# 但是不要做这种事情！
# 因为这可能会导致一些意外的后果。
# 结论：上面的结果都表明 Bash 中的变量是弱类型的。
exit $?