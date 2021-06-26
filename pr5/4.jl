function eval_diff_poly(x,A,k)
    k_copy = k
    div=0
    poly=0

    while k_copy > 1
        for a in A
            println(a, ": ", poly, " ", div)
            div=div*x+poly
            poly=poly*x+a
        end
        println("#")
        poly = div
        div = 0
        k_copy-=1
    end
    for a in A
        println(a, ": ", poly, " ", div)
        div=div*x+poly
        poly=poly*x+a
    end
    println("DONE")
    return div,poly
end