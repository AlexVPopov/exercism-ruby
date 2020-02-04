# frozen_string_literal: true

class InvalidCodonError < StandardError; end

class Translation
  CODONS_TO_PROTEINS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze

  def self.of_codon(codon)
    CODONS_TO_PROTEINS[codon]
  end

  def self.of_rna(sequence)
    codons = sequence.scan /.../

    raise InvalidCodonError unless (codons - CODONS_TO_PROTEINS.keys).empty?

    codons.reduce([]) do |proteins, codon|
      protein = CODONS_TO_PROTEINS[codon]

      return proteins if protein == 'STOP'

      proteins << protein
    end
  end
end
