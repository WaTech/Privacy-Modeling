class Admin::RulesController < ApplicationController
  PAGE_LENGTH = 5

  def index
    @records_total = Rule.count
    @draw = params[:draw].to_i
    @rules = Rule.all.order(:id).page(page_number)

    respond_to do |format|
      format.html
      format.json
      format.csv { render text: Rule.to_csv }
    end

  end

  def update
    @rule = Rule.find params[:id]

    if @rule.update rule_params
      render json: {}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end

  def rule_params
    params.require(:rule).permit(:restriction)
  end
end
