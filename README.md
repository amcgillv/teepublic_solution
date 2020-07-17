# TeePublic Solution

## Installation and Getting Started

##### Using Git
1. In the terminal, navigate to a folder where in you'd like to have the program stored.
2. Clone the repo using the following command: `clone https://github.com/amcgillv/teepublic_solution.git`
3. Now you are ready to run the program. The default run command is the following:
`ruby models/cli.rb`
This command will open a CLI where you can enter a product type `tshirt`, `sticker`, or `mug` along with options associated with the product.

##### Downloading Compressed File
1. Unzip file in a folder where you would like to store the program.
2. In the terminal, navigate to the folder where you've unzipped the file.
3. Now you are ready to run the program. The default run command is the following:
`ruby models/cli.rb`
This command will open a CLI where you can enter a product type `tshirt`, `sticker`, or `mug` along with options associated with the product.

## Running Test Locally
Tests are in `spec/inventory_spec.rb`. You can run these with `bundle exec rspec`. Run individual sections of the test with `bundle exec rspec -t getOptions` and `bundle exec rspec -t parseInventory`.

## Invalid Inputs Handling
If you input a product type that is not in the data, you'll receive a `No product of that type` as the response.

If you input product options that aren't available for the given product type, the program responds with appropriate available options along with a message that $x$ product option is not a valid product option. For example, `tshirt itsy-bitsy red` will return
```
itsy-bitsy is not a valid option for tshirts
gender:  male, female
size:  small, medium, large, extra-large, 2x-large
```
## Potential for Improvements to Solution
I imagine an ideal solution would reformat the user input to create a mask that could be AND-ed across the product data, filtering out products and options that do not align with the input. Then, the program would return the options types not given by the user.
