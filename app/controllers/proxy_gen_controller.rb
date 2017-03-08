class ProxyGenController < ApplicationController
  def entry
  end

  def build
    deck = params[:Deck] + "\n"
    deck = deck.strip.gsub(/[\n]+/, "\n");
    puts "==== DECK ===="
    puts deck
    @bad_cards = ""
    @ismalformed = false
    @links = Array.new
    deck.each_line do |line|
        if (line == nil || line.length <= 2)
            @ismalformed = true
            @bad_cards = @bad_cards + line + "\n"
            next
        end
        val = line.split(" ", 2)[0].to_i
        card = line.split(" ", 2)[1].gsub(" ", "%20")
        if (val == 0)
            @bad_cards = @bad_cards + line  + "\n"
            @ismalformed = true
        end

        val.times do |counter|
            @links << ('http://yugiohprices.com/api/card_image/' + card)
        end
    end

    @links.each { |x| puts x}
  end
end
