module Response
  extend ActiveSupport::Concern

  def response_index(data, message)
    page = params.key?(:page) ? params[:page].to_i : 1
    per_page = params.key?(:per_page) ? params[:per_page].to_i : 10
    result = Kaminari.paginate_array(data).page(page).per(per_page)
    render json: {
      data: result,
      total_data: result.total_count,
      total_page: result.total_pages,
      current_page: result.current_page,
      prev_page: result.prev_page,
      next_page: result.next_page,
      message: message
    }, status: 200
  end

  def response_error
    render json: {
      errors: 'sorry something wrong'
    }, status: 400
  end
end