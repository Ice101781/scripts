require '../Math'


#create a method to determine if f(c) diverges or not and add it to the 'Imaginary' class

class Imaginary

  def julia(const)

    val = self

    k = 1

    while k <= 100

      if val.mod <= 2

        val = (val**2) + const

        k += 1

      else 

        return nil

      end

    end

    return self

  end

end


#create a user interface for the program

puts
puts
puts "This program generates Julia sets of the form 'f(z) = z^2 + c'."

c = Imaginary.new(3, 0)

until c.mod <= 2

  puts
  puts "Please select \'c\' so that its modulus is <= 2."
  puts
  puts

  puts
  puts "Real part of c?"
  puts

  c_re = gets

  puts
  puts "Imaginary part of c?"
  puts

  c_im = gets

  c = Imaginary.new(c_re, c_im)

end

puts
puts
puts "Thanks. Now computing the Julia set for c = #{c}..."
puts


time do

  #create the image from a mesh in polar form

  delta_phi = 0.0175

  delta_r = 0.01

  mesh_phi = (0..359).to_a.map {|m| (m*delta_phi).round(4)}

  mesh_r = (1..200).to_a.map {|n| (n*delta_r).round(2)}

  mesh = []


  points = []


  i = 0

  while i < mesh_r.length
    
    mesh << []

    j = 0

    while j < mesh_phi.length

      mesh[i][j] = Imaginary.new(mesh_r[i], 0)*(Imaginary.new(Math::E, 0)**(Imaginary.new(0, mesh_phi[j])))

      points << mesh[i][j].julia(c)

      j += 1

    end

    i += 1

  end

  points = points.compact.map {|comp| [comp.re, comp.im]}


  #save 'points' array to a CSV text file

  require 'csv'

  File.open("julia "+c.to_s+".csv", "w") {|f| f.write(points.inject([]) { |csv, row|  csv << CSV.generate_line(row) }.join(""))}

end