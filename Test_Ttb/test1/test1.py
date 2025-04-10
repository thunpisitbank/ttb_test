
list_a = [1, 2, 3, 5, 6, 8, 9]
list_b = [3, 2, 1, 5, 6, 0]
duplicates = []

def function_check_dup(list_a,list_b,duplicates):
    for item in list_a:    
        if item in list_b:        
            duplicates.append(item)
    return duplicates        


print(" duplicate items:", function_check_dup(list_a,list_b,duplicates))