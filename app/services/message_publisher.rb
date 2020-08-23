class MessagePublisher
  def self.publish(message)
    x = channel.direct("challenge")
    x.publish(message.as_json, :persistent => true, :routing_key => 'order_service.order.created')
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @conn = Bunny.new(host: 'localhost', port: '5672', vhost: '/', user: 'guest', pass: 'guest')
    @conn.start
  end
end