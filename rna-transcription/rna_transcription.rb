# frozen_string_literal

class Complement
  DNA, RNA = 'ACGT'.freeze, 'UGCA'.freeze

  def self.of_dna(dna)
    dna.tr(DNA, RNA)
  end

  def self.of_rna(rna)
    rna.tr(RNA, DNA)
  end
end
