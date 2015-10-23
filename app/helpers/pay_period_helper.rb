module PayPeriodHelper

  def convert_allocations(sp)
    array = allocation_to_array(sp)
    clean = cleanup(array)
    allocation = convert_percentages(clean)
    return allocation
  end

  private

    def allocation_to_array(str) #takes user splits string as argument
      str.split(",").each_slice(2).to_a  #turns string to array, then turns it into a 2d array with a program and a decimal
    end


    def cleanup(arr)
      arr.each do |i|
        i.each do |x|
          x.strip!
        end
      end
    end

    def convert_percentages(arr)
      arr.each do |i|
        i[1] = i[1].to_f
      end
    end



end
