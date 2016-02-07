class Candidate

  attr_accessor :name, :occ, :hobby, :home
  def initialize(name, occ:, hobby: nil, home: nil)
    self.name = name
    self.occ = occ
    self.hobby = hobby
    self.home = home
  end
end