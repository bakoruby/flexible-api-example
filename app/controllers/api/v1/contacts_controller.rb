class Api::V1::ContactsController < ApplicationController

  def index
    @contacts = Contact.eager_load(sanitized_includes).
      search(search_params).result

    render({json: @contacts}.merge(serializer_includes))
  end

  def show
    @contact = Contact.eager_load(sanitized_includes).
      find(params[:id])

    render({json: @contact}.merge(serializer_includes))
  end

  private

  def serializer_includes
    sanitized_includes.reduce({}) do |results, include|
      results["include_#{include}"] = true
      results
    end
  end


  def sanitized_includes
    symbolize_includes.inject([]) do |result, include_param|
      result << include_param if Contact.reflect_on_association(include_param)
      result
    end
  end

  def symbolize_includes
    Array(params[:includes]).collect(&:to_sym)
  end

  def search_params
    params[:q]
  end
end
