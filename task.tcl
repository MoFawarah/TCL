
#Sorting
proc findMinValueIndex {list start} {
    set minIndex $start
    set minValue [lindex $list $start]
    set arrLength [llength $list]

    for {set i $start} {$i < $arrLength} {incr i} {
        if {[lindex $list $i] < $minValue} {
            set minValue [lindex $list $i] 
            set minIndex $i
        }
    }

    return $minIndex
}

proc swap {list i j} {
    set temp [lindex $list $i]
    set list [lreplace $list $i $i [lindex $list $j]]
    set list [lreplace $list $j $j $temp]
    return $list
}

proc sort {list} {
    set arrLength [llength $list]
    for {set i 0} { $i < $arrLength - 1} {incr i} {
        set minIndex [findMinValueIndex $list $i]
        if {$minIndex != $i} {
        set list [swap $list $i $minIndex]
        }
    }

    return $list
}


#Reverse String
proc splitString {text delim} {
    set word ""
    set wordsList {}

    for {set i 0} {$i < [string length $text]} {incr i} {
        set char [string index $text $i]
        if {$char eq $delim} {
            lappend wordsList $word
            set word ""
        } else {
            append word $char
        }
    }

    if {$word ne ""} {
        lappend wordsList $word
    }

    return $wordsList
}


proc reverseList {wordsList} {
    set reversedText ""
    for {set i [expr {[llength $wordsList] - 1}]} {$i >= 0} {incr i -1} {
        append reversedText "[lindex $wordsList $i]"
        if {$i != 0} {
            append reversedText " "
        }
    }

    return $reversedText
}

proc reverse {text {delim " "}} {
    set wordList [splitString $text $delim]
    set reversedText [reverseList $wordList]
    
    return $reversedText
}


puts [sort {3 6 8 7 0 1 4 2 9 5}]

puts [reverse "TCL,is,a,Tool,Command,Language" ","]
puts [reverse "Welcome to you"]
puts [reverse "Live life to the fullest!"]






