module Validations
  def validate_phone(*attributes)
    error_message = 'is an invalid phone number, must contain at least 5 digits, only the following characters are allowed: 0-9/-()+'
    attributes.each do |attribute|
      self.errors.add(attribute, error_message) unless valid_phone?(self.send(attribute))
    end
  end    


  def validate_url(*attributes)
    error_message = 'is an invalid url'
    attributes.each do |attribute|
      self.errors.add(attribute, error_message) unless valid_url?(self.send(attribute))
    end
  end    

  def valid_phone?(number)
    return true if number.nil?

    n_digits = number.scan(/[0-9]/).size
    valid_chars = (number =~ /^[+\/\-() 0-9]+$/)
    return n_digits > 5 && valid_chars
  end  


  def valid_url?(url)
    true
  end  
end

