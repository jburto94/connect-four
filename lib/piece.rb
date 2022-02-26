module Piece
  def blue_piece
    "\e[34m\u25cf\e[0m"
  end

  def red_piece
    "\e[31m\u25cf\e[0m"
  end

  def empty_piece
    "\u25cf"
  end
end