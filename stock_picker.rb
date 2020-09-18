require 'pry'

def stock_picker(stock_array)
  best_buy = best_sell = 0
  profit = 0
  days = stock_array.length - 1
  for buy in 0..days do
    for sell in buy..days do
      current_buy = stock_array[buy]
      current_sell = stock_array[sell]
      if ((current_sell - current_buy) >= profit)
        best_buy = buy
        best_sell = sell
        profit = current_sell - current_buy
      end
    end
  end
  return [best_buy, best_sell]
end

def run()
  print "TYPE Q TO QUIT\n"
  while true do
    print "Enter stock market history (format: day1 day2 day3): "
    stock_array = gets.chomp.split(' ')
    if (stock_array[0].eql?('Q'))
      break
    end
    stock_array.map! { |price| price.to_i}
    print stock_picker(stock_array)
    print "\n"
  end
end

run()