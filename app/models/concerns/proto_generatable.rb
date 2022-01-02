# frozen_string_literal: true

module ProtoGeneratable
  extend ActiveSupport::Concern

  def proto_string(value)
    value.nil? ? nil : Google::Protobuf::StringValue.new(value: value.to_s)
  end

  def proto_int32(value)
    value.nil? ? nil : Google::Protobuf::Int32Value.new(value: value.to_i)
  end

  def proto_int64(value)
    value.nil? ? nil : Google::Protobuf::Int64Value.new(value: value.to_i)
  end

  def proto_bool(value)
    value.nil? ? nil : Google::Protobuf::BoolValue.new(value: value)
  end

  def proto_double(value)
    value.nil? ? nil : Google::Protobuf::DoubleValue.new(value: value)
  end

  def proto_int64_array(values)
    return [] if values.blank?

    values.compact.uniq.each_with_object([]) do |val, arr|
      arr << proto_int64(val)
    end
  end
end
