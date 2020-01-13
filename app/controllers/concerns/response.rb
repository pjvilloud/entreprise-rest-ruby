module Response
  extend ActiveSupport::Concern
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def json_response_with(object, status = :ok, with)
    render json: object, status: status, include: with
  end

  def json_page_response(object, status = :ok)
    objectWithPage = {
        content: object,
        totalPages: (object.total_count / object.size).ceil,
        totalElements: object.total_count,
        numberOfElements: object.size,
        number: object.current_page - 1,
        size: object.size,
        pageable: {
            pageNumber: object.current_page - 1,
            pageSize: object.size,
        },

    }
    render json: objectWithPage, :status= => :ok
  end
end