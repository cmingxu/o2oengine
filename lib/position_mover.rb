module PositionMover
  def move_higher
    @instance.move_higher
    redirect_to :back
  end

  def move_lower
    @instance.move_lower
    redirect_to :back
  end
end
