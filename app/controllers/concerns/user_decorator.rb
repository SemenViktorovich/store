module UsersDecor
  extend ActiveSupport::Concern



  def name_or_email
   return name if name.present?

    email.split('@')[0]
  end

end