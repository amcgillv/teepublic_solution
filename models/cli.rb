require 'json'
require 'set'
require_relative 'product'
require_relative 'inventory'

# This class initializes and operates the client, interpreting and
# responding to user input.
class Cli

    STDOUT.puts("Please provide a product type...")
    STDOUT.flush

    product_instance = Product.new()
    inventory_instance = Inventory.new()
    inventory_instance.parseInventory()

    while true
      line = STDIN.readline()
      line.downcase!
      user_input = line.split
      if user_input.length() == 0
        STDOUT.puts("Please input a product type")
        STDOUT.flush
      else
        toWrite = inventory_instance.getOptions(user_input[0],user_input
          .slice(1,user_input.length() - 1).to_set)
        for key in toWrite.keys
          t = toWrite[key].to_s.gsub!(/[<{!@%&"#:}>]/,'').delete_prefix("Set")
          STDOUT.puts(key+ ": "+ t)
          STDOUT.flush
        end
      end
    end

end
