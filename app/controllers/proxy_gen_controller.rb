class ProxyGenController < ApplicationController
  def entry
  end

  def build
    deck = params[:Deck] + "\n"
    deck = deck.strip.gsub(/[\n]+/, "\n");
    puts "==== DECK ===="
    puts deck
    @bad_lines = ""
    @ismalformed = false
    @links = Array.new
    deck.each_line do |line|
        if (line.length <= 2)
            next
        end
        val = line.split(" ", 2)[0].to_i
        card = line.split(" ", 2)[1].gsub(" ", "%20")
        if (val == 0)
            @bad_cards += line + "\n"
        end

        val.times do |counter|
            @links << ('http://yugiohprices.com/api/card_image/' + card)
        end
    end

    @links.each { |x| puts x}
  end
end
