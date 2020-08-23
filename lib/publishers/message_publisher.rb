module Publishers
  class MessagePublisher
    def self.publish(message)
      x = channel.direct("order_created.messages")
      x.publish(message.as_json, :persistent => true, :routing_key => 'order_service.order.created')
    end
    def self.channel
      @channel ||= connection.create_channel
    end

    def self.connection
      @conn = Bunny.new(APP_CONFIG['rabbitmq.amqp']) # getting configuration from rabbitmq.yml
      @conn.start
    end
  end
end
