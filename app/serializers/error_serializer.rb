class ErrorSerializer
  def self.format_error(error_messages)
    messages = error_messages.map { |name, msg| "#{name.to_s.humanize} #{msg.first}" }
    {
      data: {
        id: nil,
        type: 'error',
        message: messages.join(' | ')
      }
    }
  end
end
