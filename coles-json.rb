require 'json'

def print_hash

    my_hash.each { |k,v|
        puts "KEY #{k}"
        puts
        puts "VALUE #{v}"
    }

end

def print_cart

    json_from_file = File.read('coles-cart.json')
    my_hash = JSON.parse(json_from_file)

    my_hash["catalogEntryView"].each { |i|
        puts "CATEGORY #{i["a"]["P8"]}"
        puts "PRODUCT #{i["a"]["T2"]}"
        puts "PRICE #{i["p1"]["o"]}"
    }

end

def print_stock_list

    json_from_file = File.read('stock-list.json')
    my_hash = JSON.parse(json_from_file)

    my_hash["products"].each { |i|
        puts "CATEGORY #{i["a"]["P8"][0]}"
        puts "BRAND #{i["m"]}"
        puts "PRODUCT #{i["n"]}"
        puts "SIZE #{i["a"]["O3"][0]}"
        puts "PRICE %0.2f" % [i["p1"]["o"]]
    }

end

#
# Returns a 2D array containing product names at 0 and prices at 1.
#
def stock_list_to_a

    arr = [[],[]]

    json_from_file = File.read('stock-list.json')
    data_hash = JSON.parse(json_from_file)

    data_hash["products"].each_with_index { |i,index|
        product = i["m"] + " " + i["n"] + " " + i["a"]["O3"][0]
        price = i["p1"]["o"]
        arr[0] << product
        arr[1] << price
    }

    arr

end

def print_stock_list_array(arr)

    arr[0].each_with_index { |item,index|
        puts "#{item} #{"%0.2f" % arr[1][index]}"
    }

end

#
# Returns a string which can be pasted into a simple product names array.
#
def print_prod_names_as_array_vals(arr)

    s = ""
    arr[0].each { |p|
        s += '"' + p + '"' + ","
    }
    s.chomp!(",")
    
end

#
# Returns a string which can be pasted into a simple product prices array.
#
def print_prod_prices_as_array_vals(arr)
    s = ""
    arr[1].each { |p|
        s += "#{p.to_s},"
    }
    s.chomp!(",")
    puts s
end

#  print_stock_list_array(stock_list_to_a)
#  print_prod_names_as_array_vals(stock_list_to_a)
#  print_prod_prices_as_array_vals(stock_list_to_a)

