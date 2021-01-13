class ApplicationController < ActionController::Base
  # Skipping to simplify CSRF to simplify demo
  skip_before_action :verify_authenticity_token

  def example_1
    render layout: "application"
  end

  def example_2
    render layout: "vue"
  end

  def example_3
    render layout: "vue"
  end

  def example_3_create
    render json: { comment: ActionController::Base.helpers.sanitize(params[:comment]) }
    # render json: { comment: params[:comment] }
  end
end
