class FizzBuzz

  def self.fizzbuzz
    (1..100).each do |num|

      fizz = num % 3 == 0
      buzz = num % 5 == 0
      fizzbuzz = fizz && buzz

      text = ''

      if fizzbuzz
        text << "FizzBuzz"
      elsif fizz
        text << "Fizz"
      elsif buzz
        text << "Buzz"
      else
        text << num.to_s
      end

      puts text
    end
  end

  def self.prime
    (2..100).each do |num|
      prime = true
      (2..num).each do |inner_num|
        if inner_num > 0 && inner_num != num
          if num % inner_num == 0 #mod0 = not prime
            prime = false
            break
          end
        end
      end
      puts "#{num} is prime" if prime

    end

  end

end

FizzBuzz.prime