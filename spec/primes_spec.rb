require_relative '../primes'

describe "Primes" do
  describe "#get" do
    it 'returns array of n primes' do
      Primes.new.get(5).size.should == 5
    end

    it 'returns 2 if n=1' do
      Primes.new.get(1).should == [2]
    end

    it 'returns [2, 3] if n=2' do
      Primes.new.get(2).should == [2, 3]
    end

    it 'returns expected primes when n=10' do
      Primes.new.get(10).should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    end
  end
end
