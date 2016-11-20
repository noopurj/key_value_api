class KeysController < ApplicationController
  def get_value
    key = Key.where(data: params[:data]).first
    if (params.has_key?(:timestamp)) && !key.blank?
      timestamp = params[:timestamp]
      time = DateTime.parse(Time.at(timestamp.to_i).utc.strftime("%I.%M%p"))
      if time > DateTime.parse(key.values.last.time)
        render json: key.values.last.data
      else
        key.values.each_with_index do |value, index|
          if time == DateTime.parse(value.time)
            render json: value.data
          elsif time < DateTime.parse(value.time)
            render json: key.values[index-1].data and return
          end
        end
      end
    elsif !key.blank?
      render json:  key.values.last.data
    else
      render json: 'Sorry invalid key'
    end
  end

  def check_body
    request_body = ActiveSupport::JSON.decode request.body.read
    time = request.headers['Time']
    request_body.each do |keyname, value_data|
      key = Key.where(data: "#{keyname}").first
      if key.blank?
        key = Key.create(data: keyname)
      end
      value = Value.create(data: value_data, time: time, key_id: key.id)
      key.values << value
      if key.save
        render json: key
      else
        render json: key.errors
      end
    end
  end

end
