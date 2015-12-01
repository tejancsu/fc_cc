class Primes
  def get(n)
    return [2] if n==1
    primes = [2, 3]
    current = primes[-1]
    cntr = 2
    while(cntr < n)
      current += 1
      i = 0
      current_is_prime = true
      while(primes[i] && ((primes[i] * primes[i]) <= current))
        if(current % primes[i] == 0)
          current_is_prime = false
          break
        end
        i += 1
      end
      if current_is_prime
        primes << current
        cntr += 1
      end
    end
    return primes
  end
end

if __FILE__ == $0
  def print_first_row(primes, max_len)
    print "%-#{max_len}s" % ""
    primes.each {|i| print "%-#{max_len}d" % i}
    print "\n"
  end

  def print_delimiter_row(primes, max_len)
    print "%-#{max_len}s" % ""
    primes.each {|i| print "%-#{max_len}s" % '----'}
    print "\n"
  end

  def print_table(primes, max_len)
    primes.each do |j|
        print "%-#{max_len-1}d|" % j
        primes.each {|i| print "%-#{max_len}d" % (i*j)}
        print "\n"
    end
  end

  unless ARGV.length == 1
    puts ":booo: Not the right number of arguments."
    puts "Usage: ruby print_primes.rb <number of primes>"
    exit
  end

  n = ARGV[0].to_i
  primes = get(n)
  max_len = (primes.last * primes.last).to_s.size + 2
  print_first_row(primes, max_len)
  print_delimiter_row(primes, max_len)
  print_table(primes, max_len)
end