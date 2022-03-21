class ApplicationForm < Reform::Form
  def full_messages
    errors.messages.map { |attribute, message| full_message(attribute, message) }.join('. ')
  end

  private

  def full_message(attribute, message)
    return message if attribute == :base

    attr_name = attribute.to_s.tr('.', '_').humanize
    attr_name = model.class.human_attribute_name(attribute, default: attr_name)

    "#{attr_name} #{message.join(', ')}"
  end
end