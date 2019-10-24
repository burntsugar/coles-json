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

