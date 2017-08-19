class TwintsController < ApplicationController
    def index
        @twint = Twint.new
        @twints = Twint.all
    end
    
    def create
        Twint.create(twints_params)
        redirect_to twints_path, success: "ツゥイントしました！"
    end
    
    def confirm
        @twint = Twint.new(twints_params)
        if @twint.invalid?
            @twint.errors.full_messages.each do |msg|
                #これたぶんためだ・・・
                #複数エラーがあったときの挙動・・・
                redirect_to twints_path, danger: msg
            end
        end
    end
    
    def edit
        @twint = Twint.find(params[:id])
    end
    
    private
    def twints_params
      params.require(:twint).permit(:content)
    end
end
