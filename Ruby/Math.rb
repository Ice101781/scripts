############################################################################################################################

#compute time elapsed

def time

  start = Time.now 

  yield

  elapsed = Time.now - start

  puts "Time required: #{elapsed} seconds."
  puts
  puts

end

############################################################################################################################

#create a method which calculates factorials for natural numbers

  def fact(n=0)

    if n == 0 then 1

    else n*fact(n-1) end

  end


#create two methods which approximate the sine and cosine functions between -2pi and 2pi, and which are still valid for all x in R, using Taylor series centered at zero

  def sine(x)

    if x >= (-2*Math::PI) && x <= (2*Math::PI) 

      (0..10).to_a.inject(0) {|sum, k| sum + ((((-1)**k).to_f/fact((2*k)+1).to_f)*(x**((2*k)+1)))}

    else 

      x = ((x/(2*Math::PI))-(x/(2*Math::PI)).round(0))*(2*Math::PI)

      sine(x)

    end

  end


  def cosine(x)

    if x >= (-2*Math::PI) && x <= (2*Math::PI) 

      (0..10).to_a.inject(0) {|sum, k| sum + ((((-1)**k).to_f/fact(2*k).to_f)*(x**(2*k)))}

    else 

      x = ((x/(2*Math::PI))-(x/(2*Math::PI)).round(0))*(2*Math::PI)

      cosine(x)

    end

  end

############################################################################################################################

#create a class for Imaginary numbers

  class Imaginary

    def initialize(real, imag)
      
      @re = real.to_f
      @im = imag.to_f

    end

    #create methods which provide the real and imaginary parts of the number

      def re

        return @re

      end  


      def im

        return @im

      end
    
    #create a method which provides the string representation of the imaginary number
      
      def to_s

        return "#{@re}" if (@im == 0)
        
        return "#{@im}i" if (@re == 0)
       
        return "#{@re}-#{-@im}i" if (@im < 0) 
       
        return "#{@re}+#{@im}i"
      
      end
    
    #create a method which computes the modulus of the imaginary number

      def mod

        return (((@re)**2+(@im)**2)**0.5)

      end

    #create a method which computes the phase angle of the imaginary number. Note that this method
    #uses the Taylor series for arcsin(x), which is known to converge very slowly

      def tansign

        return  1  if @im/@re >  0
        return -1  if @im/@re <  0
        return  0  if @im/@re == 0        

      end
            
      def arctan

        if (@im/@re) >= -1 && (@im/@re) <= 1

          (0..200).to_a.inject(0) {|sum, k| sum + ((((-1)**k)*((@im/@re)**((2*k)+1)))/((2*k)+1))}

        else

          (tansign*(Math::PI/2))-(0..5000).to_a.inject(0) {|sum, k| sum + ((((-1)**k)*((@re/@im)**((2*k)+1)))/((2*k)+1))}

        end             
       
      end
      
      def ang

        return arctan if @im > 0 && @re >= 0
        return (arctan + 2*Math::PI) if @im < 0 && @re >= 0
        return (arctan + Math::PI) if @re < 0        
        return 0.to_f if @im == 0 

      end 
  
    #define addition, subtraction, multiplication, division, logarithmic and exponential functions for the class  

      def +(num=0.to_f)

        if num.class == Imaginary then return Imaginary.new(self.re + num.re, self.im + num.im)

        else return Imaginary.new((self.re + num), self.im)

        end

      end

      def -(num=0.to_f)

        if num.class == Imaginary then return Imaginary.new(self.re - num.re, self.im - num.im)

        else return Imaginary.new((self.re - num), self.im)

        end

      end

      def *(num=1.to_f)

        if num.class == Imaginary then return Imaginary.new((self.re*num.re)-(self.im*num.im), (self.re*num.im)+(self.im*num.re))

        else return Imaginary.new((self.re*num), (self.im*num))

        end       

      end   

      def /(num=1.to_f)

        if num.class == Imaginary then return Imaginary.new(((self.re*num.re)+(self.im*num.im))/(num.re**2+num.im**2), ((self.im*num.re)-(self.re*num.im))/(num.re**2+num.im**2))

        else return Imaginary.new((self.re/num), (self.im/num))

        end

      end

      def ln

        return Imaginary.new(Math.log(self.mod), self.ang)

      end

      def **(num=1.to_f)

        if num.class != Imaginary then num = Imaginary.new(num, 0) end

        return Imaginary.new(cosine((num.re*self.ang)+(num.im*0.5*Math.log(self.re**2+self.im**2))), sine((num.re*self.ang)+(num.im*0.5*Math.log(self.re**2+self.im**2)))) * ((Math::E)**(-num.im*self.ang)) * ((self.re**2+self.im**2)**(num.re*0.5))

      end

  end

############################################################################################################################