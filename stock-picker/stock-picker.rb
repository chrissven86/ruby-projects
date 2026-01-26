def stock_picker(prices)
  min_price = prices[0]
  min_day = 0

  max_profit = 0
  best_days = [0, 0]

  prices.each_with_index do |price, day|
    # Check profit if we sold today
    profit = price - min_price
    if profit > max_profit
      max_profit = profit
      best_days = [min_day, day]
    end

    # Update minimum price (buy day)
    if price < min_price
      min_price = price
      min_day = day
    end
  end

  best_days
end

prices = [17,3,6,9,15,8,6,1,10]
puts stock_picker(prices)