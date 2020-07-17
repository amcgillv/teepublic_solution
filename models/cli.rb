require 'json'
require 'set'
require_relative 'product'
require_relative 'inventory'


class Cli

    $stdout.puts("Please provide a product type...")
    $stdout.flush

    product_instance = Product.new()
    inventory_instance = Inventory.new()
    inventory_instance.parseInventory()

    while true
      line = $stdin.readline()
      line.downcase!
      user_input = line.split
      if user_input.length() == 0
        $stdout.puts("Please input a product type")
        $stdout.flush
      else
        toWrite = inventory_instance.getOptions(user_input[0],user_input
          .slice(1,user_input.length() - 1).to_set)
        for key in toWrite.keys
          t = toWrite[key].to_s.gsub!(/[<{!@%&"#:}>]/,'').delete_prefix("Set")
          $stdout.puts(key+ ": "+ t)
          $stdout.flush
        end
      end
    end

end
