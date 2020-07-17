require 'json'
require_relative 'product'

# This class sifts through all products, finding products that match the user's
# input.

class Inventory

  def initialize
    @productToOptions = Hash.new
  end

  # parseInventory builds hash map from product type
  # to a hash of option name to set of the actual options.
  # Return
  #      @productToOptions updated with Product data
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

  # searchOptions is a helper method that builds a hash with all
  # of the options not given by the user.
  # Input:
  #     input_type (String): product type given by the user
  #     input_options (Set): options given by user, if any
  # Return:
  #     A hash with product option types mapped to the available options
  #     with user provided options excluded
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

  # getOptions is a helper method that builds a hash with all
  # of the options not given by the user.
  # Input:
  #     input_type (String): product type given by the user
  #     input_options (Set): options given by user, if any
  # Return:
  #     Print the message that there's no product of that type if input_type
  #     in not avaliable, and returns an empty Hash.
  #     Otherwise, it returns a hash with product option types mapped to the
  #     available options with user provided options excluded.
  def getOptions(input_type, input_options)
    toReturn = Hash.new
    if @productToOptions.has_key?(input_type)
      toReturn = searchOptions(input_type, input_options)
    else
      puts "No product of that type"
      STDOUT.flush
    end
    toReturn
  end

end
