function iter_type(k)
    powset=collect(k)
    for x in na
        for i in range(len(powset))
            if k == i
                tmp_list = deepcopy(powset[i])
                tmp_list.insert(x)
                powset.insert!(tmp_list)
            end
        end
    end
    print(powset)
end