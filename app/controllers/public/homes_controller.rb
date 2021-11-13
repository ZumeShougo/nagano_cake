class Public::HomesController < ApplicationController

    def top
        @new_item = Item.last(4)
    end

    def about

    end

end
