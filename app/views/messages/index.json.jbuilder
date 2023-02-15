json.array! @messages do |message|
  json.html render(partial: 'messages/message', formats: :html, locals: { message: message })
end
