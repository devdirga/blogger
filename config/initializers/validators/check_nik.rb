class Checknik < Grape::Validations::Validators::Base
  def validate_param!(attr_name, params)
    unless params[attr_name].length == 16
      fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: "must be at the most #{@option} characters long"
    end
  end
end

class Checkphone < Grape::Validations::Validators::Base
  def validate_param!(attr_name, params)
    unless params[attr_name].start_with?("62")
      # return { code: 35, message: ""}
      fail Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: "must be at the most #{@option} characters long"
    end
  end
end