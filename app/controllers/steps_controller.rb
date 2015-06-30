class StepsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def manifest
    render file: File.join(Rails.root, 'config', 'step_manifest.xml')
  end

  def clone
    result = {result: params[:value] }

    logger.info("result: #{result.to_json}")
    render text: "#{result.to_json}"
  end

  def shift
    if params[:value].present?
      result = {
        shifted_variable: params[:value][1..-1] ,
        result: params[:value][0]
      }
    else
      result = {
        shifted_variable: '' ,
        result: nil
      }
    end
    logger.info("result: #{result.to_json}")

    render text: "#{result.to_json}"
  end

end
