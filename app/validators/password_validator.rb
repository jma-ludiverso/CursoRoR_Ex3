class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$\z/					
      record.errors[attribute] << (options[:message] || "must contains at least 8 character, one number and one letter")
    end
  end
end
