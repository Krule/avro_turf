class AvroTurf
  class Message
    attr_reader :schema, :value
    Schema = Struct.new(:id, :name, :namespace, :fullname, :fields)

    def initialize(value, id, schema)
      @value = value
      @schema = Schema.new(
        id,
        schema.name,
        schema.namespace,
        schema.fullname,
        schema.fields_hash.map { |_, v| JSON.parse(v.to_s) }
      )
    end
  end
end
