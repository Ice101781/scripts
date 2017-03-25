require '../Math'


#create a method that will express the reciprocal Riemann Zeta function in terms of the Dirichlet Eta function

class Imaginary

  def recip_zeta

    @s = self

    @a = Imaginary.new(1,0)    

    @b = Imaginary.new(2,0)

    @c = Imaginary.new(-1,0)

    sum = Imaginary.new(0,0)
 
    i = 1

    while i <= 50

      sum += (@c**(i+1))/(Imaginary.new(i,0)**(@s))

      i += 1

    end

    return (@a-@b**(@a-@s)) / sum

  end

end


#create a user interface for the console

puts
puts
puts "Choose from the following options:"
puts 
puts 
puts "     1) Create a surface plot of the reciprocal Riemann Zeta Function" 
puts
puts "     2) Exit the program"
puts
puts

select = gets


if select.to_i == 1 then 

  puts
  puts 
  puts "Where should the graph stop along the Imaginary axis?   (Enter 23 for '23i', etc.)"
  puts
 
  imag_bound = gets

  puts
  puts
  puts
  puts
  puts "Thanks. Now working..."
  puts
  puts

  time do

    #create the surface from a 2D mesh of the complex plane

    mesh = []

    i = 0

    while i < 190

      mesh << []

      j = 0

      while j < imag_bound.to_i/0.1

        mesh[i][j] = Imaginary.new((i+1)*0.005, (j+1)*0.1).recip_zeta.mod

        j += 1

      end

      i += 1

    end


    #save output to a CSV text file

    require 'csv'

    File.open("recip_zeta to "+imag_bound.to_s.chomp+"i.csv", "w") {|f| f.write(mesh.inject([]) { |csv, row|  csv << CSV.generate_line(row) }.join(""))}

  end

elsif select.to_i == 2 then

  puts
  puts
  puts
  puts
  puts "Don't you like the primes?"
  puts
  puts

else until select.to_i == 1 || select.to_i == 2

  puts
  puts
  puts "Please enter either '1' or '2'"
  puts

  select = gets

end end