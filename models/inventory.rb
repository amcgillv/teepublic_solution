require 'json'
require 'io/console'
require_relative 'product'

class Inventory

 def initialize()
    @productToOptions = Hash.new
  end

  # builds hash map from product type to a hash of option name to set
  # of the actual options
  def parseInventory
    for p in Product.data
      if !(@productToOptions.has_key?(p["product_type"]))
        @productToOptions[p["product_type"]] = Hash.new
      end
      for o in p["options"].each_key
        if !@productToOptions[p["product_type"]].has_key?(o)
          @productToOptions[p["product_type"]][o] = Set.new
        end
        @productToOptions[p["product_type"]][o].add?(p["options"][o])
      end
    end
    @productToOptions
  end

  def searchOptions(input_type, input_options)
    mustHaves = Product.defineOptions(input_type, input_options, Hash.new)
    toReturn = Hash.new
    for product in Product.data
      if input_type.eql?(product["product_type"]) &&
         mustHaves["options"] <= product["options"]
        for o in product["options"].each_key
          if !mustHaves["options"].has_key?(o)
            if !toReturn.has_key?(o)
              toReturn[o] = Set.new
            end
            toReturn[o].add(product["options"][o])
          end
        end
      end
    end
      toReturn
  end

  def getOptions(input_type, input_options)
    toReturn = Hash.new
    if @productToOptions.has_key?(input_type)
      toReturn = searchOptions(input_type, input_options)
    else
      puts "No product of that type"
      $stdout.flush
    end
    toReturn
  end

end
