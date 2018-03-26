class PreparePipe < SimpleDelegator

  def initialize(pipe)
    __setobj__(pipe)
  end

  def phases
    PhaseField.cards_phase.where(pipe: id)
  end
end
  